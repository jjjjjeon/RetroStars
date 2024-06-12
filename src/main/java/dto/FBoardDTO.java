/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

/**
 * Description : FAQ 게시판 DTO
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *  - 작성자 : KJY, 날짜 : 2024. 6. 12., 설명 : Camelcase로 수정
 * @author : KJY 
 * @version 1.0 
 */

public class FBoardDTO {
	
	private int fBoardSeq;
	private String UserId, fBoardCategory, fBoardQuestion, fBoardAnswer;
	
	public FBoardDTO() {
		super();
	}
	
	public FBoardDTO(int fBoardSeq, String userId, String fBoardCategory, String fBoardQuestion, String fBoardAnswer) {
		super();
		this.fBoardSeq = fBoardSeq;
		UserId = userId;
		this.fBoardCategory = fBoardCategory;
		this.fBoardQuestion = fBoardQuestion;
		this.fBoardAnswer = fBoardAnswer;
	}

	public int getfBoardSeq() {
		return fBoardSeq;
	}

	public void setfBoardSeq(int fBoardSeq) {
		this.fBoardSeq = fBoardSeq;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getfBoardCategory() {
		return fBoardCategory;
	}

	public void setfBoardCategory(String fBoardCategory) {
		this.fBoardCategory = fBoardCategory;
	}

	public String getfBoardQuestion() {
		return fBoardQuestion;
	}

	public void setfBoardQuestion(String fBoardQuestion) {
		this.fBoardQuestion = fBoardQuestion;
	}

	public String getfBoardAnswer() {
		return fBoardAnswer;
	}

	public void setfBoardAnswer(String fBoardAnswer) {
		this.fBoardAnswer = fBoardAnswer;
	}
	
		
	
}
