/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

/**
 * Description : 프로필 사진 관련 DTO
 * Date : 2024. 6. 17.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 17., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */

public class UserProfileImgDTO {
	
	private int profileImgSeq;
	private String userId, profileImgOriname,profileImgSysname;
	
	public UserProfileImgDTO() {
		super();
	}
	public UserProfileImgDTO(int profileImgSeq, String userId, String profileImgOriname, String profileImgSysname) {
		super();
		this.profileImgSeq = profileImgSeq;
		this.userId = userId;
		this.profileImgOriname = profileImgOriname;
		this.profileImgSysname = profileImgSysname;
	}
	public int getProfileImgSeq() {
		return profileImgSeq;
	}
	public void setProfileImgSeq(int profileImgSeq) {
		this.profileImgSeq = profileImgSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProfileImgOriname() {
		return profileImgOriname;
	}
	public void setProfileImgOriname(String profileImgOriname) {
		this.profileImgOriname = profileImgOriname;
	}
	public String getProfileImgSysname() {
		return profileImgSysname;
	}
	public void setProfileImgSysname(String profileImgSysname) {
		this.profileImgSysname = profileImgSysname;
	}
	
	
}
