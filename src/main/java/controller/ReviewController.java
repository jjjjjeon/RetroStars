/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.MemberDAO;
import dao.ReviewDAO;
import dto.ReviewDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
@WebServlet("*.review")
public class ReviewController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
		HttpSession session = request.getSession();
        String cmd = request.getRequestURI();
        PrintWriter pw = response.getWriter();
        ReviewDAO reviewDao = ReviewDAO.getInstance();        
        MemberDAO memberDao = MemberDAO.getInstance();
        
        try {
        	String userId1 = (String) session.getAttribute("loginId");
        	boolean isAdmin = userId1 != null && memberDao.isAdmin(userId1);
        	
        	// 가장 평가가 많은 리뷰.
            if (cmd.equals("/mostLiked.review")) {

                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                // 하나만 가져와서 HashMap
                HashMap<String, ?> mostLikedReview = reviewDao.getMostLikedReview(gameSeq);
                String result = gson.toJson(mostLikedReview);
                pw.append(result);
                
            }
            
            // 좋아요 업데이트. 
            else if (cmd.equals("/updateReviewLike.review")) {
                if (userId1 == null) {
                    pw.append("{\"result\":\"not_logged_in\"}");
                    return;
                }

                int reviewSeq = Integer.parseInt(request.getParameter("reviewSeq"));
                String type = request.getParameter("type");

                try {
                    reviewDao.updateReviewLike(reviewSeq, userId1, type);
                    pw.append("{\"result\":\"success\"}");
                } catch (SQLException e) {
                	// 에러코드 20001 or 20002면 중복
                    if (e.getErrorCode() == -20001 || e.getErrorCode() == -20002) {
                        pw.append("{\"result\":\"duplicate\"}");
                    } else if(e.getErrorCode() == -20003) {
                    	// 이미 싫어요 누름
                    	pw.append("{\"result\":\"already_disliked\"}");
                    } else if(e.getErrorCode() == -20004) {
                    	// 이미 좋아요 누름
                    	pw.append("{\"result\":\"already_liked\"}");
                    } else {
                        throw e;
                    }
                }
            } 
            // 가장 최근에 작성된 리뷰. 현재 사용되지 않는다.
            else if (cmd.equals("/latest.review")) {
                ReviewDTO latestReview = reviewDao.getLatestReview();
                String result = gson.toJson(latestReview);
                pw.append(result);
                System.out.println(result);
            } 
           
            //리뷰 보여주기 
            else if (cmd.equals("/list.review")) {
            	// null이 아니면 getParameter로 가져온 sortType을 가져오고 아니면 기본적으로는 좋아요
                String sortType = request.getParameter("sortType") != null ? request.getParameter("sortType") : "review_date";
                // null 이 아니면 받아온 cpage를 가져오고 아니면 1
                int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
                int startNum = cpage * 10 - 9;
                int endNum = cpage * 10;

                String gameSeqStr = request.getParameter("gameSeq");
                ArrayList<HashMap<String, Object>> list;
 
                String userId = (String) session.getAttribute("loginId"); // 로그인된 유저 아이디 가져오기
                int reviewCount;

                if (gameSeqStr != null) {
                    try {
                        int gameSeq = Integer.parseInt(gameSeqStr);
                        list = reviewDao.getReviewsByGameSeq(gameSeq, sortType, startNum, endNum);
                        reviewCount = reviewDao.getReviewCountByGameSeq(gameSeq);
                        request.setAttribute("gameSeq", gameSeq);
                    } catch (NumberFormatException e) {
                    	
                        // gameSeq가 숫자가 아닌 경우 전체 리뷰를 보여주도록 설정
                    	// 근데 try catch로 강제적으로 이렇게 해도 될까?
                        list = reviewDao.getAllReviews(sortType, startNum, endNum);
                        reviewCount = reviewDao.getReviewCount();
                        request.setAttribute("gameSeq", null);
                        
                    }
                } else {
                	
                    list = reviewDao.getAllReviews(sortType, startNum, endNum);
                    reviewCount = reviewDao.getReviewCount();
                }
                for (HashMap<String, Object> review : list) {
                    int reviewSeq = (int) review.get("reviewSeq");
                    String status = reviewDao.getUserLikeDislikeStatus(reviewSeq, userId);
                    review.put("isLiked", "like".equals(status));
                    review.put("isDisliked", "dislike".equals(status));
                }

                request.setAttribute("list", list);
                request.setAttribute("userId", userId);
                request.setAttribute("cpage", cpage);
                request.setAttribute("reviewCount", reviewCount);
                request.setAttribute("sortType", sortType);
                request.getRequestDispatcher("/rboard/reviewBoard.jsp").forward(request, response);
            } 
            
            
            else if (cmd.equals("/addReview.review")) {
                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                String reviewContent = request.getParameter("reviewContent");
                String userId = (String) session.getAttribute("loginId"); // 로그인된 유저 아이디 가져오기

                ReviewDTO newReview = new ReviewDTO();
                newReview.setGameSeq(gameSeq);
                newReview.setUserId(userId);
                newReview.setReviewContent(reviewContent);

                int result = reviewDao.addReview(newReview);
                if (result > 0) {
                    pw.append("{\"result\":\"success\"}");
                } else {
                    pw.append("{\"result\":\"error\"}");
                }
            } 
            
            // review를 작성한 작성자이거나 관리자면 같으면 삭제가능.
            else if (cmd.equals("/deleteReview.review")) {
                int reviewSeq = Integer.parseInt(request.getParameter("reviewSeq"));
                ReviewDTO review = reviewDao.getReviewBySeq(reviewSeq);
                if (review.getUserId().equals(userId1) || isAdmin) {
                    reviewDao.deleteReview(reviewSeq);
                    pw.append("{\"result\":\"success\"}");
                } else {
                    pw.append("{\"result\":\"unauthorized\"}");
                }
            }
            
            else if (cmd.equals("/updateReview.review")) {
                int reviewSeq = Integer.parseInt(request.getParameter("reviewSeq"));
                String reviewContent = request.getParameter("reviewContent");
                ReviewDTO review = reviewDao.getReviewBySeq(reviewSeq);
                if (review.getUserId().equals(userId1)) {
                    review.setReviewContent(reviewContent);
                    reviewDao.updateReview(review);
                    pw.append("{\"result\":\"success\"}");
                } else {
                    pw.append("{\"result\":\"unauthorized\"}");
                }
            }
        
        } catch (Exception e) {
            e.printStackTrace();
            pw.append("{\"result\":\"error\"}");
        }
    }
}