/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	

}
