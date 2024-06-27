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

        String cmd = request.getRequestURI();
        System.out.println(cmd);
        ReviewDAO reviewDao = ReviewDAO.getInstance();
        PrintWriter pw = response.getWriter();
        MemberDAO memberDao = MemberDAO.getInstance();
        
        try {
        	String userId1 = (String) request.getSession().getAttribute("loginId");
        	boolean isAdmin = userId1 != null && memberDao.isAdmin(userId1);
        	
            if (cmd.equals("/mostLiked.review")) {

                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                HashMap<String, ?> mostLikedReview = reviewDao.getMostLikedReview(gameSeq);
                System.out.println(mostLikedReview);
                String result = gson.toJson(mostLikedReview);
                pw.append(result);
                System.out.println("가장평가가 좋은 " + result);
                
            }else if (cmd.equals("/updateReviewLike.review")) {
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
                    if (e.getErrorCode() == -20001 || e.getErrorCode() == -20002) {
                        pw.append("{\"result\":\"duplicate\"}");
                    } else {
                        throw e;
                    }
                }
            } else if (cmd.equals("/latest.review")) {
                ReviewDTO latestReview = reviewDao.getLatestReview();
                String result = gson.toJson(latestReview);
                pw.append(result);
                System.out.println(result);
            } else if (cmd.equals("/updateReviewLike.review")) {
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
                    if (e.getErrorCode() == -20001 || e.getErrorCode() == -20002) {
                        pw.append("{\"result\":\"duplicate\"}");
                    } else {
                        throw e;
                    }
                }
            }  else if (cmd.equals("/list.review")) {
                String sortType = request.getParameter("sortType") != null ? request.getParameter("sortType") : "review_like";
                int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
                int startNum = cpage * 10 - 9;
                int endNum = cpage * 10;

                String gameSeqStr = request.getParameter("gameSeq");
                ArrayList<HashMap<String, ?>> list;
                String userId = (String) request.getSession().getAttribute("loginId"); // 로그인된 유저 아이디 가져오기
                int reviewCount;

                if (gameSeqStr != null) {
                    try {
                    	System.out.println("게임 하나");
                        int gameSeq = Integer.parseInt(gameSeqStr);
                        list = reviewDao.getReviewsByGameSeq(gameSeq, sortType, startNum, endNum);
                        reviewCount = reviewDao.getReviewCountByGameSeq(gameSeq);
                        request.setAttribute("gameSeq", gameSeq);
                    } catch (NumberFormatException e) {
                    	System.out.println(e);
                        // gameSeq가 숫자가 아닌 경우 전체 리뷰를 보여주도록 설정
                    	System.out.println("전체구간");
                        list = reviewDao.getAllReviews(sortType, startNum, endNum);
                        System.out.println(sortType + startNum + endNum + list);
                        reviewCount = reviewDao.getReviewCount();
                        
                        request.setAttribute("gameSeq", null);
                        
                    }
                } else {
                	System.out.println("2번 구간");
                    list = reviewDao.getAllReviews(sortType, startNum, endNum);
                    reviewCount = reviewDao.getReviewCount();
                }

                request.setAttribute("list", list);
                System.out.println(list);
                request.setAttribute("userId", userId);
                request.setAttribute("cpage", cpage);
                request.setAttribute("reviewCount", reviewCount);
                request.setAttribute("sortType", sortType);

                request.getRequestDispatcher("/rboard/reviewBoard.jsp").forward(request, response);
            } else if (cmd.equals("/addReview.review")) {
                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                String reviewContent = request.getParameter("reviewContent");
                String userId = (String) request.getSession().getAttribute("loginId"); // 로그인된 유저 아이디 가져오기

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
            } else if (cmd.equals("/deleteReview.review")) {
                int reviewSeq = Integer.parseInt(request.getParameter("reviewSeq"));
                ReviewDTO review = reviewDao.getReviewBySeq(reviewSeq);
                if (review.getUserId().equals(userId1) || isAdmin) {
                    reviewDao.deleteReview(reviewSeq);
                    pw.append("{\"result\":\"success\"}");
                } else {
                    pw.append("{\"result\":\"unauthorized\"}");
                }
            }	else if (cmd.equals("/updateReview.review")) {
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