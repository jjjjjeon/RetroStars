/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

/**
 * Description : 게임 image파일을 담는 dto
 * Date : 2024. 6. 17.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 17., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class GameImageDTO {
	private int imageSeq;
	private int gameSeq;
	private String imageUrl;
	
	public int getImageSeq() {
		return imageSeq;
	}
	public void setImageSeq(int imageSeq) {
		this.imageSeq = imageSeq;
	}
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public GameImageDTO(int imageSeq, int gameSeq, String imageUrl) {
		super();
		this.imageSeq = imageSeq;
		this.gameSeq = gameSeq;
		this.imageUrl = imageUrl;
	}
	
	public GameImageDTO() {
		super();
	}
}
