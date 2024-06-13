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

	//0. 카테고리 이름을 검색하는 함수
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




}
