/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlayRecordDAO;
import dto.PlayRecordDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 18.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 18., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
@WebServlet("*.playRecord")
public class PlayRecordController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=UTF-8");
	        HttpSession session = request.getSession();
	        String cmd = request.getRequestURI();
	        PlayRecordDAO playRecordDao = PlayRecordDAO.getInstance();
	        PrintWriter pw = response.getWriter();
	        
	        try {
	        	if(cmd.equals("/write.playRecord")) {
	        		int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
	        		String playId = request.getParameter("id");
	        		int gameTime = Integer.parseInt(request.getParameter("playtime"));
	        		int gameScore = Integer.parseInt(request.getParameter("score"));
	        		int result = playRecordDao.addPlayRecord(new PlayRecordDTO(0, gameSeq, playId, null, gameTime, gameScore));
	                System.out.println(gameSeq + playId + gameTime + gameScore);
	                System.out.println(result);
	        		if (result > 0) {
	                    pw.append("{\"result\":\"success\"}");
	                } else {
	                    pw.append("{\"result\":\"error\"}");
	                }
	        	}
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        	response.sendRedirect("error.jsp");
	        }
	        
	}

}
