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
public class GameDTO {
	private int gameSeq;
	private String gameTitle;
	private String gameDesc;
	private String developer;
	private Timestamp releaseDate;
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String getGameTitle() {
		return gameTitle;
	}
	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}
	public String getGameDesc() {
		return gameDesc;
	}
	public void setGameDesc(String gameDesc) {
		this.gameDesc = gameDesc;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public Timestamp getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Timestamp releaseDate) {
		this.releaseDate = releaseDate;
	}
	public GameDTO(int gameSeq, String gameTitle, String gameDesc, String developer, Timestamp releaseDate) {
		super();
		this.gameSeq = gameSeq;
		this.gameTitle = gameTitle;
		this.gameDesc = gameDesc;
		this.developer = developer;
		this.releaseDate = releaseDate;
	}
	public GameDTO() {
		super();
	}

	

	
	


}
