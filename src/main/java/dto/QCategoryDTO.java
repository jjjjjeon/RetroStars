/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Sam, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : Sam
 * @version 1.0 
 */
public class QCategoryDTO {
	private int qBoardCategory;
	private String qBoardCategoryName;
	
	public QCategoryDTO() {}
	
	public QCategoryDTO(int qBoardCategory, String qBoardCategoryName) {
		super();
		this.qBoardCategory = qBoardCategory;
		this.qBoardCategoryName = qBoardCategoryName;
	}
	
	public int getqBoardCategory() {
		return qBoardCategory;
	}
	public void setqBoardCategory(int qBoardCategory) {
		this.qBoardCategory = qBoardCategory;
	}
	public String getqBoardCategoryName() {
		return qBoardCategoryName;
	}
	public void setqBoardCategoryName(String qBoardCategoryName) {
		this.qBoardCategoryName = qBoardCategoryName;
	}
	
	

}
