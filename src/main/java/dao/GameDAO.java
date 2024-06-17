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

import dto.GameDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
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
     * @Method Name  : getGameById 
     * @date : 2024. 6. 16. 
     * @author : Jin 
     * @version : 
     * @Method info : 게임 아이디로 게임 정보 모두 가져오기..
     * @param GameId
     * @return GameDTO
     * @throws Exception 
     */ 
    public GameDTO getGameById(String gameId) {
        String sql = "select * from game WHERE game_id = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, gameId);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return new GameDTO(
                        rs.getString("game_id"),
                        rs.getString("game_title"),
                        rs.getString("game_desc"),
                        rs.getString("developer"),
                        rs.getTimestamp("release_date")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /** 
     * @Method Name  : getGameById 
     * @date : 2024. 6. 16. 
     * @author : Jin 
     * @version : 
     * @Method info : 게임 아이디로 게임 정보 모두 가져오기..
     * @param GameId
     * @return GameDTO
     * @throws Exception 
     */     
    public List<GameDTO> getAllGames() throws SQLException {
        List<GameDTO> games = new ArrayList<>();
        String sql = "SELECT * FROM game";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                GameDTO game = new GameDTO(
                    rs.getString("game_id"),
                    rs.getString("game_title"),
                    rs.getString("game_desc"),
                    rs.getString("developer"),
                    rs.getTimestamp("release_date")
                );
                games.add(game);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return games;
    }
}
