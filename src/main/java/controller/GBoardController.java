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

import dao.GBoardDAO;
import dao.GameDAO;
import dao.MemberDAO;
import dto.GameDTO;
import dto.GameImageDTO;
import dto.GameVideoDTO;

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
            if (cmd.equals("/list.gboard")) {
                System.out.println("확인");
                List<GameDTO> listGame = gameDao.getAllGames(); // 모든 게임을 가져옴
                String loginId = (String) request.getSession().getAttribute("loginId");
                request.setAttribute("listGame", listGame);
                request.setAttribute("loginId", loginId); 
                request.getRequestDispatcher("/gboard/mainBoard.jsp").forward(request, response);
                return;
            } else if (cmd.equals("/viewGame.gboard")) {
                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));
                System.out.println(gameSeq);
                GameDTO game = gameDao.getGameById(gameSeq);
                List<String> listGameImage = gameDao.getGameImages(gameSeq);
                System.out.println(listGameImage.get(1));
                String gameVideoStr = gameDao.getGameVideo(gameSeq);
                System.out.println(gameVideoStr);
                List<GameDTO> listGame = gameDao.getAllGames(); // 모든 게임을 가져옴
                String loginId = (String) request.getSession().getAttribute("loginId");
                request.setAttribute("listGame", listGame);
                request.setAttribute("loginId", loginId); 
                request.setAttribute("game", game);
                request.setAttribute("images", listGameImage);
                request.setAttribute("videoUrl", gameVideoStr);
                request.getRequestDispatcher("/gboard/mainBoard.jsp").forward(request, response);
                return;
            } else if (cmd.equals("/toggleGameBookmark.gboard")) {
                String id = (String) request.getSession().getAttribute("loginId");
                System.out.println(id);
                int gameSeq = Integer.parseInt(request.getParameter("gameSeq"));

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