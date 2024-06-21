/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlayRecordDAO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 18.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 18., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
@WebServlet("*.playrecord")
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
	        
	        try {
	        	// 랭킹 리스트 출력
	        	if(cmd.equals("/list.playrecord")) {
	        		
	        		String gameSep = request.getParameter("gameSep");	        		
					if(gameSep == null) {gameSep = "1";}
					
					List<HashMap<String,?>> ranks = playRecordDao.selectRank(gameSep);
					
					// 순서, 아이디, 스코어, 게임카테고리 순으로 전송
	        		request.setAttribute("ranks",ranks);
	        		request.getRequestDispatcher("/rboard/mainBoard.jsp").forward(request, response);
	        		
	        	}
	        	
	        }catch(Exception e) {
	        	e.printStackTrace();
	        	response.sendRedirect("error.jsp");
	        }
	        
	}

}
