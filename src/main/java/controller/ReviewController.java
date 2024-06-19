/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
        Gson g = new Gson();
        
        String cmd = request.getRequestURI();
        System.out.println(cmd);
        ReviewDAO reviewDao = ReviewDAO.getInstance();

        try {
            if (cmd.equals("/mostLiked.review")) {
                ReviewDTO mostLikedReview = reviewDao.getMostLikedReview();
                response.getWriter().write(g.toJson(mostLikedReview));
            } else if (cmd.equals("/latest.review")) {
                ReviewDTO latestReview = reviewDao.getLatestReview();
                response.getWriter().write(g.toJson(latestReview));
            } else if (cmd.equals("/updateReviewLike.review")) {
                int reviewSeq = Integer.parseInt(request.getParameter("reviewSeq"));
                String type = request.getParameter("type");
                reviewDao.updateReviewLike(reviewSeq, type);
                response.getWriter().write("{\"result\":\"success\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"result\":\"error\"}");
        }
	}

}
