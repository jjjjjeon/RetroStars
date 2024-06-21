/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QBoardDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Sam, 날짜 : 2024. 6. 13., 설명 : 최초작성
 *
 * @author : Sam
 * @version 1.0 
 */
public class QBoardDAO {
	//singletone
	private QBoardDAO() {}
	public static QBoardDAO instance;

	public synchronized static QBoardDAO getInstance() {
		if(instance==null) {
			instance=new QBoardDAO();
		}
		return instance;
	}

	//JNDI
	private Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	//0.secret string(true,false) to string(y,n)
	public String getSecretYN(String secretString) {
		if(secretString.equals("true")) {
			return "Y";
		}else if(secretString.equals("false")) {
			return "N";
		}else {
			return null;
		}		
	}

	//0. 카테고리 코드를 검색하는 함수
	public int getCategory(String categoryName) throws Exception{
		String sql="select q_board_category from q_category where q_board_category_name=?";

		try(Connection con=this.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);){	
			ps.setString(1, categoryName);
			try(ResultSet rs=ps.executeQuery();){
				while(rs.next()) {
					int QBoardCategory=rs.getInt("q_board_category");
					return QBoardCategory;
				}
				return 0;
			}
		}

	}
	
	//0.카테고리 이름을 검색하는 함수
	public String getCategoryCode(int categoryCode) throws Exception{
		if(categoryCode==1) {
			return "게임문의";
		}else if(categoryCode==2) {
			return "제휴문의";
		}else if(categoryCode==3) {
			return "기타문의";
		}
		return null;
	}
	
	


	//1. 글 추가하기 insert
	public int insert(QBoardDTO dto) throws Exception{
		String sql="insert into q_board values(q_board_sequence.nextval,?,?,?,?,sysdate,?,?)";
		try(Connection con=this.getConnection();
				PreparedStatement ps=con.prepareStatement(sql, new String[] {"q_board_seq"});){
			ps.setString(1, dto.getUserId());
			ps.setInt(2, dto.getqBoardCategory());
			ps.setString(3, dto.getqBoardTitle());
			ps.setString(4, dto.getqBoardContent());
			ps.setString(5, dto.getqBoardAnswer());
			ps.setString(6, dto.getqBoardSecret());
			ps.executeUpdate();
			try(ResultSet rs=ps.getGeneratedKeys();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}


	//2.페이지별 게시글 select 하기
	public ArrayList<HashMap<String,?>> select(int startnum, int endnum, int category, String strsearchBy, String strsearchData) throws Exception {
		ArrayList<HashMap<String,?>> list = new ArrayList<>();
		
		//전체 카테고리일 때
		if(category==0) {
			//검색이 있을 때
			if(!(strsearchBy.equals("0"))) {
				String sql= "SELECT s.*, m.user_nickname  as nickname FROM ( SELECT q_board.*, row_number() "+ 
						"OVER (ORDER BY q_board_seq DESC) AS rown FROM q_board where "+strsearchBy+" Like ?) s "+
						"LEFT JOIN MEMBER m ON s.user_id=m.user_id "+
						"WHERE rown BETWEEN ? AND ?";

				try (Connection con = this.getConnection();
						PreparedStatement ps = con.prepareStatement(sql);) {
					ps.setString(1, "%"+strsearchData+"%");
					ps.setInt(2, startnum);
					ps.setInt(3, endnum);

					try (ResultSet rs = ps.executeQuery();) {
						while (rs.next()) {
							HashMap map=new HashMap<>();
							map.put("qBoardSeq", rs.getInt("q_board_seq"));
							map.put("userId", rs.getString("user_id"));
							map.put("qBoardCategory", rs.getInt("q_board_category"));
							map.put("qBoardTitle", rs.getString("q_board_title"));
							map.put("qBoardContent", rs.getString("q_board_content"));
							map.put("qBoardDate", rs.getTimestamp("q_board_date"));
							map.put("qBoardAnswer", rs.getString("q_board_answer"));
							map.put("qBoardSecret", rs.getString("q_board_secret"));
							map.put("qBoardUserNickname", rs.getString("nickname"));
							list.add(map);
						}

				        return list;
					}
				}


				//검색을 하지 않을 때
			}else {
				String sql = "SELECT s.*, m.user_nickname as nickname FROM ( SELECT q_board.*, row_number() "+
						"OVER (ORDER BY q_board_seq DESC) AS rown FROM q_board) s " +
						"LEFT JOIN MEMBER m ON s.user_id=m.user_id "+
						"WHERE rown BETWEEN ? AND ?";

				try (Connection con = this.getConnection();
						PreparedStatement ps = con.prepareStatement(sql);) {
					ps.setInt(1, startnum);
					ps.setInt(2, endnum);

					try (ResultSet rs = ps.executeQuery();) {
						while (rs.next()) {
							HashMap map=new HashMap<>();
							map.put("qBoardSeq", rs.getInt("q_board_seq"));
							map.put("userId", rs.getString("user_id"));
							map.put("qBoardCategory", rs.getInt("q_board_category"));
							map.put("qBoardTitle", rs.getString("q_board_title"));
							map.put("qBoardContent", rs.getString("q_board_content"));
							map.put("qBoardDate", rs.getTimestamp("q_board_date"));
							map.put("qBoardAnswer", rs.getString("q_board_answer"));
							map.put("qBoardSecret", rs.getString("q_board_secret"));
							map.put("qBoardUserNickname", rs.getString("nickname"));
							list.add(map);
						}

				        return list;
					}
				}
			}

			//카테고리로 구분할 때
		}else {
			//검색이 있을 때
			if(!(strsearchBy.equals("0"))) {
				String sql = "SELECT s.*, m.user_nickname  as nickname FROM ( SELECT q_board.*, row_number() "+
						"OVER (ORDER BY q_board_seq DESC) AS rown "+
						"FROM q_board WHERE q_board_category=? AND "+strsearchBy+" LIKE ?) s " +
						"LEFT JOIN MEMBER m ON s.user_id=m.user_id "+
						"WHERE rown BETWEEN ? AND ?";

				try (Connection con = this.getConnection();
						PreparedStatement ps = con.prepareStatement(sql);) {
					ps.setInt(1, category);
					ps.setString(2, "%"+strsearchData+"%");
					ps.setInt(3, startnum);
					ps.setInt(4, endnum);

					try (ResultSet rs = ps.executeQuery();) {
						while (rs.next()) {
							HashMap map=new HashMap<>();
							map.put("qBoardSeq", rs.getInt("q_board_seq"));
							map.put("userId", rs.getString("user_id"));
							map.put("qBoardCategory", rs.getInt("q_board_category"));
							map.put("qBoardTitle", rs.getString("q_board_title"));
							map.put("qBoardContent", rs.getString("q_board_content"));
							map.put("qBoardDate", rs.getTimestamp("q_board_date"));
							map.put("qBoardAnswer", rs.getString("q_board_answer"));
							map.put("qBoardSecret", rs.getString("q_board_secret"));
							map.put("qBoardUserNickname", rs.getString("nickname"));
							list.add(map);
						}

				        return list;
					}
				}
			//검색이 없을 때
			}else {
				String sql = "SELECT s.*, m.user_nickname  as nickname FROM ( " +
						"SELECT q_board.*, row_number() OVER (ORDER BY q_board_seq DESC) AS rown " +
						"FROM q_board WHERE q_board_category=?) s " +
						"LEFT JOIN MEMBER m ON s.user_id=m.user_id "+
						"WHERE rown BETWEEN ? AND ?";

				try (Connection con = this.getConnection();
						PreparedStatement ps = con.prepareStatement(sql);) {
					ps.setInt(1, category);
					ps.setInt(2, startnum);
					ps.setInt(3, endnum);

					try (ResultSet rs = ps.executeQuery();) {
						while (rs.next()) {
							HashMap map=new HashMap<>();
							map.put("qBoardSeq", rs.getInt("q_board_seq"));
							map.put("userId", rs.getString("user_id"));
							map.put("qBoardCategory", rs.getInt("q_board_category"));
							map.put("qBoardTitle", rs.getString("q_board_title"));
							map.put("qBoardContent", rs.getString("q_board_content"));
							map.put("qBoardDate", rs.getTimestamp("q_board_date"));
							map.put("qBoardAnswer", rs.getString("q_board_answer"));
							map.put("qBoardSecret", rs.getString("q_board_secret"));
							map.put("qBoardUserNickname", rs.getString("nickname"));
							list.add(map);
						}

				        return list;
					}
				}
			}

		}
	}


	//3. 현재 전체 보드 카운티하는 함수
	public int getRecordCount(int category, String strsearchBy, String strsearchData) throws Exception {
		int result=0;

		//전체 카테고리일 때
		if(category==0) {
			//검색이 있을 때
			if(!(strsearchBy.equals("0"))) {
				String sql="select count(*) from q_board where "+ strsearchBy +" Like ?";

				try(Connection con=this.getConnection();
						PreparedStatement ps=con.prepareStatement(sql);){
					ps.setString(1, "%"+strsearchData+"%");
					try(ResultSet rs=ps.executeQuery();){
						rs.next();
						result= rs.getInt(1);
						return result;
					}	
				}
				//검색이 없을 때
			}else {
				String sql="select count(*) from q_board";

				try(Connection con=this.getConnection();
						PreparedStatement ps=con.prepareStatement(sql);){	
					try(ResultSet rs=ps.executeQuery();){
						rs.next();
						result= rs.getInt(1);
						return result;
					}	
				}
			}

			//카테고리를 구분할 때
		}else {
			//검색이 있을 때
			if(!(strsearchBy.equals("0"))) {
				String sql="select count(*) from q_board where q_board_category=? and "+ strsearchBy +" Like ?";
				try(Connection con=this.getConnection();
						PreparedStatement ps=con.prepareStatement(sql);){
					ps.setInt(1, category);
					ps.setString(2, "%"+strsearchData+"%");
					try(ResultSet rs=ps.executeQuery();){
						rs.next();
						result= rs.getInt(1);
						return result;
					}	
				}


				//검색이 없을 때
			}else {
				String sql="select count(*) from q_board where q_board_category=?";

				try(Connection con=this.getConnection();
						PreparedStatement ps=con.prepareStatement(sql);){
					ps.setInt(1, category);
					try(ResultSet rs=ps.executeQuery();){
						rs.next();
						result= rs.getInt(1);
						return result;
					}	
				}
			}
		}
	}

	//4. 디테일페이지에서 내용 출력하기
	public HashMap<String,?> selectcontent(int searchseq) throws Exception{
		String sql="select q.*, m.user_nickname as nickname from q_board q "+
				 "left join member m on q.user_id = m.user_id "+   
				 "where q_board_seq=? ";
					
		try(Connection con=this.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);){	
			ps.setInt(1, searchseq);
			try(ResultSet rs=ps.executeQuery();){
				while(rs.next()) {
					HashMap map=new HashMap<>();
					map.put("qBoardSeq", rs.getInt("q_board_seq"));
					map.put("userId", rs.getString("user_id"));
					map.put("qBoardCategory", rs.getInt("q_board_category"));
					map.put("qBoardTitle", rs.getString("q_board_title"));
					map.put("qBoardContent", rs.getString("q_board_content"));
					map.put("qBoardDate", rs.getTimestamp("q_board_date"));
					map.put("qBoardAnswer", rs.getString("q_board_answer"));
					map.put("qBoardSecret", rs.getString("q_board_secret"));
					map.put("qBoardUserNickname", rs.getString("nickname"));
					return map;
				}
				return null;
			}
		}
	}

	//4. delete
	public int deleteBySeq(int targetseq) throws Exception{
		String sql="delete from q_board where q_board_seq=?";
		try(Connection con=this.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);){
			ps.setInt(1, targetseq);
			return ps.executeUpdate();
		}
	}

	//5. update
	public int updateBySeq(int targetseq, String targettitle, String targetcontents) throws Exception{
		String sql="update q_board set q_board_title=?, q_board_content=? where q_board_seq=? ";

		try(Connection con=this.getConnection();
				PreparedStatement ps=con.prepareStatement(sql);){
			ps.setString(1, targettitle);
			ps.setString(2, targetcontents);
			ps.setInt(3, targetseq);
			return ps.executeUpdate();
		}
	}
	
	//6. updateAnswer
		public int updateAnswer(int targetseq, String strselected) throws Exception{
			String sql="";
			if(strselected.equals("답변대기")) {
				sql="update q_board set q_board_answer='N' where q_board_seq=? ";
			}else if(strselected.equals("답변완료")) {
				sql="update q_board set q_board_answer='Y' where q_board_seq=? ";
			}
			

			try(Connection con=this.getConnection();
					PreparedStatement ps=con.prepareStatement(sql);){
				ps.setInt(1, targetseq);
				return ps.executeUpdate();
			}
		}



	/*//더미데이터만들기
	public static void main(String[] args) throws SQLException {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="star";
		String pw="star";

		String sql="insert into q_board values(q_board_sequence.nextval,'test',3,?,?,sysdate,'Y','N')";

		try(Connection con= DriverManager.getConnection(url, id, pw);
				PreparedStatement pstat=con.prepareStatement(sql);){
			for(int i=1; i<30; i++) {
				pstat.setString(1, "test"+(i));
				pstat.setString(2, "content"+(i));
				pstat.addBatch();
			}
			pstat.executeBatch();
		}
	}*/






}