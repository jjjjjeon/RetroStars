package dto;

import java.sql.Timestamp;

public class CBoard2DTO {
	private int cBoardSeq;
	private String userNickname;
	private int cBoardCategory;
	private String cBoardTitle;
	private String cBoardContent;
	private Timestamp cBoarDate;
	private int cBoardView;
	private int cBoardReport;
	private int cBoardBookmark;
	
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
	public int getcBoardCategory() {
		return cBoardCategory;
	}
	public void setcBoardCategory(int cBoardCategory) {
		this.cBoardCategory = cBoardCategory;
	}
	public String getcBoardTitle() {
		return cBoardTitle;
	}
	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}
	public String getcBoardContent() {
		return cBoardContent;
	}
	public void setcBoardContent(String cBoardContent) {
		this.cBoardContent = cBoardContent;
	}
	public Timestamp getcBoarDate() {
		return cBoarDate;
	}
	public void setcBoarDate(Timestamp cBoarDate) {
		this.cBoarDate = cBoarDate;
	}
	public int getcBoardView() {
		return cBoardView;
	}
	public void setcBoardView(int cBoardView) {
		this.cBoardView = cBoardView;
	}
	public int getcBoardReport() {
		return cBoardReport;
	}
	public void setcBoardReport(int cBoardReport) {
		this.cBoardReport = cBoardReport;
	}
	public int getcBoardBookmark() {
		return cBoardBookmark;
	}
	public void setcBoardBookmark(int cBoardBookmark) {
		this.cBoardBookmark = cBoardBookmark;
	}
	public CBoard2DTO() {
		super();
	}
	public CBoard2DTO(int cBoardSeq, String userNickname, int cBoardCategory, String cBoardTitle, String cBoardContent,
			Timestamp cBoarDate, int cBoardView, int cBoardReport, int cBoardBookmark) {
		super();
		this.cBoardSeq = cBoardSeq;
		this.userNickname = userNickname;
		this.cBoardCategory = cBoardCategory;
		this.cBoardTitle = cBoardTitle;
		this.cBoardContent = cBoardContent;
		this.cBoarDate = cBoarDate;
		this.cBoardView = cBoardView;
		this.cBoardReport = cBoardReport;
		this.cBoardBookmark = cBoardBookmark;
	}
}
