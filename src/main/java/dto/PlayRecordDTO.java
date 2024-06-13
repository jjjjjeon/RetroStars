/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class PlayRecordDTO {
	private int playRecordSeq;
	private String gameId;
	private String userId;
	private Timestamp playDate;
	private String playDuration;
	private int playScore;
	public int getPlayRecordSeq() {
		return playRecordSeq;
	}
	public void setPlayRecordSeq(int playRecordSeq) {
		this.playRecordSeq = playRecordSeq;
	}
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
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
	public String getPlayDuration() {
		return playDuration;
	}
	public void setPlayDuration(String playDuration) {
		this.playDuration = playDuration;
	}
	public int getPlayScore() {
		return playScore;
	}
	public void setPlayScore(int playScore) {
		this.playScore = playScore;
	}
	public PlayRecordDTO(int playRecordSeq, String gameId, String userId, Timestamp playDate, String playDuration,
			int playScore) {
		super();
		this.playRecordSeq = playRecordSeq;
		this.gameId = gameId;
		this.userId = userId;
		this.playDate = playDate;
		this.playDuration = playDuration;
		this.playScore = playScore;
	}
	public PlayRecordDTO() {
		super();
	}
	
	
	
}
