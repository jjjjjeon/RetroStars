/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.NBoardDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class NBoardDAO {
	private static NBoardDAO instance;
	
	public synchronized static NBoardDAO getInstance() {
		if(instance == null) {
			return new NBoardDAO();
		} else {
			return instance;
		}
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public List<NBoardDTO> selectNtoM(int start, int end) throws Exception{
		List<NBoardDTO> list = new ArrayList<>();
		
		   String sql = "select * from ("+
		   "select rownum AS rnum, a.* from("+
				   "select*from n_board order by n_board_seq desc"+
		   ") a where rownum <= ?"+
				   ") where rnum >= ?";
		   
		   try(Connection conn = getConnection();
				   PreparedStatement pstmt = conn.prepareStatement(sql)){
			   pstmt.setInt(1,end);
			   pstmt.setInt(2,start);
			   
			   try(ResultSet rs = pstmt.executeQuery()){
				   while(rs.next()) {
					   NBoardDTO dto = new NBoardDTO();
					   dto.setnBoardSeq(rs.getInt("nBoardSeq"));
					   dto.setUserId(rs.getString("userId"));
					   dto.setnBoardTitle(rs.getString("nBoardTitle"));
					   dto.setnBoardContent(rs.getString("nBoardContent"));
					   dto.setnBoardDate(rs.getTimestamp("nBoardDate"));
					   dto.setnBoardView(rs.getInt("nBoardView"));
					   list.add(dto);
				   }
				   return list;
		   }
		   }
	}
	public int insert(NBoardDTO dto) throws Exception{
        String sql = "insert into n_board values(n_board_sequence.nextval, ?, ?, ?, sysdate,0)";
	      try (Connection con = this.getConnection(); 
	    		  PreparedStatement pstat = con.prepareStatement(sql)) {
	    	  
	    	  pstat.setString(1, dto.getUserId());
	    	  pstat.setString(2, dto.getnBoardTitle());
	    	  pstat.setString(3, dto.getnBoardContent());
	    	  
	    	  
	    	  return pstat.executeUpdate();
	    	  
	      }
	}
	// 게시글 개수 나타내는 메서드
	public int getRecordCount() throws Exception{
		String sql = "select count(*) from n_board";
		try(Connection con=this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			rs.next();
			return rs.getInt(1);
		}
	}
	
}
