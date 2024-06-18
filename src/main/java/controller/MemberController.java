/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import common.util;
import dao.GameDAO;
import dao.MemberDAO;
import dao.PlayRecordDAO;
import dao.UserProfileImgDAO;
import dto.CBoardBookmarkDTO;
import dto.GamePlayRecordDTO;
import dto.MemberDTO;
import dto.UserProfileImgDTO;

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
		GameDAO gameDao = GameDAO.getInstance();
		Gson g = new Gson();
		UserProfileImgDAO userProfileImgDao = UserProfileImgDAO.getInstance();
		PlayRecordDAO playRecordDao = PlayRecordDAO.getInstance();
		
		try {
			
			// 로그인 기능.
	        if(cmd.equals("/login.member")) {

	            String id = request.getParameter("id");
	            String pw = util.getSHA512(request.getParameter("pw"));

	            boolean result = memberDao.loginId(id, pw);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            PrintWriter pw1 = response.getWriter();

	            JsonObject responseJson = new JsonObject();

	            if(result) {
	                session.setAttribute("loginId", id);
	                
	                String profileUrl = userProfileImgDao.selectMyUrl(id);
                    session.setAttribute("profileUrl", profileUrl);
                    
	                responseJson.addProperty("success", true);
	            } else {
	                responseJson.addProperty("success", false);
	                responseJson.addProperty("message", "아이디 또는 비밀번호를 잘못 입력했습니다.");
	            }

	            pw1.append(g.toJson(responseJson));
	            pw1.flush();
	            return;
	        }
			
			// 로그아웃 기능.
			if(cmd.equals("/logout.member")) {
				session = request.getSession();
				session.invalidate();
				System.out.println("로그아웃 성공");
				response.sendRedirect("/index.jsp");
				return;
			}
			
			// 회원탈퇴 기능.
			if(cmd.equals("/deleteMember.member")) {
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				memberDao.deleteMember(id);
				session.invalidate();
				response.sendRedirect("/index.jsp");
				return;
			}
			
			if(cmd.equals("/term.member")) {
				// 개인정보 동의
				session.setAttribute("term", request.getParameter("term"));
				session.setAttribute("privacy", request.getParameter("privacy"));
				session.setAttribute("ads", request.getParameter("ads"));
				response.sendRedirect("/member/register/registerId.jsp");
			}
			else if(cmd.equals("/registerId.member")) {
				// 유저 아이디 전송
				session.setAttribute("userId", request.getParameter("userId"));
				response.sendRedirect("/member/register/registerPw.jsp");
			} 
			else if(cmd.equals("/checkUserId.member")) {
				// 아이디 중복확인
				String userId = request.getParameter("userId");
				boolean isAvailable = memberDao.isUserIdCheck(userId);
				String idCheckResult = g.toJson(isAvailable);
				PrintWriter pw = response.getWriter();
				pw.append(idCheckResult);
				return;
			}else if(cmd.equals("/checkUserNickname.member")) {
                String userNickname = request.getParameter("userNickname");
                boolean isCheck = memberDao.isUserNicknameCheck(userNickname);
                String nicknameCheckResult = g.toJson(isCheck);
                PrintWriter pw = response.getWriter();
                pw.append(nicknameCheckResult);
                return;
            }			
			else if(cmd.equals("/registerPw.member")) {
				// 유저 패스워드 전송
				
				String userPw = util.getSHA512(request.getParameter("userPw"));
				String confirmUserPw = util.getSHA512(request.getParameter("confirmUserPw")); 				
				if(userPw.equals(confirmUserPw)) {
					// 패스워드 일치했을 때만 전송
					session.setAttribute("userPw", userPw);
					response.sendRedirect("/member/register/registerEmail.jsp");
				}
				else {
					// 불일치했을 때 다시 패스워드 페이지로 이동
					response.sendRedirect("/member/register/registerPw.jsp");
				}
				return;
			} 
			else if(cmd.equals("/registerEmail.member")) {
				// 유저 이메일 전송
				session.setAttribute("userEmail", request.getParameter("userEmail"));
				response.sendRedirect("member/register/registerName.jsp");
				return;
			} 
			else if(cmd.equals("/registerName.member")) {
				// 이름, 닉네임, 주민등록번호, 폰 번호 전송
			    String userNoFront = request.getParameter("userNoFront");
			    String userNoBack = request.getParameter("userNoBack");
			    String userNo = userNoFront + userNoBack + "******"; // 주민등록번호 형식 변환
				session.setAttribute("userName", request.getParameter("userName"));
				session.setAttribute("userNickname", request.getParameter("userNickname"));
				session.setAttribute("userNo", userNo);
				session.setAttribute("userPhone", request.getParameter("userPhone"));
				response.sendRedirect("/member/register/registerComplete.jsp");
				return;
			} 
			else if(cmd.equals("/registerComplete.member")) {
				// session에 저장된 모든 정보 불러오기
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
                //String userProfileUrl = "upload/profile/default.png";
                System.out.println(term  + privacy +  ads + userId + userPw + userEmail +  userName + userNickname + userNo + userPhone);
                
                // 기본 값 제외하고 모두 변수에 담아 dao에 넣기.
                MemberDTO addMember = new MemberDTO(userId, userPw, userName, userNickname, userNo, userPhone, userEmail, new Timestamp(System.currentTimeMillis()));
                memberDao.addMember(addMember);
                
                UserProfileImgDTO addDefault = new UserProfileImgDTO(0, userId, null, null);
                System.out.println("기본 이미지 확인");
                userProfileImgDao.updateImg(addDefault);
                

                // 세션 값 초기화
                session.invalidate();
                
                // 완료 버튼을 누르면 메인화면으로 돌아감.
                request.getRequestDispatcher("/member/login/login.jsp").forward(request, response);
                return;
			}
			else if(cmd.equals("/kakaoLogin.member")) {
			    // 카카오 로그인 정보 처리
			    String kakaoId = request.getParameter("id");
			    String nickname = request.getParameter("nickname");

			    // 회원이 이미 존재하는지 확인
			    if(!memberDao.isMemberExists(kakaoId)) {
			        // 회원이 존재하지 않으면 회원가입 진행
			        MemberDTO addMember = new MemberDTO(kakaoId, "dummy", "dummy", nickname, "dummy", "dummy", "dummy", new Timestamp(System.currentTimeMillis()));
			        memberDao.addMember(addMember);
			    }

			    // 세션에 로그인 정보 저장
			    session.setAttribute("loginId", kakaoId);
			    session.setAttribute("nickname", nickname);
			    System.out.println("카카오 로그인 성공");
			    response.sendRedirect("/index.jsp");
			    return;
			}
			
			// 마이페이지 접속 시 정보 출력 기능
			if(cmd.equals("/mypage.member")) {
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				MemberDTO mydata = memberDao.myData(id);
				System.out.println(mydata.getUserNo());
				String birth = mydata.getUserNo().substring(0,2)+"."+mydata.getUserNo().substring(2,4)+"."+mydata.getUserNo().substring(4,6);
				String genderCode = mydata.getUserNo().substring(6,7);
				System.out.println(genderCode);
				String phone = mydata.getUserPhone().substring(0,3)+"-"+mydata.getUserPhone().substring(3,7)+"-"+mydata.getUserPhone().substring(7,11);
				String gender;
				if(genderCode.equals("1")) {
					gender="Male";
				}else if(genderCode.equals("2")) {
					gender="Female";
				}else {gender="None";}
				
				String url = userProfileImgDao.selectMyUrl(id);
				GamePlayRecordDTO gprDto = playRecordDao.selectRecentlyPlayGame(id);
				
				
				List<CBoardBookmarkDTO> listCategory1 = memberDao.selectCBoradCate1(id);
				List<CBoardBookmarkDTO> listCategory2 = memberDao.selectCBoradCate2(id);
				int count1 = listCategory1.size();
				int count2 = listCategory2.size();				
				
				request.setAttribute("birth", birth);
				request.setAttribute("phone", phone);
				request.setAttribute("gender", gender);
				request.setAttribute("mydata", mydata);
				request.setAttribute("userProfileUrl", url);
				request.setAttribute("listCategory1", listCategory1);
				request.setAttribute("listCategory2", listCategory2);
				request.setAttribute("count1", count1);
				request.setAttribute("count2", count2);
				request.setAttribute("gprDto", gprDto);
				
				request.getRequestDispatcher("/member/mypage/myPage.jsp").forward(request, response);	
				
			// 마이페이지 수정 버튼 클릭 시 기존 저장된 정보 출력 기능	
			}else if(cmd.equals("/updateList.member")) {
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				MemberDTO mydata = memberDao.myData(id);
				System.out.println(mydata.getUserNo());
				String birth = mydata.getUserNo().substring(0,2)+"."+mydata.getUserNo().substring(2,4)+"."+mydata.getUserNo().substring(4,6);
				String genderCode = mydata.getUserNo().substring(6,7);
				String gender;
				String phone = mydata.getUserPhone().substring(0,3)+"-"+mydata.getUserPhone().substring(3,7)+"-"+mydata.getUserPhone().substring(7,11);
				String url = userProfileImgDao.selectMyUrl(id);
				
				if(genderCode.equals("1")) {
					gender="Male";
				}else if(genderCode.equals("2")) {
					gender="Female";
				}else {gender="None";}
				
				
				request.setAttribute("phone", phone);
				request.setAttribute("birth", birth);
				request.setAttribute("gender", gender);
				request.setAttribute("mydata", mydata);
				request.setAttribute("userProfileUrl", url);
				
				request.getRequestDispatcher("/member/mypage/updateMyPage.jsp").forward(request, response);	
				
			}else if(cmd.equals("/updateData.member")) {
				
				String id = (String) request.getSession().getAttribute("loginId");
				
				String name = request.getParameter("userName");
				String nickname = request.getParameter("userNickname");
				String birth = request.getParameter("userBirth");
				String gender = request.getParameter("gender");
				String email = request.getParameter("userEmail");
				String phone = request.getParameter("userPhone");
				String formattedPhone = phone.replaceAll("-", "");
				String genderCode ="";
				
				if(gender.equals("Male")) {
					genderCode="1";
				}else if(gender.equals("Female")){
					genderCode="2";
				}
				
				String userNo = birth.substring(0,2)+birth.substring(3,5)+birth.substring(6,8)+genderCode+"******";
				
				memberDao.updateData(new MemberDTO(id,name,nickname,userNo,email,formattedPhone.trim()));
				request.getRequestDispatcher("/mypage.member").forward(request, response);	
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}

}
