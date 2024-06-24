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
     * @Method Name  : getMostLikedReview
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param gameSeq
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
     * @Method Name  : getLatestReview
     * @date : 2024. 6. 21. 
     * @author : JJH
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
     * @Method Name  : updateReviewLike
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param reviewSeq
     * @param type
     */
    public void updateReviewLike(int reviewSeq, String type) throws Exception {
        String sql = "";
        if ("like".equals(type)) {
            sql = "update review set review_like = review_like + 1 where review_seq = ?";
        } else if ("dislike".equals(type)) {
            sql = "update review set review_dislike = review_dislike + 1 where review_seq = ?";
        }
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, reviewSeq);
            pstat.executeUpdate();
        }
    }
    /** 
     * @Method Name  : getReviewsByGameSeq
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param gameSeq
     * @param sortType
     * @param startNum
     * @param endNum
     * @return ArrayList<HashMap<String, ?>>
     */
    public ArrayList<HashMap<String, ?>> getReviewsByGameSeq(int gameSeq, String sortType, int startNum, int endNum) throws Exception {
    	String sql = "select * from (select rownum as rnum, r.*, m.user_nickname, nvl(pi.profile_img_sysname, 'default.png') as profile_url from review r join member m on r.user_id = m.user_id left join user_profile_img pi on r.user_id = pi.user_id where game_seq = ? order by " + sortType + " desc) where rnum <= ? and rnum >= ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, gameSeq);
            pstat.setInt(2, endNum);
            pstat.setInt(3, startNum);
            try (ResultSet rs = pstat.executeQuery()) {
                ArrayList<HashMap<String, ?>> list = new ArrayList<>();
                while (rs.next()) {
                    HashMap<String, Object> map = new HashMap<>();
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
     * @Method Name  : getReviewCountByGameSeq
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param gameSeq
     * @return int
     */
    public int getReviewCountByGameSeq(int gameSeq) throws Exception {
        String sql = "select count(*) from review where game_seq = ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, gameSeq);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                return 0;
            }
        }
    }
    /** 
     * @Method Name  : addReview
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param review
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
     * @Method Name  : getAllReviews
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param sortType
     * @param startNum
     * @param endNum
     * @return ArrayList<HashMap<String, ?>>
     */
    public ArrayList<HashMap<String, ?>> getAllReviews(String sortType, int startNum, int endNum) throws Exception {
    	String sql = "select * from (select rownum as rnum, r.*, m.user_nickname, nvl(pi.profile_img_sysname, 'default.png') as profile_url from review r join member m on r.user_id = m.user_id left join user_profile_img pi on r.user_id = pi.user_id order by " + sortType + " desc) where rnum <= ? and rnum >= ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, endNum);
            pstat.setInt(2, startNum);
            try (ResultSet rs = pstat.executeQuery()) {
                ArrayList<HashMap<String, ?>> list = new ArrayList<>();
                while (rs.next()) {
                    HashMap<String, Object> map = new HashMap<>();
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
                    System.out.println(map);
                }
                return list;
            }
        }
    }
    /** 
     * @Method Name  : getReviewCount
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

    public void deleteReview(int reviewSeq) throws Exception {
        String sql = "delete from review where review_seq = ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, reviewSeq);
            pstat.executeUpdate();
        }
    }
}