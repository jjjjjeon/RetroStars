/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CReplyDTO;



public class CReplyDAO {
	private static CReplyDAO instance;

	public synchronized static CReplyDAO getInstance() {
		if (instance == null) {
			return new CReplyDAO();
		} else {
			return instance;
		}
	}

	private CReplyDAO() {}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	//유저게시판 글에 댓글 등록
	public void addReple(CReplyDTO reple) throws Exception{
		String sql = "insert into c_reply values(c_reply_sequence.nextval, ?, ?, ?, sysdate, null)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, reple.getcBoardSeq());
			pstat.setString(2, reple.getUserId());
			pstat.setString(3, reple.getcReplyContent());
			pstat.executeUpdate();
		}
	}
	
	//유저게시판 글의 댓글 목록 반환
	public List<CReplyDTO> viewRepleList(int parentSeq) throws Exception{
		String sql = "select * from c_reply where c_board_seq = ? order by c_reply_seq desc";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,parentSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<CReplyDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(3);
					String content = rs.getString(4);
					Timestamp date = rs.getTimestamp(5);
					
					CReplyDTO reple = new CReplyDTO(seq, parentSeq, writer, content, date, 0);
					list.add(reple);
				}
				return list;
			}
		}
	}
	
	//유저게시판 글의 댓글 삭제
	public void delReple(int seq) throws Exception {
		String sql = "delete from c_reply where c_reply_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
}
