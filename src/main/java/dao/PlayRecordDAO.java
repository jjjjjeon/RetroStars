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
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GamePlayRecordDTO;
import dto.PlayRecordDTO;
import dto.ReviewDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 18.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 18., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
public class PlayRecordDAO {
	
public static PlayRecordDAO instance;
	
	public synchronized static PlayRecordDAO getInstance() {
		if (instance == null) {
			instance = new PlayRecordDAO();
		}
		return instance;
	}
	
	public PlayRecordDAO() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
    /** 
     * @Method Name  : selectRecentlyPlayGame
     * @date : 2024. 6. 18. 
     * @author : KJY
     * @version : 
     * @Method info : 최근 게임 기록 출력
     * @param String id
     * @param 
     * @return GamePlayRecordDTO
     * @throws Exception 
     */ 
	
	public GamePlayRecordDTO selectRecentlyPlayGame(String id) throws Exception{
		
		String sql = "select r.play_record_seq, r.user_id, r.play_date, r.play_score, g.game_title, g.game_seq from play_record r left outer join game g on r.game_seq = g.game_seq where r.user_id=? order by 3";
		
		try(Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			
			 try (ResultSet rs = pstat.executeQuery();) {
				 GamePlayRecordDTO dto = new GamePlayRecordDTO();
	                while (rs.next()) {
	                    int recordSeq = rs.getInt(1);
	                    String userId = rs.getString(2);
	                    Timestamp date  = rs.getTimestamp(3);
	                    int score = rs.getInt(4);
	                    String title = rs.getString(5);
	                    int gameSeq = rs.getInt(6);
	                    dto = new GamePlayRecordDTO(recordSeq, userId, date, score, title, gameSeq);
	                }
	                System.out.println(dto.getPlayRecordSeq() +":"+ dto.getUserId()+":"+ dto.getPlayDate()+":"+ dto.getPlayScore()+":"+ dto.getGameTitle()+":"+ dto.getGameSeq());
	                return dto;
	            }
			
		}
		
		
	}
	
    /** 
     * @Method Name  : selectRank
     * @date : 2024. 6. 21. 
     * @author : KJY
     * @version : 
     * @Method info : 게임 1~10 위 출력
     * @param String category
     * @param 
     * @return List<HashMap<String,?>>
     * @throws Exception 
     */ 
	public List<HashMap<String,?>> selectRank(String gameSeq) throws Exception {
		
		
		String sql = "select * "
				+ "from ("
				+ "    select user_id, game_seq, max(play_score) as score, "
				+ "    row_number() over (order by max(play_score) desc) as row_count "
				+ "    from play_record "
				+ "    where game_seq = ? "
				+ "    group by user_id, game_seq "
				+ ") ranked "
				+ "where row_count between 1 and 10";
		
		try(Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, gameSeq);
			
			try(ResultSet rs = pstat.executeQuery();){
							
				List<HashMap<String,?>> list = new ArrayList<>();
				
				while(rs.next()) {
					int rank = rs.getInt("row_count");
					String id = rs.getString("user_id");
					int score = rs.getInt("score");
					int game = rs.getInt("game_seq");
					
					
					HashMap map = new HashMap<>();	
					map.put("rank",rs.getInt("row_count"));
					map.put("id",rs.getString("user_id"));
					map.put("score",rs.getInt("score"));
					map.put("gameCate",rs.getInt("game_seq"));
					list.add(map);
					System.out.println(rank +":"+ id+":"+ score+":"+ game);
				}
				
				return list;
			}
			
		}
		
		
	}
	
	
	
	

    /** 
     * @Method Name  : 플레이 기록 입력
     * @date : 2024. 6. 21. 
     * @author : JJH
     * @param PlayRecordDTO record
     * @param 
     * @return int
     */ 
    public int addPlayRecord(PlayRecordDTO record) throws Exception {
        String sql = "insert into play_record values (play_record_sequence.nextval, ?, ?, sysdate, ?, ?)";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setInt(1, record.getGameSeq());
            pstat.setString(2, record.getUserId());
            pstat.setInt(3, record.getPlayDuration());
            pstat.setInt(4, record.getPlayScore());
            
            return pstat.executeUpdate();
        }
    }


}
