/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class MemberDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String userNo;
	private String userPhone;
	private String userEmail;
	private Timestamp userJoinDate;
	private String userLevel;
	private String userAdmin;
	private String userBlack;
	private String userActive;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Timestamp getUserJoinDate() {
		return userJoinDate;
	}
	public void setUserJoinDate(Timestamp userJoinDate) {
		this.userJoinDate = userJoinDate;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public String getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(String userAdmin) {
		this.userAdmin = userAdmin;
	}
	public String getUserBlack() {
		return userBlack;
	}
	public void setUserBlack(String userBlack) {
		this.userBlack = userBlack;
	}
	public String getUserActive() {
		return userActive;
	}
	public void setUserActive(String userActive) {
		this.userActive = userActive;
	}
	public MemberDTO(String userId, String userPw, String userName, String userNickname, String userNo,
			String userPhone, String userEmail, Timestamp userJoinDate, String userLevel,
			String userAdmin, String userBlack, String userActive) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userNo = userNo;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
		this.userLevel = userLevel;
		this.userAdmin = userAdmin;
		this.userBlack = userBlack;
		this.userActive = userActive;
	}
	public MemberDTO(String userId, String userPw, String userName, String userNickname, String userNo,
			String userPhone, String userEmail, Timestamp userJoinDate) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userNo = userNo;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
	}
	public MemberDTO(String userId, String userNickname, Timestamp userJoinDate) {
		super();
		this.userId = userId;
		this.userNickname = userNickname;
		this.userJoinDate = userJoinDate;
	}
	
	public MemberDTO(String userId, String userName, String userNickname, String userNo,
			String userPhone, String userEmail) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userNo = userNo;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
	}
	
	private static final String DEFAULT_PROFILE_URL = "upload/profile/default.png";

	public MemberDTO() {
		super();
	}
	
}
