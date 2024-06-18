/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.GameDAO;
import dto.GBoardDTO;
import dto.GameDTO;
import dto.GameImageDTO;
import dto.GameVideoDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요. Date : 2024. 6. 12. History : - 작성자 : Jin,
 * 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin
 * @version 1.0
 */
@WebServlet("*.game")
public class GameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cmd = request.getRequestURI();
		GameDAO gameDao = GameDAO.getInstance();

		try {
			if (cmd.equals("/addGame.game")) {
				String saveDirectory = "C:\\workspace\\gameImage"; // 업로드된 파일을 저장할 디렉토리
				int maxPostSize = 1024 * 1024 * 50; // 최대 업로드 파일 크기 
				String encoding = "UTF-8";

				MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
						new DefaultFileRenamePolicy());

				String gameTitle = multi.getParameter("gameTitle");
				String gameDesc = multi.getParameter("gameDesc");
				String developer = multi.getParameter("developer");

				// 게임 정보를 데이터베이스에 저장
				int gameSeq = gameDao.insertGame(new GameDTO(0, gameTitle, gameDesc, developer, null));

				// 이미지 파일들을 데이터베이스에 저장
				Enumeration<?> files = multi.getFileNames();
				while (files.hasMoreElements()) {
					String name = (String) files.nextElement();
					String filename = multi.getFilesystemName(name);
					if (name.startsWith("gameImages") && filename != null) { // 이미지 파일 여러개 추가할 때 새로운 로직 필요.
						gameDao.insertGameImage(new GameImageDTO(0, gameSeq, "/GameImage/" + filename));
					} 
					else if (name.startsWith("gameVideos") && filename != null) {
						gameDao.insertGameVideo(new GameVideoDTO(0, gameSeq, "/GameImage/" + filename,
								new java.sql.Timestamp(System.currentTimeMillis())));
					}
				}

				response.sendRedirect("/gboard/mainBoard.gboard");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}