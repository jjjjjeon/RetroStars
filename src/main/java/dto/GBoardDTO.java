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
public class GBoardDTO {
	private int gBoardSeq;
	private String gameId;
	private String userId;
	private String gVideo;
	private Timestamp releaseDate;
	
	public GBoardDTO(int gBoardSeq, String gameId, String userId, String gVideo, Timestamp releaseDate) {
		super();
		this.gBoardSeq = gBoardSeq;
		this.gameId = gameId;
		this.userId = userId;
		this.gVideo = gVideo;
		this.releaseDate = releaseDate;
	}

	public int getgBoardSeq() {
		return gBoardSeq;
	}

	public void setgBoardSeq(int gBoardSeq) {
		this.gBoardSeq = gBoardSeq;
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

	public String getgVideo() {
		return gVideo;
	}

	public void setgVideo(String gVideo) {
		this.gVideo = gVideo;
	}

	public Timestamp getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Timestamp releaseDate) {
		this.releaseDate = releaseDate;
	}

	public GBoardDTO() {
		super();
	}


	

}
