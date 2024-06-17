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

import dto.CBoardBookmarkDTO;
import dto.MemberDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 * @author : Jin 
 * @version 1.0 
 */

public class MemberDAO {
	public static MemberDAO instance;
	
	public synchronized static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	public MemberDAO() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
    /** 
     * @Method Name  : loginId 
     * @date : 2024. 6. 13. 
     * @author : Jin 
     * @version : 
     * @Method info : 로그인 기능.
     * @param id
     * @param pw
     * @return boolean
     * @throws Exception 
     */ 
    public boolean loginId(String id, String pw) throws Exception {
        String sql = "select * from member where user_id = ? and user_pw = ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, id);
            pstat.setString(2, pw);
            try (ResultSet rs = pstat.executeQuery();) {
                return rs.next();
            }
        }
    }
    
    /** 
     * @Method Name  : deleteMember 
     * @date : 2024. 6. 13. 
     * @author : Jin 
     * @version : 
     * @Method info : 회원탈퇴 기능.
     * @param id
     * @return int
     * @throws Exception 
     */ 
    public int deleteMember(String id) throws Exception {
    	String sql = "delete from member where user_id = ?";
    	try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
    		pstat.setString(1, id);
    		return pstat.executeUpdate();
    	}
    	
    }
    
    /** 
     * @Method Name  : addMember 
     * @date : 2024. 6. 13. 
     * @author : Jin 
     * @version : 
     * @Method info : 회원가입 기능.
     * @param MemberDTO dto
     * @return int
     * @throws Exception 
     */ 
    public int addMember(MemberDTO dto) throws Exception {
        String sql = "insert into member (user_id, user_pw, user_name, user_nickname, user_no, user_phone, user_email, user_join_date) values(?, ?, ?, ?, ?, ?, ?, ?)";
        int result = 0;
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
        	pstat.setString(1, dto.getUserId());
        	pstat.setString(2, dto.getUserPw());
        	pstat.setString(3, dto.getUserName());
        	pstat.setString(4, dto.getUserNickname());
        	pstat.setString(5, dto.getUserNo());
        	pstat.setString(6, dto.getUserPhone());
        	pstat.setString(7, dto.getUserEmail());
        	pstat.setTimestamp(8, dto.getUserJoinDate());
//        	pstat.setString(9, dto.getUserProfileUrl());
//        	pstat.setString(10, dto.getUserLevel());
//        	pstat.setString(11, dto.getUserAdmin());
//        	pstat.setString(12, dto.getUserBlack());
//        	pstat.setString(13, dto.getUserActive());
            result = pstat.executeUpdate();
        }
        return result;
    }
    
    /** 
     * @Method Name  : 카카오 id 확인
     * @date : 2024. 6. 15. 
     * @author : Jin 
     * @version : 
     * @Method info : 로그인 시 id가 존재하는 지 확인.
     * @param 로그인 시 사용한 id
     * @return boolean
     * @throws Exception 
     */
    public boolean isMemberExists(String id) {
        String sql = "select count(*) from member where user_id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /** 
     * @Method Name  : id 중복확인
     * @date : 2024. 6. 16. 
     * @author : Jin 
     * @version : 
     * @Method info : 회원가입 시 id가 존재하는 지 확인.
     * @param 회원가입 시 사용한 id
     * @return boolean
     * @throws Exception 
     */
    public boolean isUserIdCheck(String userId) {
        String sql = "select count(*) from member where user_id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    /** 
     * @Method Name  : 닉네임 중복확인
     * @date : 2024. 6. 16. 
     * @author : Jin 
     * @version : 
     * @Method info : 회원가입 시 닉네임이 존재하는 지 확인.
     * @param 회원가입 시 사용한 닉네임
     * @return boolean
     * @throws Exception 
     */
    public boolean isUserNicknameCheck(String userNickname) {
        String sql = "select count(*) from member where user_nickname=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userNickname);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    /** 
     * @Method Name  : 닉네임 얻어오기
     * @date : 2024. 6. 17. 
     * @author : Jin 
     * @version : 
     * @Method info : 아이디에 따른 닉네임 가져오기
     * @param 로그인 시 사용한 id
     * @return 유저 닉네임
     * @throws Exception 
     */   
    public String getNickname(String userId) throws Exception {
        String sql = "select user_nickname FROM member WHERE user_id = ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, userId);
            try (ResultSet rs = pstat.executeQuery();) {
                if (rs.next()) {
                    String userNickname = rs.getString(1);
                    return userNickname;
                } else {
                    return null;
                }
            }
        }
    }
    
    
    /** 
     * @Method Name  : myData
     * @date : 2024. 6. 13. 
     * @author : kjy
     * @version : 
     * @Method info : 마이페이지 내 개인정보 출력 기능.
     * @param String id
     * @return MemberDTO dto
     * @throws Exception 
     */ 
    public MemberDTO myData(String id) throws Exception{
    	
    	String sql = "select * from member where user_id=?";
    	
    	try(Connection con = this.getConnection(); 
    			PreparedStatement pstat = con.prepareStatement(sql);){
    		pstat.setString(1,id);
    		try(ResultSet rs= pstat.executeQuery();){
    			MemberDTO dto = null;
    			while(rs.next()){
    			String userId =rs.getString(1);
    			String pw =rs.getString(2);
    			String name =rs.getString(3);
    			String nickName =rs.getString(4);
    			String no = rs.getString(5);
    			String phone =rs.getString(6);
    			String email=rs.getString(7);
    			Timestamp joinDate =rs.getTimestamp(8);
    			String level =rs.getString(9);
    			String admin =rs.getString(10);
    			String black =rs.getString(11);
    			String active =rs.getString(12);
    			
    			dto = new MemberDTO(userId, pw, name, nickName, no, phone, email, joinDate, level, admin, black, active);
    			}
    			return dto;
    		}
    	}
    	
    }
    
    /** 
     * @Method Name  : selectCBoradCate1
     * @date : 2024. 6. 14. 
     * @author : kjy
     * @version : 
     * @Method info : 마이페이지 내 자유게시판 북마크 출력
     * @param String id
     * @return List<CBoardBookmarkDTO>
     * @throws Exception 
     */ 
    
    public List<CBoardBookmarkDTO> selectCBoradCate1(String id) throws Exception {

		String sql = "select "
				+ "c.c_board_seq ,b.user_id, c.c_board_category, c.c_board_title, c.user_id, c.c_board_date "
				+ "from "
				+ "c_board c right outer join bookmark b on c.c_board_seq = b.c_board_seq "
				+ "where "
				+ "c.c_board_category = 1 and b.user_id = ? "
				+ "order by 5 desc";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1,id);
			try(ResultSet rs = pstat.executeQuery();){
				List<CBoardBookmarkDTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					String userId = rs.getString(2);
					int category = rs.getInt(3); 
					String title = rs.getString(4);
					String writerId = rs.getString(5);
					Timestamp date = rs.getTimestamp(6);
					list.add(new CBoardBookmarkDTO(seq,userId,category, title, writerId, date));
					System.out.println(userId+":"+category+":"+title+":"+writerId+":"+date);
					}
				return list;
			}
		}

	}
    
    /** 
     * @Method Name  : selectCBoradCate2
     * @date : 2024. 6. 14. 
     * @author : kjy
     * @version : 
     * @Method info : 마이페이지 내 공략 게시판 북마크 출력
     * @param String id
     * @return List<CBoardBookmarkDTO>
     * @throws Exception 
     */ 
    
    public List<CBoardBookmarkDTO> selectCBoradCate2(String id) throws Exception {

		String sql = "select "
				+ "c.c_board_seq ,b.user_id, c.c_board_category, c.c_board_title, c.user_id, c.c_board_date "
				+ "from "
				+ "c_board c right outer join bookmark b on c.c_board_seq = b.c_board_seq "
				+ "where "
				+ "c.c_board_category = 2 and b.user_id = ? "
				+ "order by 5 desc";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1,id);
			try(ResultSet rs = pstat.executeQuery();){
				List<CBoardBookmarkDTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					String userId = rs.getString(2);
					int category = rs.getInt(3); 
					String title = rs.getString(4);
					String writerId = rs.getString(5);
					Timestamp date = rs.getTimestamp(6);
					list.add(new CBoardBookmarkDTO(seq,userId,category, title, writerId, date));
					System.out.println(userId+":"+category+":"+title+":"+writerId+":"+date);
					}
				return list;
			}
		}

	}
    
    /** 
     * @Method Name  : updateData
     * @date : 2024. 6. 17. 
     * @author : kjy
     * @version : 
     * @Method info : 개인 정보 수정 페이지 내 수정 기능
     * @param MemberDTO dto
     * @return void
     * @throws Exception 
     */ 
    public void updateData(MemberDTO dto) throws Exception{
    	
    	String sql = "update member set user_name=?, user_nickname=?, user_no=?, user_email=?, user_phone=? where user_id=?";
    	
    	try(Connection con = this.getConnection(); 
    			PreparedStatement pstat = con.prepareStatement(sql);){
    		pstat.setString(1,dto.getUserName());
    		pstat.setString(2,dto.getUserNickname());
    		pstat.setString(3,dto.getUserNo());
    		pstat.setString(4,dto.getUserEmail());
    		pstat.setString(5,dto.getUserPhone());
    		pstat.setString(6,dto.getUserId());
    		pstat.executeUpdate();
    	}
    	
    }

}
