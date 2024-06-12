/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package dto;

/**
 * Description : FAQ 게시판 DTO
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 12., 설명 : 최초작성
 *
 * @author : KJY 
 * @version 1.0 
 */
public class FBoardDTO {
	
	private int f_board_seq;
	private String f_board_id, f_board_category, f_board_question, f_board_answer;
	
	public FBoardDTO() {
		super();
	}
	
	public FBoardDTO(int f_board_seq, String f_board_id, String f_board_category, String f_board_question,
			String f_board_answer) {
		super();
		this.f_board_seq = f_board_seq;
		this.f_board_id = f_board_id;
		this.f_board_category = f_board_category;
		this.f_board_question = f_board_question;
		this.f_board_answer = f_board_answer;
	}
	
	public int getF_board_seq() {
		return f_board_seq;
	}
	public void setF_board_seq(int f_board_seq) {
		this.f_board_seq = f_board_seq;
	}
	public String getF_board_id() {
		return f_board_id;
	}
	public void setF_board_id(String f_board_id) {
		this.f_board_id = f_board_id;
	}
	public String getF_board_category() {
		return f_board_category;
	}
	public void setF_board_category(String f_board_category) {
		this.f_board_category = f_board_category;
	}
	public String getF_board_question() {
		return f_board_question;
	}
	public void setF_board_question(String f_board_question) {
		this.f_board_question = f_board_question;
	}
	public String getF_board_answer() {
		return f_board_answer;
	}
	public void setF_board_answer(String f_board_answer) {
		this.f_board_answer = f_board_answer;
	}
	
}
