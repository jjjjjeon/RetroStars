/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

public class ReportDTO {
	private int reportSeq;
	private int cBoardSeq;
	private String userId;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public ReportDTO() {
		super();
	}
	public ReportDTO(int reportSeq, int cBoardSeq, String userId, int reportType, Timestamp reportDate) {
		super();
		this.reportSeq = reportSeq;
		this.cBoardSeq = cBoardSeq;
		this.userId = userId;
		this.reportType = reportType;
		this.reportDate = reportDate;
	}
}
