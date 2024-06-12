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
public class UserSessionDTO {
	private String sessionId;
	private String userId;
	private Timestamp session_start;
	private Timestamp session_end;
	private String session_status;
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getSession_start() {
		return session_start;
	}
	public void setSession_start(Timestamp session_start) {
		this.session_start = session_start;
	}
	public Timestamp getSession_end() {
		return session_end;
	}
	public void setSession_end(Timestamp session_end) {
		this.session_end = session_end;
	}
	public String getSession_status() {
		return session_status;
	}
	public void setSession_status(String session_status) {
		this.session_status = session_status;
	}
	public UserSessionDTO(String sessionId, String userId, Timestamp session_start, Timestamp session_end,
			String session_status) {
		super();
		this.sessionId = sessionId;
		this.userId = userId;
		this.session_start = session_start;
		this.session_end = session_end;
		this.session_status = session_status;
	}
	public UserSessionDTO() {
		super();
	}
	
	
}
