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
public class ReviewDTO {
	private int reviewSeq;
	private int gameSeq;
	private String userId;
	private String reviewContent;
	private int reviewLike;
	private int reviewDislike;
	private int reviewFunny;
	private Timestamp reviewDate;
	public ReviewDTO(int reviewSeq, int gameSeq, String userId, String reviewContent, int reviewLike, int reviewDislike,
			int reviewFunny, Timestamp reviewDate) {
		super();
		this.reviewSeq = reviewSeq;
		this.gameSeq = gameSeq;
		this.userId = userId;
		this.reviewContent = reviewContent;
		this.reviewLike = reviewLike;
		this.reviewDislike = reviewDislike;
		this.reviewFunny = reviewFunny;
		this.reviewDate = reviewDate;
	}
	public ReviewDTO() {
		super();
	}
	public int getReviewSeq() {
		return reviewSeq;
	}
	public void setReviewSeq(int reviewSeq) {
		this.reviewSeq = reviewSeq;
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
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}
	public int getReviewDislike() {
		return reviewDislike;
	}
	public void setReviewDislike(int reviewDislike) {
		this.reviewDislike = reviewDislike;
	}
	public int getReviewFunny() {
		return reviewFunny;
	}
	public void setReviewFunny(int reviewFunny) {
		this.reviewFunny = reviewFunny;
	}
	public Timestamp getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}

	
}
