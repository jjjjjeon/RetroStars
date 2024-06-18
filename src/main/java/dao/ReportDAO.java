/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReportDTO;

public class ReportDAO {
	private static ReportDAO instance;

	public synchronized static ReportDAO getInstance() {
		if (instance == null) {
			return new ReportDAO();
		} else {
			return instance;
		}
	}

	private ReportDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//유저게시판 글 신고가 중복된 사람에 의한 것인지 확인
	public boolean isDuplicate(int seq, String id) throws Exception{
		String sql = "select * from report where c_board_seq = ? and user_id = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					return true;
				}else {
					return false;
				}
			}
		}
		
		
	}
	
	
	//유저게시판 글 신고 내역 DB에 저장
	public String addReport(ReportDTO report) throws Exception {
		String sql = "insert into report values(report_sequence.nextval, ?, ?, ?, sysdate)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, report.getcBoardSeq());
			pstat.setString(2, report.getUserId());
			pstat.setInt(3, report.getReportType());
			int result = pstat.executeUpdate();
			
			if(result > 0) {
				return "success";
			}else {
				return "failed";
			}
		}
		
		
		
	}
	
	
}
