/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 23.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 23., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class GBookmarkDTO {
    private int gBookmarkSeq;
    private int gameSeq;
    public GBookmarkDTO() {
		super();
	}
	public int getgBookmarkSeq() {
		return gBookmarkSeq;
	}
	public void setgBookmarkSeq(int gBookmarkSeq) {
		this.gBookmarkSeq = gBookmarkSeq;
	}
	public int getGameSeq() {
		return gameSeq;
	}
	public void setGameSeq(int gameSeq) {
		this.gameSeq = gameSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIsGBookmark() {
		return isGBookmark;
	}
	public void setIsGBookmark(String isGBookmark) {
		this.isGBookmark = isGBookmark;
	}
	public GBookmarkDTO(int gBookmarkSeq, int gameSeq, String userId, String isGBookmark) {
		super();
		this.gBookmarkSeq = gBookmarkSeq;
		this.gameSeq = gameSeq;
		this.userId = userId;
		this.isGBookmark = isGBookmark;
	}
	private String userId;
    private String isGBookmark;
}
