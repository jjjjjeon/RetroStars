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

import dto.UserProfileImgDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 17.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 17., 설명 : 최초작성
 * @author : KJY 
 * @version 1.0 
 */
public class UserProfileImgDAO {
	
	public static UserProfileImgDAO instance;
	
	public synchronized static UserProfileImgDAO getInstance() {
		if(instance == null) {
			instance = new UserProfileImgDAO();
		}
		return instance;
	}
	
	public UserProfileImgDAO() {}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public String updateImg(UserProfileImgDTO file) throws Exception{
		
		String sql = "update into user_profile_img set oriname=?, sysname=? where user_id=?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(3, file.getUserId());
			pstat.setString(1, file.getProfileImgOriname());
			pstat.setString(2, file.getProfileImgSysname());
			int count = pstat.executeUpdate();
			
			// 등록된 이미지가 없을 때, 최초 insert 하는 메서드로 이동하는 기능
			if(count < 1) {
				insertImg(file);
				return "default.png";
			}else {
				return file.getProfileImgSysname();			
			}			
		}
	}
	
	private String insertImg(UserProfileImgDTO file) throws Exception {
		String sql = "insert into user_profile_img values(user_profile_img_sequence.nextval, ?, default.png, default.png)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, file.getUserId());
			pstat.executeUpdate();
			return file.getProfileImgSysname();
		}
	}
	
	public String selectMyUrl(String id) throws Exception{
		
		String sql = "select profile_img_sysname from user_profile_img where user_id=?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			
			try(ResultSet rs = pstat.executeQuery();){
				String sysname ="";
				while(rs.next()) {
					sysname = rs.getString(1);
				}
				return sysname;
			}
		}
	}

}
