/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

/**
 * Description : 공지게시판 NBoardDTO 입니다.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Minjoo, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Minjoo
 * @version 1.0 
 */
public class NBoardDTO {
	private int nBoardSeq;
	private String userId;
	private String nBoardTitle;
	private String nBoardContent;
	private Timestamp nBoardDate;
	private int nBoardView;
	
	public NBoardDTO() {}
	
	public NBoardDTO(int nBoardSeq, String userId, String nBoardTitle, String nBoardContent, Timestamp nBoardDate,
			int nBoardView) {
		super();
		this.nBoardSeq = nBoardSeq;
		this.userId = userId;
		this.nBoardTitle = nBoardTitle;
		this.nBoardContent = nBoardContent;
		this.nBoardDate = nBoardDate;
		this.nBoardView = nBoardView;
	}

	public int getnBoardSeq() {
		return nBoardSeq;
	}

	public void setnBoardSeq(int nBoardSeq) {
		this.nBoardSeq = nBoardSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getnBoardTitle() {
		return nBoardTitle;
	}

	public void setnBoardTitle(String nBoardTitle) {
		this.nBoardTitle = nBoardTitle;
	}

	public String getnBoardContent() {
		return nBoardContent;
	}

	public void setnBoardContent(String nBoardContent) {
		this.nBoardContent = nBoardContent;
	}

	public Timestamp getnBoardDate() {
		return nBoardDate;
	}

	public void setnBoardDate(Timestamp nBoardDate) {
		this.nBoardDate = nBoardDate;
	}

	public int getnBoardView() {
		return nBoardView;
	}

	public void setnBoardView(int nBoardView) {
		this.nBoardView = nBoardView;
	}
	
	
	
	
}
