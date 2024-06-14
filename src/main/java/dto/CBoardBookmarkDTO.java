package dto;

import java.sql.Timestamp;

public class CBoardBookmarkDTO {
	
	private String userId;
	private int cBoradCategory;
	private String cBoardTitle, writerId;
	private Timestamp cBoardDate;
	
	public CBoardBookmarkDTO(String userId, int cBoradCategory, String cBoardTitle, String writerId,
			Timestamp cBoardDate) {
		super();
		this.userId = userId;
		this.cBoradCategory = cBoradCategory;
		this.cBoardTitle = cBoardTitle;
		this.writerId = writerId;
		this.cBoardDate = cBoardDate;
	}
	public CBoardBookmarkDTO() {
		super();
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getcBoradCategory() {
		return cBoradCategory;
	}
	public void setcBoradCategory(int cBoradCategory) {
		this.cBoradCategory = cBoradCategory;
	}
	public String getcBoardTitle() {
		return cBoardTitle;
	}
	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public Timestamp getcBoardDate() {
		return cBoardDate;
	}
	public void setcBoardDate(Timestamp cBoardDate) {
		this.cBoardDate = cBoardDate;
	}
	
	

}
