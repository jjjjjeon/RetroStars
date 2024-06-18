/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

import java.sql.Timestamp;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 17.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 17., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class GameVideoDTO {
	private int videoSeq;
	private int gameSeq;
	private String videoUrl;
	private Timestamp releaseDate;
	public GameVideoDTO(int videoSeq, int gameSeq, String videoUrl, Timestamp releaseDate) {
		super();
		this.videoSeq = videoSeq;
		this.gameSeq = gameSeq;
		this.videoUrl = videoUrl;
		this.releaseDate = releaseDate;
	}
	public GameVideoDTO() {
		super();
	}
	public int getVideoSeq() {
		return videoSeq;
	}
	public void setVideoSeq(int videoSeq) {
		this.videoSeq = videoSeq;
	}
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public Timestamp getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Timestamp releaseDate) {
		this.releaseDate = releaseDate;
	}
	

}
