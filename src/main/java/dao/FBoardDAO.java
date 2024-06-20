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

import dto.FBoardDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 16.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 16., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
public class FBoardDAO {
	
	public static FBoardDAO instance;
	
	public synchronized static FBoardDAO getInstance() {
		if (instance == null) {
			instance = new FBoardDAO();
		}
		return instance;
	}
	
	public FBoardDAO() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
    /** 
     * @Method Name  : listCateNtoM
     * @date : 2024. 6. 19. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 별 질문 & 답변 수 지정갯수만큼 출력
     * @param String category
     * @param int start
     * @param int end
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
	
	public List<FBoardDTO> listCateNtoM(String category, int start, int end) throws Exception {
        
		String sql = "";
		if(category.equals("0")) {
			sql = "select * from (select f_board.*,row_number() over(order by f_board_seq desc) as row_count from f_board) where row_count between ? and ?";
		}else if(category.equals("1")) {
			sql = "select * from (select f_board.*,row_number() over(order by f_board_seq desc) as row_count from f_board where f_board_category='1') where row_count between ? and ?";
		}else if(category.equals("2")) {
			sql = "select * from (select f_board.*,row_number() over(order by f_board_seq desc) as row_count from f_board where f_board_category='2') where row_count between ? and ?";
		}else {
			sql = "select * from (select f_board.*,row_number() over(order by f_board_seq desc) as row_count from f_board where f_board_category='3') where row_count between ? and ?";
		}
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setInt(1, start);
            pstat.setInt(2, end);
            try (ResultSet rs = pstat.executeQuery();) {
                List<FBoardDTO> list = new ArrayList<>();
                while (rs.next()) {
                    int seq = rs.getInt(1);
                    String id = rs.getString(2);
                    String categoryResult = rs.getString(3);
                    String q = rs.getString(4);
                    String a = rs.getString(5);
                    list.add(new FBoardDTO(seq, id, categoryResult, q, a));
                    System.out.println(seq + ":" + id + ":" + categoryResult + ":" + q + ":" + a);
                }
                return list;
            }
        }
    }
    
    /** 
     * @Method Name  : getRecordCount
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 별 전체 레코드 수 출력
     * @param String category
     * @param 
     * @return int
     * @throws Exception 
     */ 
    
    public int getRecordCount(String category) throws Exception {
    	
    	String sql = "";
    	
    	if(category.equals("0")) {
			sql = "select count(*) from f_board";
		}else if(category.equals("1")) {
			sql = "select count(*) from f_board group by F_BOARD_CATEGORY having F_BOARD_CATEGORY = '1'";
		}else if(category.equals("2")) {
			sql = "select count(*) from f_board group by F_BOARD_CATEGORY having F_BOARD_CATEGORY = '2'";
		}else {
			sql = "select count(*) from f_board group by F_BOARD_CATEGORY having F_BOARD_CATEGORY = '3'";
		}
		try (Connection con = this.getConnection();
				PreparedStatement pstst = con.prepareStatement(sql);
				ResultSet rs = pstst.executeQuery()) {

			rs.next();
			int record = rs.getInt("count(*)");
			System.out.println(record);

			return record;
		}
	}
    
    
    /** 
     * @Method Name  : listCateNtoM
     * @date : 2024. 6. 19. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 별 질문 & 답변 수 지정갯수만큼 출력
     * @param String kind
     * @param String category
     * @param String search
     * @param int start
     * @param int end
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
	
	public List<FBoardDTO> searchNtoM(String kind, String category, String search, int start, int end) throws Exception {
        
		String sql = "";
		String searchContent = "%"+search+"%"; 
		
		if(kind.equals("title")) {
			if(category.equals("1")) {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_category = '1' AND f_board_question LIKE ?)"
						+ "where row_count between ? and ?";
			}else if(category.equals("2")) {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_category = '2' AND f_board_question LIKE ?)"
						+ "where row_count between ? and ?";
			}else if(category.equals("3")) {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_category = '3' AND f_board_question LIKE ?)"
						+ "where row_count between ? and ?";
			}else {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_question LIKE ?)"
						+ "where row_count between ? and ?";
			}
		}else if(kind.equals("content")) {
			if(category.equals("1")) {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_category = '1' AND f_board_answer LIKE ?)"
						+ "where row_count between ? and ?";
			}else if(category.equals("2")) {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_category = '2' AND f_board_answer LIKE ?)"
						+ "where row_count between ? and ?";
			}else if(category.equals("3")) {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_category = '3' AND f_board_answer LIKE ?)"
						+ "where row_count between ? and ?";
			}else {
				sql = "select * from "
						+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
						+ "FROM f_board "
						+ "WHERE f_board_answer LIKE ?)"
						+ "where row_count between ? and ?";
			}
		}else if(kind.equals("title_content")) {
			if(category.equals("1")) {
				sql = newString(category,search);
			}else if(category.equals("2")) {
				sql = newString(category,search);
			}else if(category.equals("3")) {
				sql = newString(category,search);
			}else {
				sql = newString("0",search);
			}
		}
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
        	pstat.setString(1, searchContent);
            pstat.setInt(2, start);
            pstat.setInt(3, end);
            try (ResultSet rs = pstat.executeQuery();) {
                List<FBoardDTO> list = new ArrayList<>();
                while (rs.next()) {
                    int seq = rs.getInt(1);
                    String id = rs.getString(2);
                    String categoryResult = rs.getString(3);
                    String q = rs.getString(4);
                    String a = rs.getString(5);
                    list.add(new FBoardDTO(seq, id, categoryResult, q, a));
                    System.out.println(seq + ":" + id + ":" + categoryResult + ":" + q + ":" + a);
                }
                return list;
            }
        }
        
	}
	
	private String newString(String category,String search) throws Exception {
    	
		String sql = "";
		
		if(category.equals("0")) {
			sql = "select * from "
					+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
					+ "FROM f_board "
					+ "WHERE f_board_question LIKE '"+search+"' or f_board_answer LIKE ?)"
					+ "where row_count between ? and ?";
		}else {
			sql = "select * from "
					+ "( select f_board.*, row_number() OVER (ORDER BY f_board_seq DESC) AS row_count "
					+ "FROM f_board "
					+ "WHERE f_board_category = '"+category+"' AND (f_board_question LIKE '"+search+"' or f_board_answer LIKE ? ))"
					+ "where row_count between ? and ?";
		}
    	
    	return sql;
    	
    }
	
	
//public int searchRecordCount(String category) throws Exception {
//    	
//    	String sql = "";
//    	
//    	if(category.equals("0")) {
//			sql = "select count(*) from f_board";
//		}else if(category.equals("1")) {
//			sql = "select count(*) from f_board group by F_BOARD_CATEGORY having F_BOARD_CATEGORY = '1'";
//		}else if(category.equals("2")) {
//			sql = "select count(*) from f_board group by F_BOARD_CATEGORY having F_BOARD_CATEGORY = '2'";
//		}else {
//			sql = "select count(*) from f_board group by F_BOARD_CATEGORY having F_BOARD_CATEGORY = '3'";
//		}
//		try (Connection con = this.getConnection();
//				PreparedStatement pstst = con.prepareStatement(sql);
//				ResultSet rs = pstst.executeQuery()) {
//
//			rs.next();
//			int record = rs.getInt("count(*)");
//			System.out.println(record);
//
//			return record;
//		}
//	}
    
 }



	
