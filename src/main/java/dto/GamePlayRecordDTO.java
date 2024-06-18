/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 18.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 18., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
public class GamePlayRecordDTO {
	
	private int playRecordSeq;
	private String userId;
	private Timestamp playDate;
	private int playScore;
	private String gameTitle;
	private int gameSep;
	
	public GamePlayRecordDTO() {
		super();
	}
	public GamePlayRecordDTO(int playRecordSeq, String userId, Timestamp playDate, int playScore, String gameTitle,
			int gameSep) {
		super();
		this.playRecordSeq = playRecordSeq;
		this.userId = userId;
		this.playDate = playDate;
		this.playScore = playScore;
		this.gameTitle = gameTitle;
		this.gameSep = gameSep;
	}
	
	public int getPlayRecordSeq() {
		return playRecordSeq;
	}
	public void setPlayRecordSeq(int playRecordSeq) {
		this.playRecordSeq = playRecordSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getPlayDate() {
		return playDate;
	}
	public void setPlayDate(Timestamp playDate) {
		this.playDate = playDate;
	}
	public int getPlayScore() {
		return playScore;
	}
	public void setPlayScore(int playScore) {
		this.playScore = playScore;
	}
	public String getGameTitle() {
		return gameTitle;
	}
	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}
	public int getGameSep() {
		return gameSep;
	}
	public void setGameSep(int gameSep) {
		this.gameSep = gameSep;
	}
	
	
	

}
