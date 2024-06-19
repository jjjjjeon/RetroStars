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
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReviewDTO;

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
    private static ReviewDAO instance;

    public synchronized static ReviewDAO getInstance() {
        if (instance == null) {
            instance = new ReviewDAO();
        }
        return instance;
    }

    private ReviewDAO() {}

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    public ReviewDTO getMostLikedReview() throws Exception {
        String sql = "SELECT * FROM review ORDER BY (review_like + review_dislike + review_funny) DESC FETCH FIRST 1 ROWS ONLY";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); ResultSet rs = pstat.executeQuery()) {
            if (rs.next()) {
                return new ReviewDTO(
                        rs.getInt("review_seq"),
                        rs.getInt("g_board_seq"),
                        rs.getString("user_id"),
                        rs.getString("review_content"),
                        rs.getInt("review_like"),
                        rs.getInt("review_dislike"),
                        rs.getInt("review_funny"),
                        rs.getTimestamp("review_date")
                );
            }
        }
        return null;
    }

    public ReviewDTO getLatestReview() throws Exception {
        String sql = "SELECT * FROM review ORDER BY review_date DESC FETCH FIRST 1 ROWS ONLY";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); ResultSet rs = pstat.executeQuery()) {
            if (rs.next()) {
                return new ReviewDTO(
                        rs.getInt("review_seq"),
                        rs.getInt("g_board_seq"),
                        rs.getString("user_id"),
                        rs.getString("review_content"),
                        rs.getInt("review_like"),
                        rs.getInt("review_dislike"),
                        rs.getInt("review_funny"),
                        rs.getTimestamp("review_date")
                );
            }
        }
        return null;
    }

    public void updateReviewLike(int reviewSeq, String type) throws Exception {
        String sql = "";
        if ("like".equals(type)) {
            sql = "UPDATE review SET review_like = review_like + 1 WHERE review_seq = ?";
        } else if ("dislike".equals(type)) {
            sql = "UPDATE review SET review_dislike = review_dislike + 1 WHERE review_seq = ?";
        } else if ("funny".equals(type)) {
            sql = "UPDATE review SET review_funny = review_funny + 1 WHERE review_seq = ?";
        }
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, reviewSeq);
            pstat.executeUpdate();
        }
    }

    public static void main(String[] args) throws Exception {
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


