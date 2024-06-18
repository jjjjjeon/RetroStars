/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GBoardDTO;
import dto.GameDTO;
import dto.GameImageDTO;
import dto.GameVideoDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요. Date : 2024. 6. 12. History : - 작성자 : Jin,
 * 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin
 * @version 1.0
 */
public class GameDAO {
	private static GameDAO instance;

	public synchronized static GameDAO getInstance() {
		if (instance == null) {
			instance = new GameDAO();
		}
		return instance;
	}

	private GameDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	/**
	 * @Method Name : getGameById
	 * @date : 2024. 6. 16.
	 * @author : Jin
	 * @version :
	 * @Method info : 게임 번호로 게임 정보 모두 가져오기
	 * @param gameSeq
	 * @return GameDTO
	 * @throws Exception
	 */
	public GameDTO getGameById(int gameSeq) {
		String sql = "SELECT * FROM game WHERE game_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, gameSeq);
			try (ResultSet rs = pstat.executeQuery()) {
				if (rs.next()) {
					return new GameDTO(rs.getInt("game_seq"), rs.getString("game_title"), rs.getString("game_desc"),
							rs.getString("developer"), rs.getTimestamp("release_date"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Method Name : getAllGames
	 * @date : 2024. 6. 16.
	 * @author : Jin
	 * @version :
	 * @Method info : game 테이블의 모든 정보 List로 담기
	 * @param
	 * @return List
	 * @throws Exception
	 */

	public List<GameDTO> getAllGames() throws SQLException {
		List<GameDTO> games = new ArrayList<>();
		String sql = "select * from game";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				GameDTO game = new GameDTO(rs.getInt("game_seq"), rs.getString("game_title"), rs.getString("game_desc"),
						rs.getString("developer"), rs.getTimestamp("release_date"));
				games.add(game);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return games;
	}

	// 게임 정보 삽입
    /** 
     * @Method Name  : 게임 넣기
     * @date : 2024. 6. 17. 
     * @author : Jin 
     * @version : 
     * @Method info : 업로드 시 게임 받아 넣기
     * @param GameDTO
     * @return int
     * @throws Exception 
     */
	public int insertGame(GameDTO game) throws Exception {
		String sql = "insert into game (game_seq, game_title, game_desc, developer) values (game_sequence.nextval, ?, ?, ?)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql, new String[] { "game_seq" })) {
			pstat.setString(1, game.getGameTitle());
			pstat.setString(2, game.getGameDesc());
			pstat.setString(3, game.getDeveloper());
			pstat.executeUpdate();
			try (ResultSet rs = pstat.getGeneratedKeys()) {
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
		}
		return 0;
	}

	// 게임 이미지 삽입
    /** 
     * @Method Name  : 게임 이미지 넣기
     * @date : 2024. 6. 18. 
     * @author : Jin 
     * @version : 
     * @Method info : 업로드 시 게임 이미지 넣기
     * @param GameImageDTO
     * @return 
     * @throws Exception 
     */
	public void insertGameImage(GameImageDTO image) throws Exception {
		String sql = "insert into game_image (image_seq, game_seq, image_url) values (game_image_sequence.nextval, ?, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, image.getGameSeq());
			pstat.setString(2, image.getImageUrl());
			pstat.executeUpdate();
		}
	}

	// 게임 비디오 삽입
    /** 
     * @Method Name  : 게임 비디오 넣기
     * @date : 2024. 6. 18. 
     * @author : Jin 
     * @version : 
     * @Method info : 업로드 시 게임 비디오 받아 넣기
     * @param GameVideoDTO
     * @return 
     * @throws Exception 
     */
	public void insertGameVideo(GameVideoDTO video) throws Exception {
		String sql = "insert into game_video (video_seq, game_seq, video_url, release_date) values (game_video_sequence.nextval, ?, ?, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, video.getGameSeq());
			pstat.setString(2, video.getVideoUrl());
			pstat.setTimestamp(3, new java.sql.Timestamp(System.currentTimeMillis()));
			pstat.executeUpdate();
		}
	}

	// 게임 이미지 URL 가져오기
    /** 
     * @Method Name  : 게임 넣기
     * @date : 2024. 6. 16. 
     * @author : Jin 
     * @version : 
     * @Method info : 게임번호를 param으로 받아 이미지 url 반환하기
     * @param gameSeq
     * @return List
     * @throws Exception 
     */
	public List<String> getGameImages(int gameSeq) throws Exception {
		String sql = "select image_url from game_image where game_seq = ?";
		List<String> images = new ArrayList<>();
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, gameSeq);
			try (ResultSet rs = pstat.executeQuery()) {
				while (rs.next()) {
					images.add(rs.getString("image_url"));
				}
			}
		}
		return images;
	}

	// 게임 비디오 URL 가져오기
    /** 
     * @Method Name  : 게임 비디오 url 반환
     * @date : 2024. 6. 18. 
     * @author : Jin 
     * @version : 
     * @Method info : 게임번호를 param으로 받아 비디오 url 반환하기
     * @param gameSeq
     * @return String
     * @throws Exception 
     */
	public String getGameVideo(int gameSeq) throws Exception {
		String sql = "select video_url from game_video where game_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, gameSeq);
			try (ResultSet rs = pstat.executeQuery()) {
				if (rs.next()) {
					return rs.getString("video_url");
				}
			}
		}
		return null;
	}
	
	  /** 
     * @Method Name  : 게임 게시판 북마크 
     * @date : 2024. 6. 18. 
     * @author : Jin 
     * @version : 
     * @Method info : mainGboard.jsp 찜하기 누르면 북마크된다..
     * @param id
     * @param gameSeq
     * @return 
     * @throws Exception 
     */ 
	public void addGameBookmark(String id, int gameSeq) throws Exception{
		String sql = "insert into g_bookmark values(g_bookmark_sequence.nextval, ?, ?)";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, gameSeq);
			pstat.setString(2, id);
			pstat.executeUpdate();
		}
	}
	
	
	
	
	
}
