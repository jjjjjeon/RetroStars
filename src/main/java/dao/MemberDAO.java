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

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
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
     * @return
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

}
