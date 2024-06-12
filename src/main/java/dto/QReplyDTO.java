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
 *  - 작성자 : Sam, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Sam 
 * @version 1.0 
 */
public class QReplyDTO {
	private int qReplySeq;
	private int qBoardSeq;
	private String userId;
	private String qReplyContent;
	private Timestamp qReplyDate;
	
	public QReplyDTO() {}
	
	public QReplyDTO(int qReplySeq, int qBoardSeq, String userId, String qReplyContent, Timestamp qReplyDate) {
		this.qReplySeq = qReplySeq;
		this.qBoardSeq = qBoardSeq;
		this.userId = userId;
		this.qReplyContent = qReplyContent;
		this.qReplyDate = qReplyDate;
	}
	public int getqReplySeq() {
		return qReplySeq;
	}
	public void setqReplySeq(int qReplySeq) {
		this.qReplySeq = qReplySeq;
	}
	public int getqBoardSeq() {
		return qBoardSeq;
	}
	public void setqBoardSeq(int qBoardSeq) {
		this.qBoardSeq = qBoardSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getqReplyContent() {
		return qReplyContent;
	}
	public void setqReplyContent(String qReplyContent) {
		this.qReplyContent = qReplyContent;
	}
	public Timestamp getqReplyDate() {
		return qReplyDate;
	}
	public void setqReplyDate(Timestamp qReplyDate) {
		this.qReplyDate = qReplyDate;
	}


}
