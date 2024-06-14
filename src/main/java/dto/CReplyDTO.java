/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

public class CReplyDTO {
	private int cReplySeq;
	private int cBoardSeq;
	private String userId;
	private String cReplyContent;
	private Timestamp cReplyDate;
	private int cReplyReply;
	public int getcReplySeq() {
		return cReplySeq;
	}
	public void setcReplySeq(int cReplySeq) {
		this.cReplySeq = cReplySeq;
	}
	public int getcBoardSeq() {
		return cBoardSeq;
	}
	public void setcBoardSeq(int cBoardSeq) {
		this.cBoardSeq = cBoardSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getcReplyContent() {
		return cReplyContent;
	}
	public void setcReplyContent(String cReplyContent) {
		this.cReplyContent = cReplyContent;
	}
	public Timestamp getcReplyDate() {
		return cReplyDate;
	}
	public void setcReplyDate(Timestamp cReplyDate) {
		this.cReplyDate = cReplyDate;
	}
	public int getcReplyReply() {
		return cReplyReply;
	}
	public void setcReplyReply(int cReplyReply) {
		this.cReplyReply = cReplyReply;
	}
	public CReplyDTO() {
		super();
	}
	public CReplyDTO(int cReplySeq, int cBoardSeq, String userId, String cReplyContent, Timestamp cReplyDate,
			int cReplyReply) {
		super();
		this.cReplySeq = cReplySeq;
		this.cBoardSeq = cBoardSeq;
		this.userId = userId;
		this.cReplyContent = cReplyContent;
		this.cReplyDate = cReplyDate;
		this.cReplyReply = cReplyReply;
	}
}
