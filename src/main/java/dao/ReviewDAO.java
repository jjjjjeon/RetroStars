/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class ReviewDAO {
	

    public static void main(String[] args) throws SQLException {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "diary";
        String pw = "diary";

        String sql = "insert into review values(review_sequence.nextval, ?, ?, ?, ?, ?, ?, sysdate)";

        Random random = new Random();

        try (Connection con = DriverManager.getConnection(url, id, pw);
             PreparedStatement pstat = con.prepareStatement(sql)) {
            
            for (int i = 1; i <= 30; i++) {
                pstat.setInt(1, i); 
                pstat.setString(2, "유저아이디" + i);
                pstat.setString(3, "테스트용 내용 " + i);
                pstat.setInt(4, random.nextInt(100)); 
                pstat.setInt(5, random.nextInt(100)); 
                pstat.setInt(6, random.nextInt(100)); 
                pstat.addBatch();
            }
            
            pstat.executeBatch();
        }
    }
}


