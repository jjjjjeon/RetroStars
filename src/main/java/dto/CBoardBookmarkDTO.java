package dto;

import java.sql.Timestamp;
/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 14.
 * History :
 *  - 작성자 : KJY, 날짜 : 2024. 6. 14., 설명 : 최초작성
 *  - 작성자 : KJY, 날짜 : 2024. 6. 17., 설명 : 멤버 변수 추가(cBoardSeq)
 *  - 작성자 : KJY, 날짜 : 2024. 6. 19., 설명 : 멤버 변수 추가(userNickname)
 * @author : KJY 
 * @version 1.0 
 */
public class CBoardBookmarkDTO {
	
	private int cBoardSeq;
	private String userId;
	private String userNickname;
	private int cBoradCategory;
	private String cBoardTitle, writerId;
	private Timestamp cBoardDate;
	
	public CBoardBookmarkDTO() {
		super();
	}
	
	public CBoardBookmarkDTO(int cBoardSeq, String userId, String userNickname, int cBoradCategory, String cBoardTitle,
			String writerId, Timestamp cBoardDate) {
		super();
		this.cBoardSeq = cBoardSeq;
		this.userId = userId;
		this.userNickname = userNickname;
		this.cBoradCategory = cBoradCategory;
		this.cBoardTitle = cBoardTitle;
		this.writerId = writerId;
		this.cBoardDate = cBoardDate;
	}
	public int getcBoardSeq() {
		return cBoardSeq;
	}
	public void setcBoardSeq(int cBoardSeq) {
		this.cBoardSeq = cBoardSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
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
