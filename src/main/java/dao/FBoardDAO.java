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
     * @Method Name  : listCate
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 별 질문 & 답변 출력
     * @param String category
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
	
	private List<FBoardDTO> listCate(String category) throws Exception {
        String sql = "select * from f_board where f_board_category=?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, category);
            try (ResultSet rs = pstat.executeQuery();) {
                List<FBoardDTO> list = new ArrayList<>();
                while (rs.next()) {
                    int seq = rs.getInt(1);
                    String id = rs.getString(2);
                    String categoryResult = rs.getString(3);
                    String q = rs.getString(4);
                    String a = rs.getString(5);
                    list.add(new FBoardDTO(seq, id, categoryResult, q, a));
                    //System.out.println(seq + ":" + id + ":" + categoryResult + ":" + q + ":" + a);
                }
                return list;
            }
        }
    }
	/** 
     * @Method Name  : listCate1
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 1 질문 & 답변 출력
     * @param 
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
    public List<FBoardDTO> listCate1() throws Exception {
        return listCate("1");
    }
    /** 
     * @Method Name  : listCate2
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 2 질문 & 답변 출력
     * @param 
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 

    public List<FBoardDTO> listCate2() throws Exception {
        return listCate("2");
    }
    /** 
     * @Method Name  : listCate3
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 3 질문 & 답변 출력
     * @param 
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
    public List<FBoardDTO> listCate3() throws Exception {
        return listCate("3");
    }
    /** 
     * @Method Name  : listCate
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 전체 질문 & 답변 출력
     * @param 
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
    public List<FBoardDTO> listCate() throws Exception {
        String sql = "select * from f_board";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql);
            		 ResultSet rs = pstat.executeQuery();) {
                List<FBoardDTO> list = new ArrayList<>();
                while (rs.next()) {
                    int seq = rs.getInt(1);
                    String id = rs.getString(2);
                    String categoryResult = rs.getString(3);
                    String q = rs.getString(4);
                    String a = rs.getString(5);
                    list.add(new FBoardDTO(seq, id, categoryResult, q, a));
                   // System.out.println(seq + ":" + id + ":" + categoryResult + ":" + q + ":" + a);
                }
                return list;
            }
        }
    
    
    
    
    /** 
     * @Method Name  : listCate
     * @date : 2024. 6. 16. 
     * @author : KJY
     * @version : 
     * @Method info : FAQ 카테고리 전체 질문 & 답변 출력
     * @param 
     * @param 
     * @return List<FBoardDTO>
     * @throws Exception 
     */ 
    
    public int getRecordCountAll() throws Exception {

		String sql = "select count(*) from f_board";

		try (Connection con = this.getConnection();
				PreparedStatement pstst = con.prepareStatement(sql);
				ResultSet rs = pstst.executeQuery()) {

			rs.next();
			int record = rs.getInt("count(*)");
			System.out.println(record);

			return record;
		}
	}

	public List<FBoardDTO> selectNtoM(int startNum, int endNum) throws Exception {

		String sql = "select * from (select f_board.*,row_number() over(order by f_board_seq desc) as row_count from f_board) where row_count between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstst = con.prepareStatement(sql);) {

			pstst.setInt(1, startNum);
			pstst.setInt(2, endNum);

			try (ResultSet rs = pstst.executeQuery();) {
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
    
    
 }



	
