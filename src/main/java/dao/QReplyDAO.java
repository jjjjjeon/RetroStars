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

import dto.QReplyDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 17.
 * History :
 *  - 작성자 : Sam, 날짜 : 2024. 6. 17., 설명 : 최초작성
 *
 * @author : Sam 
 * @version 1.0 
 */
public class QReplyDAO {
	//singletone
		private QReplyDAO() {}
		public static QReplyDAO instance;

		public synchronized static QReplyDAO getInstance() {
			if(instance==null) {
				instance=new QReplyDAO();
			}
			return instance;
		}
		
		//JNDI
		private Connection getConnection() throws Exception{
			Context ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			return ds.getConnection();
		}
		
		//1.  댓글 추가하기 insert
		public QReplyDTO insert(QReplyDTO dto) throws Exception {
		    String sql = "insert into q_reply values(q_reply_sequence.nextval,?,?,?,sysdate)";
		    try (Connection con = this.getConnection(); PreparedStatement ps = con.prepareStatement(sql, new String[]{"q_reply_seq", "q_reply_date"})) {
		        ps.setInt(1, dto.getqBoardSeq());
		        ps.setString(2, dto.getUserId());
		        ps.setString(3, dto.getqReplyContent());
		        ps.executeUpdate();
		        
		        try (ResultSet rs = ps.getGeneratedKeys()) {
		            if (rs.next()) {
		                int qReplySeq = rs.getInt(1);
		                Timestamp qReplyDate = rs.getTimestamp(2);
		                return new QReplyDTO(qReplySeq, dto.getqBoardSeq(), dto.getUserId(), dto.getqReplyContent(), qReplyDate);
		            } else {
		                return null;
		            }
		        }
		    }
		}



}
