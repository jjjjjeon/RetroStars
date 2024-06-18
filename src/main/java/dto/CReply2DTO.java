package dto;

import java.sql.Timestamp;

public class CReply2DTO {
	private int cReplySeq;
	private int cBoardSeq;
	private String userNickname;
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
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
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
	public CReply2DTO() {
		super();
	}
	public CReply2DTO(int cReplySeq, int cBoardSeq, String userNickname, String cReplyContent, Timestamp cReplyDate,
			int cReplyReply) {
		super();
		this.cReplySeq = cReplySeq;
		this.cBoardSeq = cBoardSeq;
		this.userNickname = userNickname;
		this.cReplyContent = cReplyContent;
		this.cReplyDate = cReplyDate;
		this.cReplyReply = cReplyReply;
	}
}
