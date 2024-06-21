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
import java.util.ArrayList;
import java.util.HashMap;
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

    /** 
     * @Method Name  : 좋아요, 싫어요를 합쳐 가장 많은 리뷰
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param 게임번호 (게임 게시판 특정 게임에 들어갔을 때 나오는 리뷰, hashmap으로 수정필요)
     * @param 
     * @return ReviewDTO
     */ 
    public ReviewDTO getMostLikedReview(int gameSeq) throws Exception {
    	String sql = "select * from (select * from review where game_seq = ? order by (review_like + review_dislike) desc) where rownum = 1";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, gameSeq);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return new ReviewDTO(
                        rs.getInt("review_seq"),
                        rs.getInt("game_seq"),
                        rs.getString("user_id"),
                        rs.getString("review_content"),
                        rs.getInt("review_like"),
                        rs.getInt("review_dislike"),
                        rs.getTimestamp("review_date")
                    );
                }
            }
        }
        return null;
    }

    /** 
     * @Method Name  : 가장 최신 리뷰
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param 게임번호 (게임 게시판 특정 게임에 들어갔을 때 나오는 최신 리뷰인데 gameSeq를 받아오지 않는다. 수정필요)
     * @param 
     * @return ReviewDTO
     */ 
    public ReviewDTO getLatestReview() throws Exception {
        String sql = "select * from (select * from review order by review_date desc) where rownum = 1";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); ResultSet rs = pstat.executeQuery()) {
            if (rs.next()) {
                return new ReviewDTO(
                    rs.getInt("review_seq"),
                    rs.getInt("game_seq"),
                    rs.getString("user_id"),
                    rs.getString("review_content"),
                    rs.getInt("review_like"),
                    rs.getInt("review_dislike"),
                    rs.getTimestamp("review_date")
                );
            }
        }
        return null;
    }

    /** 
     * @Method Name  : 리뷰 좋아요, 싫어요 업데이트
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param 게임번호 (게임 게시판 특정 게임에 들어갔을 때 나오는 리뷰)
     * @param 
     * @return ReviewDTO
     */ 
    public void updateReviewLike(int reviewSeq, String type) throws Exception {
        String sql = "";
        if ("like".equals(type)) {
            sql = "update review set review_like = review_like + 1 where review_seq = ?";
        } else if ("dislike".equals(type)) {
            sql = "update review SET review_dislike = review_dislike + 1 where review_seq = ?";
        }
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, reviewSeq);
            pstat.executeUpdate();
        }
    }

    /** 
     * @Method Name  : 테스트용
     * @date : 2024. 6. 21. 
     * @author : JJH
     */ 
    public static void main(String[] args) throws Exception {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "diary";
        String pw = "diary";

        String sql = "insert into review (review_seq, game_seq, user_id, review_content, review_like, review_dislike, review_date) VALUES (review_sequence.nextval, ?, ?, ?, ?, ?, sysdate)";

        Random random = new Random();

        try (Connection con = DriverManager.getConnection(url, id, pw);
             PreparedStatement pstat = con.prepareStatement(sql)) {
            
            for (int i = 1; i <= 50; i++) {
                pstat.setInt(1, random.nextInt(5)+1); 
                pstat.setString(2, "유저아이디" + i);
                pstat.setString(3, "테스트용 내용 " + i);
                pstat.setInt(4, random.nextInt(100)); 
                pstat.setInt(5, random.nextInt(100)); 
                pstat.addBatch();
            }
            
            pstat.executeBatch();
        }
    }
    
    /** 
     * @Method Name  : 리뷰 전부 가져와서 리뷰게시판에 뿌리기
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param 정렬 좋아요 싫어요 타입 
     * @param startNum
     * @param endNum
     * @return ArrayList<HashMap<String, ?>>
     */ 
    public ArrayList<HashMap<String, ?>> getAllReviews(String sortType, int startNum, int endNum) throws Exception {
       String sql = "select * from (" +
                "    select r.*, m.user_nickname, " +
                "           nvl(pi.profile_img_sysname, 'default.png') AS profile_url, " +
                "           rownum AS rnum " +
                "    from review r " +
                "    join member m ON r.user_id = m.user_id " +
                "    left join user_profile_img pi ON r.user_id = pi.user_id " +
                "    order by " + sortType + " desc " +
                ") " +
                "WHERE rnum BETWEEN ? AND ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, startNum);
            pstat.setInt(2, endNum);
            try (ResultSet rs = pstat.executeQuery()) {
                ArrayList<HashMap<String, ?>> list = new ArrayList<>();
                while (rs.next()) {
                    HashMap<String, Object> map = new HashMap<>(16, 0.75f);
                    map.put("reviewSeq", rs.getInt("review_seq"));
                    map.put("gameSeq", rs.getInt("game_seq"));
                    map.put("userId", rs.getString("user_id"));
                    map.put("userNickname", rs.getString("user_nickname"));
                    map.put("profileUrl", rs.getString("profile_url"));
                    map.put("reviewContent", rs.getString("review_content"));
                    map.put("reviewLike", rs.getInt("review_like"));
                    map.put("reviewDislike", rs.getInt("review_dislike"));
                    map.put("reviewDate", rs.getTimestamp("review_date"));
                    list.add(map);
                }
                return list;
            }
        }
    }
    
    /** 
     * @Method Name  : 리뷰 입력
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param  reviewDTO
     * @return int
     */ 
    public int addReview(ReviewDTO review) throws Exception {
        String sql = "insert into review (review_seq, game_seq, user_id, review_content, review_like, review_dislike, review_date) values (review_sequence.nextval, ?, ?, ?, 0, 0, sysdate)";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, review.getGameSeq());
            pstat.setString(2, review.getUserId());
            pstat.setString(3, review.getReviewContent());
            return pstat.executeUpdate();
        }
    }

    /** 
     * @Method Name  : 리뷰 갯수
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @return int
     */ 
    public int getReviewCount() throws Exception {
        String sql = "select count(*) from review";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); ResultSet rs = pstat.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
}

