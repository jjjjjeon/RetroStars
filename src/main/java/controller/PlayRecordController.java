/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	        PrintWriter pw = response.getWriter();
	        System.out.println(cmd);
	        
	        try {

	        	// 랭킹 리스트 출력
	        	if(cmd.equals("/list.playrecord")) {
	        		
	        		String gameSeq = request.getParameter("gameSeq");	        		
					if(gameSeq == null) {gameSeq = "1";}
					
					List<HashMap<String,?>> ranks = playRecordDao.selectRank(gameSeq);
					System.out.println(ranks.size());
					
					int count = 10 - ranks.size();
					
					List<HashMap<String,?>> rank = new ArrayList<>();
					
					if(ranks.size() == 10) {
						
						rank = ranks;
						
					}else {
						int i = 10 - ranks.size();
						System.out.println(i);
						rank = ranks;
						
						for(int j = ranks.size(); j < 11 ; j++ ) {
							
							HashMap map=new HashMap<>();
							map.put("rank", j);
							map.put("id","미등록");
							map.put("score","미등록");
							map.put("gameCate","미등록");
							map.put("url","default.png");
							rank.add(map);
							System.out.println(ranks.size());
						}
					}
					
					// 순서, 아이디, 스코어, 게임카테고리 순으로 전송
	        		request.setAttribute("ranks",rank);
	        		request.getRequestDispatcher("/rboard/mainBoard.jsp").forward(request, response);
	        	}

	        	if(cmd.equals("/write.playrecord")) {
	        		int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
	        		System.out.println(gameSeq);
	        		String playId = (String) session.getAttribute("loginId");
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
