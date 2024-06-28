/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GameDAO;
import dto.GameDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
@WebServlet("*.gboard")
public class GBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String cmd = request.getRequestURI();
        GameDAO gameDao = GameDAO.getInstance();

        try {
        	
        	// 현재 사용하지 않음.
            if (cmd.equals("/list.gboard")) {
                System.out.println("확인");
                List<GameDTO> listGame = gameDao.getAllGames(); // 모든 게임을 가져옴
                String loginId = (String) session.getAttribute("loginId");
                request.setAttribute("listGame", listGame);
                request.setAttribute("loginId", loginId); 
                request.getRequestDispatcher("/gboard/mainBoard.jsp").forward(request, response);
                return;
            } 
            
            // 게임번호에 맞는 게임 보여주기.
            else if (cmd.equals("/viewGame.gboard")) {
                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                String loginId = (String) session.getAttribute("loginId");
                
                
                GameDTO game = gameDao.getGameById(gameSeq); // 게임번호를 입력받아 하나 넣기.
                List<GameDTO> listGame = gameDao.getAllGames(); // 모든 게임을 가져옴
                
                List<String> listGameImage = gameDao.getGameImages(gameSeq); // 게임번호에 맞는 이미지 List에 넣기                
                String gameVideoStr = gameDao.getGameVideo(gameSeq); // 게임번호에 맞는 비디오 url 가져오기. 현재 사이트에 비디오 하나만 허용하게 해놨음.
                  
                request.setAttribute("listGame", listGame);
                request.setAttribute("loginId", loginId); 
                request.setAttribute("game", game);
                request.setAttribute("images", listGameImage);
                request.setAttribute("videoUrl", gameVideoStr);
                request.getRequestDispatcher("/gboard/mainBoard.jsp").forward(request, response);
                return;
            } 
            // 북마크 
            else if (cmd.equals("/toggleGameBookmark.gboard")) {
                String id = (String) session.getAttribute("loginId");
                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));

                // 북마크가 존재하면 삭제, 아니면 추가.
                if (gameDao.isGameBookmarked(id, gameSeq)) {
                    gameDao.removeGameBookmark(id, gameSeq);
                    response.getWriter().write("removed");
                } else {
                    gameDao.addGameBookmark(id, gameSeq);
                    response.getWriter().write("added");
                }
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

}