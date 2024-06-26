/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
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
		System.out.println(cmd);
		
	       try {
	            if (cmd.equals("/login.member")) {
	                String id = request.getParameter("id");
	                String pw = util.getSHA512(request.getParameter("pw"));

	                boolean result = memberDao.loginId(id, pw);
	                boolean isAdmin = memberDao.isAdmin(id);
	                boolean isBlackUser = memberDao.isBlackUser(id);

	                response.setContentType("application/json");
	                response.setCharacterEncoding("UTF-8");

	                PrintWriter pw1 = response.getWriter();
	                JsonObject responseJson = new JsonObject();

	                if (isBlackUser) {
	                    responseJson.addProperty("success", false);
	                    responseJson.addProperty("message", "블랙 된 유저입니다.");
	                } else if (result) {
	                    session.setAttribute("loginId", id);
	                    session.setAttribute("isAdmin", isAdmin);
	                    String profileUrl = userProfileImgDao.selectMyUrl(id);
	                    session.setAttribute("userProfileUrl", profileUrl);
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
			    String name = request.getParameter("name");
			    System.out.println(kakaoId);
			    System.out.println(nickname);
			    System.out.println(name);
			    String email = request.getParameter("email");
			    String birthYear = request.getParameter("birthYear");			    
			    int checkGenderCode = Integer.parseInt(request.getParameter("birthYear"));
			    System.out.println(checkGenderCode);
			    String FrontBirth = birthYear.substring(2, 4);
			    System.out.println(FrontBirth);
			    String birthDay = request.getParameter("birthDay");
			    System.out.println(birthDay);
			    String birth = FrontBirth + birthDay;
			    System.out.println(birth);

			    
			    String gender = request.getParameter("gender");
			    String genderCode = null;
			    if(gender.equals("male") && checkGenderCode < 2000) {
			    	genderCode = "1";
			    }else if(gender.equals("male") && checkGenderCode > 2000){
			    	genderCode = "3";
			    }else if(gender.equals("female") && checkGenderCode < 2000) {
			    	genderCode = "2";
			    }else if(gender.equals("female") && checkGenderCode < 2000) {
			    	genderCode = "4";
			    }
			    System.out.println(genderCode);
			    String userNo = birth + genderCode;
			    System.out.println(userNo);
			    

			    // 회원이 이미 존재하는지 확인
			    if(!memberDao.isMemberExists(kakaoId)) {
			        // 회원이 존재하지 않으면 회원가입 진행
			        MemberDTO addMember = new MemberDTO(kakaoId, "dummy", name, nickname, userNo, "dummy", email, new Timestamp(System.currentTimeMillis()));
//			        MemberDTO addMember = new MemberDTO(kakaoId, "dummy", "dummy", nickname, "dummy", "dummy", "dummy", new Timestamp(System.currentTimeMillis()));
			        memberDao.addMember(addMember);
			    }

			    // 세션에 로그인 정보 저장
			    session.setAttribute("loginId", kakaoId);
			    session.setAttribute("nickname", nickname);
			    System.out.println("카카오 로그인 성공");
			    response.sendRedirect("/index.jsp");
			    return;
			}
			
			
			else if (cmd.equals("/googleLogin.member")) {
			    String idTokenString = request.getParameter("id_token");
			    System.out.println(idTokenString);

			    // Google API 클라이언트 초기화
			    HttpTransport transport = new NetHttpTransport();
			    JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();

			    GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
			        .setAudience(Collections.singletonList("692534731916-p7l19g92i10v9gq4crmcad2olvu8r0ff.apps.googleusercontent.com"))
			        .build();

			    GoogleIdToken idToken = verifier.verify(idTokenString);
			    if (idToken != null) {
			        GoogleIdToken.Payload payload = idToken.getPayload();
			        String userId = payload.getSubject();
			        String email = payload.getEmail();
			        boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			        String name = (String) payload.get("name");
			        String pictureUrl = (String) payload.get("picture");

			
			        if (!memberDao.isMemberExists(userId)) {
			        	System.out.println("아이디 존재 x");
		
			            MemberDTO addMember = new MemberDTO(userId, "dummy", name, name, "dummy", "dummy", email, new Timestamp(System.currentTimeMillis()));
			            memberDao.addMember(addMember);
			        }


			        session.setAttribute("loginId", userId);
			        session.setAttribute("userProfileUrl", pictureUrl);
			        System.out.println("로그인한 아이디 확인" + userId);

			        JsonObject responseJson = new JsonObject();
			        responseJson.addProperty("success", true);
			        response.getWriter().write(g.toJson(responseJson));
			    } else {

			        JsonObject responseJson = new JsonObject();
			        responseJson.addProperty("success", false);
			        responseJson.addProperty("message", "Invalid ID token.");
			        response.getWriter().write(g.toJson(responseJson));
			    }
			}
			
			// 
			else if(cmd.equals("/findPwSendEmail.member")) {
			    String inputId = request.getParameter("inputId");
			    String inputEmail = request.getParameter("inputEmail");
			    
			    response.setContentType("application/json");
			    PrintWriter out = response.getWriter();
			    
			    if (memberDao.checkIdAndEmail(inputId, inputEmail)) {
			        // 기존 이메일 전송 로직
			        String subject = "[RetroStars] 비밀번호 찾기 이메일 인증번호";
			        
			        String fromEmail = "TeamStarlight0531@gmail.com";
			        String fromUsername = "RetroStars 관리자";
			        String toEmail = inputEmail;
			        
			        final String smtpEmail = "TeamStarlight0531@gmail.com";
			        final String password = "qbdnjjotwiwdagsn";
			        
			        Properties p = System.getProperties();
			        p.setProperty("mail.transport.protocol", "smtp");
			        p.put("mail.smtp.host", "smtp.gmail.com");
			        p.put("mail.smtp.port", "587");
			        p.put("mail.smtp.auth", "true");
			        p.put("mail.smtp.debug", "true");
			        p.put("mail.smtp.starttls.enable", "true");
			        p.put("mail.smtp.ssl.protocols", "TLSv1.2");
			        p.put("mail.smtp.socketFactory.port", "587");
			        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			        
			        Session smtpSession = Session.getDefaultInstance(p);
			        
			        MimeMessage msg = new MimeMessage(smtpSession); // MimeMessage 객체 생성
			        
			        msg.setFrom(new InternetAddress(fromEmail, fromUsername));
			        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			        msg.setSubject(subject);
			        
			        String cNumber = "";
			        Random rnd = new Random();
			        for (int i = 0; i < 8; i++) {
			            int sel1 = (int)(Math.random() * 3);
			            
			            if(sel1 == 0) {
			                int num = (int)(Math.random() * 10);
			                cNumber += num;
			            } else {
			                char ch = (char)(Math.random() * 26 + 65);
			                int sel2 = (int)(Math.random() * 2);
			                if(sel2 == 0) {
			                    ch = (char)(ch + ('a' - 'A'));
			                }
			                cNumber += ch;
			            }
			        }
			        
			        String AuthenticationKey = cNumber.toString();
			        System.out.println(AuthenticationKey);
			        System.out.println("이메일 : " + inputEmail);
			        
			        StringBuffer sb = new StringBuffer(); 
			        sb.append("<h3>[웹 게임 포털 사이트 RetroStars] 비밀번호 찾기 인증 번호입니다.</h3>\n");
			        sb.append("<h3>인증 번호 : <span style='color:red'>" + cNumber + "</span></h3>\n");
			        msg.setText("인증 번호는 [" + cNumber + "] 입니다.");
			        
			        Transport t = smtpSession.getTransport("smtp");
			        t.connect(smtpEmail, password);
			        t.sendMessage(msg, msg.getAllRecipients());
			        t.close();
			        
			        session.setAttribute("authCode", cNumber);
			        session.setAttribute("inputEmail", inputEmail);
			        
			        out.write("{\"status\":\"success\"}");
			    } else {
			        out.write("{\"status\":\"mismatch\"}");
			    }
			    out.flush();
			}
			else if(cmd.equals("/pwVerifyCode.member")) {
			    String code = request.getParameter("code");
			    PrintWriter out = response.getWriter();
			    response.setContentType("application/json");
			    
			    String authCode = (String) session.getAttribute("authCode");

			    if(code.equals(authCode)) {
			        out.print("{\"status\":\"success\"}");
			    } else {
			        out.print("{\"status\":\"error\"}");
			    }
			    out.flush();
			}
			else if(cmd.equals("/resetPassword.member")) {
			    String pw = util.getSHA512(request.getParameter("password"));
			    System.out.println(pw);
			    String inputEmail = (String) session.getAttribute("inputEmail");
			    int result = memberDao.resetPw(pw, inputEmail);
			    System.out.println(result);
			    
			    response.sendRedirect("/member/login/login.jsp");
			}
            
            else if(cmd.equals("/findId.member")) {
            	String name = request.getParameter("name");
            	String email = request.getParameter("email");
            	
            	
            	String foundId = memberDao.findIdByNameAndEmail(name, email);
            	if(foundId != null) {
            		request.setAttribute("message", "찾은 아이디: " + foundId);
            	} else {
            		request.setAttribute("message", "해당 정보로 등록된 아이디가 없습니다.");
            	}
            	request.getRequestDispatcher("/member/login/findIdResult.jsp").forward(request, response);
            	
            }
			
			// 마이페이지 접속 시 정보 출력 기능
			if(cmd.equals("/mypage.member")) {
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				MemberDTO mydata = memberDao.myData(id);
				String birth = mydata.getUserNo().substring(0,2)+"."+mydata.getUserNo().substring(2,4)+"."+mydata.getUserNo().substring(4,6);
				String genderCode = mydata.getUserNo().substring(6,7);
				String phone = mydata.getUserPhone().substring(0,3)+"-"+mydata.getUserPhone().substring(3,7)+"-"+mydata.getUserPhone().substring(7,11);
				String gender;
				if(genderCode.equals("1")||genderCode.equals("3")) {
					gender="Male";
				}else if(genderCode.equals("2")||genderCode.equals("4")) {
					gender="Female";
				}else {gender="None";}
				
				String url = userProfileImgDao.selectMyUrl(id);
				GamePlayRecordDTO gprDto = playRecordDao.selectRecentlyPlayGame(id);
				
				
				List<CBoardBookmarkDTO> listCategory1 = memberDao.selectCBoradCate1(id);
				List<CBoardBookmarkDTO> listCategory2 = memberDao.selectCBoradCate2(id);
				int count1 = listCategory1.size();
				int count2 = listCategory2.size();	
				List<String> seq = memberDao.gameBookmark(id);
				int seqSize = seq.size();
				
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
				request.setAttribute("seq", seq);
				request.setAttribute("seqSize", seqSize);
				
				request.getRequestDispatcher("/member/mypage/myPage.jsp").forward(request, response);	
				
			// 마이페이지 수정 버튼 클릭 시 기존 저장된 정보 출력 기능	
			}else if(cmd.equals("/updateList.member")) {
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				MemberDTO mydata = memberDao.myData(id);
				String birth = mydata.getUserNo().substring(0,2)+"."+mydata.getUserNo().substring(2,4)+"."+mydata.getUserNo().substring(4,6);
				String genderCode = mydata.getUserNo().substring(6,7);
				String gender;
				String phone = mydata.getUserPhone().substring(0,3)+"-"+mydata.getUserPhone().substring(3,7)+"-"+mydata.getUserPhone().substring(7,11);
				String url = userProfileImgDao.selectMyUrl(id);
				
				if(genderCode.equals("1")||genderCode.equals("3")) {
					gender="Male";
				}else if(genderCode.equals("2")||genderCode.equals("4")) {
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
				
			}else if(cmd.equals("/updatePw.member")) {
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				String newPw = util.getSHA512(request.getParameter("newConfirmPw")); 
				System.out.println(newPw);
				
				memberDao.updatePw(id, newPw);
				
			}else if(cmd.equals("/pwIsRight.member")) {
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				String Pw = util.getSHA512(request.getParameter("pw"));
				
				String result = memberDao.pwIsRight(id, Pw);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pw = response.getWriter();
				pw.append(result);
				
			}else if(cmd.equals("/checkUserNicknameUpdate.member")) {
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
                String userNickname = request.getParameter("userNickname");
                
                boolean isExistCheck = memberDao.isUserNicknameCheck(userNickname);
                boolean isMyNicknameCheck = memberDao.isUserNicknameCheckUpdate(userNickname, id);
                PrintWriter pw = response.getWriter();
                
                if(isExistCheck) {
                	pw.append("true");
                }else if( (isExistCheck == false) && (isMyNicknameCheck == false) ){
                	// 존재하는데 내꺼일 경우
                	pw.append("before");
                }else {
                	// 그 외 모든 경우 수정 불가능
                	pw.append("false");
                }
            }
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}

}
