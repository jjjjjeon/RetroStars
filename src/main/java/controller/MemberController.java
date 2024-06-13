/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
@WebServlet("*.member")
public class MemberController extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String cmd = request.getRequestURI();
		MemberDAO memberDao = MemberDAO.getInstance();
		
		try {
			
			// 로그인 기능.
			if(cmd.equals("/login.member")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				
				boolean result = memberDao.loginId(id, pw);
				if(result) {
					
					session.setAttribute("loginId", id);
				}
				response.sendRedirect("/index.jsp");
			}
			
			// 로그아웃 기능.
			if(cmd.equals("/logout.member")) {
				session = request.getSession();
				session.invalidate();
				response.sendRedirect("/index.jsp");
			}
			
			// 회원탈퇴 기능.
			if(cmd.equals("/deleteMember.member")) {
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				memberDao.deleteMember(id);
				session.invalidate();
				response.sendRedirect("/index.jsp");
			}
			
			if(cmd.equals("/term.member")) {
				// 개인정보 동의
				session.setAttribute("term", request.getParameter("term"));
				session.setAttribute("privacy", request.getParameter("privacy"));
				session.setAttribute("ads", request.getParameter("ads"));
				response.sendRedirect("/member/register/registerId.jsp");
			} else if(cmd.equals("/registerId.member")) {
				// 유저 아이디 전송
				session.setAttribute("userId", request.getParameter("userId"));
				response.sendRedirect("/member/register/registerPw.jsp");
			} else if(cmd.equals("/registerPw.member")) {
				// 유저 패스워드 전송
				String userPw = request.getParameter("userPw");
				String confirmUserPw = request.getParameter("confirmUserPw");				
				if(userPw.equals(confirmUserPw)) {
					// 패스워드 일치했을 때만 전송
					session.setAttribute("userPw", userPw);
					response.sendRedirect("/member/register/registerEmail.jsp");
				}
				else {
					// 불일치했을 때 다시 패스워드 페이지로 이동
					response.sendRedirect("/member/register/registerPw.jsp");
				}
			} else if(cmd.equals("/registerEmail.member")) {
				// 유저 이메일 전송
				session.setAttribute("userEmail", request.getParameter("userEmail"));
				response.sendRedirect("member/register/registerName.jsp");
			} else if(cmd.equals("/registerName.member")) {
				// 이름, 닉네임, 주민등록번호, 폰 번호 전송
				session.setAttribute("userName", request.getParameter("userName"));
				session.setAttribute("userNickname", request.getParameter("userNickname"));
				session.setAttribute("userNo", request.getParameter("userNo"));
				session.setAttribute("userPhone", request.getParameter("userPhone"));
				response.sendRedirect("/member/register/registerComplete.jsp");
			} else if(cmd.equals("/registerComplete.member")) {
                String term = (String) session.getAttribute("term");
                String privacy = (String) session.getAttribute("privacy");
                String ads = (String) session.getAttribute("ads");
                String userId = (String) session.getAttribute("userId");
                String userPw = (String) session.getAttribute("userPw");
                String userEmail = (String) session.getAttribute("userEmail");
                String userName = (String) session.getAttribute("userName");
                String userNickname = (String) session.getAttribute("userNickname");
                String userNo = (String) session.getAttribute("userNo");
                String userPhone = (String) session.getAttribute("userPhone");
                System.out.println(term  + privacy +  ads + userId + userPw + userEmail +  userName + userNickname + userNo + userPhone);
                
                MemberDTO addMember = new MemberDTO(userId, userPw, userName, userNickname, userNo, userPhone, userEmail, new Timestamp(System.currentTimeMillis()));
                memberDao.addMember(addMember);
                
                session.invalidate();
                
                response.sendRedirect("/index.jsp");
			}
			
			else {
				response.sendRedirect("/index.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}

}
