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
					   dto.setnBoardSeq(rs.getInt("n_board_seq"));
					   dto.setUserId(rs.getString("user_id"));
					   dto.setnBoardTitle(rs.getString("n_board_title"));
					   dto.setnBoardContent(rs.getString("n_board_content"));
					   dto.setnBoardDate(rs.getTimestamp("n_board_date"));
					   dto.setnBoardView(rs.getInt("n_board_view"));

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
	// 게시물 삭제
	public int removePage(int seq) throws Exception{
		String sql = "delete from n_board where n_board_seq=?";
		   try(Connection con = this.getConnection();
				   PreparedStatement pstat = con.prepareStatement(sql)){
			   pstat.setInt(1, seq);
			   int result = pstat.executeUpdate();
			   
			   return result;
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
	
	// 디테일페이지
	public NBoardDTO detailPage(int seq) throws Exception{
		String sql = "select*from n_board where n_board_seq=?";
		   try(Connection con = this.getConnection();
				   PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1,seq);
			
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				NBoardDTO dto = new NBoardDTO();
				   dto.setnBoardSeq(rs.getInt("n_board_seq"));
				   dto.setUserId(rs.getString("user_id"));
				   dto.setnBoardTitle(rs.getString("n_board_title"));
				   dto.setnBoardContent(rs.getString("n_board_content"));
				   dto.setnBoardDate(rs.getTimestamp("n_board_date"));
				   dto.setnBoardView(rs.getInt("n_board_view"));

				   return dto;
			}
		}
	}
	
		// 게시글 수정
		public int updateNBoard(NBoardDTO dto) throws Exception {
		    String sql = "update n_board set n_board_title=?, n_board_content=? where n_board_seq=?";
		    try (Connection con = this.getConnection();
		         PreparedStatement pstat = con.prepareStatement(sql)) {
		        pstat.setString(1, dto.getnBoardTitle());
		        pstat.setString(2, dto.getnBoardContent());
		        pstat.setInt(3, dto.getnBoardSeq());
		        
		        System.out.println("삭제 성공");
		        int result = pstat.executeUpdate();
		        return result;
		    }
		}
		
		// 조회수
		public int updateViewCount(int seq) throws Exception{
			String sql = "update n_board set n_board_view=n_board_view + 1 where n_board_seq=?";
			try(Connection con= this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setInt(1,seq);
				return pstat.executeUpdate();
			}
		}
		
		// 제목으로 검색
		public List<NBoardDTO> searchListByTitle(String keyword) throws Exception {
		    List<NBoardDTO> noticeList = new ArrayList<>();
		    
		    String sql = "SELECT * FROM n_board WHERE n_board_title LIKE ?";
		    
		    try (Connection con = this.getConnection();
		         PreparedStatement pstat = con.prepareStatement(sql)) {
		        
		    	pstat.setString(1, "%" + keyword + "%"); 
		    	
		        try (ResultSet rs = pstat.executeQuery()) {
		            while (rs.next()) {
		                NBoardDTO searchDto = new NBoardDTO();
		                searchDto.setnBoardSeq(rs.getInt("n_board_seq"));
		                searchDto.setUserId(rs.getString("user_id"));
		                searchDto.setnBoardTitle(rs.getString("n_board_title"));
		                searchDto.setnBoardContent(rs.getString("n_board_content"));
		                searchDto.setnBoardDate(rs.getTimestamp("n_board_date"));
		                searchDto.setnBoardView(rs.getInt("n_board_view"));
		                
		                noticeList.add(searchDto);
		            }
		            if (noticeList.isEmpty()) {
		                // 검색 결과가 없을 때 처리할 메시지를 서버 콘솔에 출력
		                System.out.println("검색 결과가 없음");
		            }
		        }
		    }
		    
		    return noticeList;
		}

		// 글번호로 검색
		public List<NBoardDTO> searchListByPostNumber(String keyword) throws Exception {
		    List<NBoardDTO> noticeList = new ArrayList<>();
		    
		    String sql = "SELECT * FROM n_board WHERE n_board_seq LIKE ?";
		    
		    try (Connection con = this.getConnection();
		         PreparedStatement pstat = con.prepareStatement(sql)) {
		        
		    	pstat.setString(1, "%" + keyword + "%"); 
		    	
		        try (ResultSet rs = pstat.executeQuery()) {
		            while (rs.next()) {
		                NBoardDTO searchDto = new NBoardDTO();
		                searchDto.setnBoardSeq(rs.getInt("n_board_seq"));
		                searchDto.setUserId(rs.getString("user_id"));
		                searchDto.setnBoardTitle(rs.getString("n_board_title"));
		                searchDto.setnBoardContent(rs.getString("n_board_content"));
		                searchDto.setnBoardDate(rs.getTimestamp("n_board_date"));
		                searchDto.setnBoardView(rs.getInt("n_board_view"));
		                
		                noticeList.add(searchDto);
		            }
		            if (noticeList.isEmpty()) {
		                // 검색 결과가 없을 때 처리할 메시지를 서버 콘솔에 출력
		                System.out.println("검색 결과가 없음");
		            }
		        }
		    }
		    
		    return noticeList;
		}
		

		
		

	
	
}
