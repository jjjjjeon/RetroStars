package dto;

import java.sql.Timestamp;

public class Report2DTO {
	private int reportSeq;
	private int cBoardSeq;
	private String userNickname;
	private int reportType;
	private Timestamp reportDate;
	
	public int getReportSeq() {
		return reportSeq;
	}
	public void setReportSeq(int reportSeq) {
		this.reportSeq = reportSeq;
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
	public int getReportType() {
		return reportType;
	}
	public void setReportType(int reportType) {
		this.reportType = reportType;
	}
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public Report2DTO() {
		super();
	}
	public Report2DTO(int reportSeq, int cBoardSeq, String userNickname, int reportType, Timestamp reportDate) {
		super();
		this.reportSeq = reportSeq;
		this.cBoardSeq = cBoardSeq;
		this.userNickname = userNickname;
		this.reportType = reportType;
		this.reportDate = reportDate;
	}
}
