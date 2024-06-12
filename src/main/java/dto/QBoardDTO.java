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
public class QBoardDTO {
	private int qBoardSeq;
	private String userId;
	private int qBoardCategory;
	private String qBoardTitle;
	private String qBoardContent;
	private Timestamp qBoardDate;
	private String qBoardAnswer;
	private String qBoardSecret;
	
	public QBoardDTO() {}

	public QBoardDTO(int qBoardSeq, String userId, int qBoardCategory, String qBoardTitle, String qBoardContent,
			Timestamp qBoardDate, String qBoardAnswer, String qBoardSecret) {
		this.qBoardSeq = qBoardSeq;
		this.userId = userId;
		this.qBoardCategory = qBoardCategory;
		this.qBoardTitle = qBoardTitle;
		this.qBoardContent = qBoardContent;
		this.qBoardDate = qBoardDate;
		this.qBoardAnswer = qBoardAnswer;
		this.qBoardSecret = qBoardSecret;
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

	public int getqBoardCategory() {
		return qBoardCategory;
	}

	public void setqBoardCategory(int qBoardCategory) {
		this.qBoardCategory = qBoardCategory;
	}

	public String getqBoardTitle() {
		return qBoardTitle;
	}

	public void setqBoardTitle(String qBoardTitle) {
		this.qBoardTitle = qBoardTitle;
	}

	public String getqBoardContent() {
		return qBoardContent;
	}

	public void setqBoardContent(String qBoardContent) {
		this.qBoardContent = qBoardContent;
	}

	public Timestamp getqBoardDate() {
		return qBoardDate;
	}

	public void setqBoardDate(Timestamp qBoardDate) {
		this.qBoardDate = qBoardDate;
	}

	public String getqBoardAnswer() {
		return qBoardAnswer;
	}

	public void setqBoardAnswer(String qBoardAnswer) {
		this.qBoardAnswer = qBoardAnswer;
	}

	public String getqBoardSecret() {
		return qBoardSecret;
	}

	public void setqBoardSecret(String qBoardSecret) {
		this.qBoardSecret = qBoardSecret;
	}
	
	
	
	
	

}
