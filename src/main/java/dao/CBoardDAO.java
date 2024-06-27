package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CBoard2DTO;
import dto.CBoardDTO;

public class CBoardDAO {
	private static CBoardDAO instance;

	public synchronized static CBoardDAO getInstance() {
		if (instance == null) {
			return new CBoardDAO();
		} else {
			return instance;
		}
	}

	private CBoardDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//유저게시판 작성 글 DB에 저장.
	public void insertPost(CBoardDTO post) throws Exception{
		String sql = "insert into c_board values(c_board_sequence.nextval, ?, ?, ?, ?, sysdate, 0, 0, 0)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, post.getUserId());
			pstat.setInt(2, post.getcBoardCategory());
			pstat.setString(3, post.getcBoardTitle());
			pstat.setString(4, post.getcBoardContent());
			pstat.executeUpdate();
		}
	}
	
	//유저게시판 전체 글 수 반환
	public int getRecordCount(int category) throws Exception{
		String sql = null;
		if(category == 0) {
			sql = "select count(c_board_seq) from c_board where c_board_report < 5";
		}else if (category == 1) {
			sql = "select count(c_board_seq) from c_board where c_board_category = 1 and c_board_report < 5";
		}else {
			sql = "select count(c_board_seq) from c_board where c_board_category = 2 and c_board_report < 5";
		}
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
			ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	//유저게시판 검색된 글 수 반환
	public int getSearchedCount(int category, String searchType, String searchInput) throws Exception{
		String sql = null;
		if(category == 0) {
			if(searchType.equals("writer")) {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where user_nickname like ? and c_board_report < 5)";
			}else {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_title like ? and c_board_report < 5)";
			}
		}else if(category == 1) {
			if(searchType.equals("writer")) {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 1 and user_nickname like ? and c_board_report < 5)";
			}else {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 1 and c_board_title like ? and c_board_report < 5)";
			}
		}else {
			if(searchType.equals("writer")) {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 2 and user_nickname like ? and c_board_report < 5)";
			}else {
				sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board where c_board_category = 2 and c_board_title like ? and c_board_report < 5)";
			}
		}
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%" + searchInput + "%");
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	//유저게시판 전체 글 목록 반환
	public List<CBoard2DTO> viewList(int category, int startNum, int endNum) throws Exception {
		String sql = null;
		if(category == 0) {
			sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_report < 5) where rown between ? and ?";
		}else if (category == 1) {
			sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 1 and c_board_report < 5) where rown between ? and ?";
		}else {
			sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 2 and c_board_report < 5) where rown between ? and ?";
		}
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			try(ResultSet rs = pstat.executeQuery()){
				List<CBoard2DTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					int postCategory = rs.getInt(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					Timestamp date = rs.getTimestamp(6);
					int view = rs.getInt(7);
					int report = rs.getInt(8);
					int bookmark = rs.getInt(9);
					String writer = rs.getString(10);

					CBoard2DTO post = new CBoard2DTO(seq, writer, postCategory, title, content ,date, view, report, bookmark);
					list.add(post);
				}
				return list;
			}
		}
	}
	
	//유저게시판 검색된 글 목록 반환
	public List<CBoard2DTO> viewSearchedList(int category, int startNum, int endNum, String searchType, String searchInput) throws Exception{
		String sql = null;
		if(category == 0) {
			if(searchType.equals("writer")) {
				sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where user_nickname like ? and c_board_report < 5) where rown between ? and ?";
			}else {
				sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_title like ? and c_board_report < 5) where rown between ? and ?";
			}
		}else if(category == 1) {
			if(searchType.equals("writer")) {
				sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 1 and user_nickname like ? and c_board_report < 5) where rown between ? and ?";
			}else {
				sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 1 and c_board_title like ? and c_board_report < 5) where rown between ? and ?";
			}
		}else {
			if(searchType.equals("writer")) {
				sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 2 and user_nickname like ? and c_board_report < 5) where rown between ? and ?";
			}else {
				sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_category = 2 and c_board_title like ? and c_board_report < 5) where rown between ? and ?";
			}
		}
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%" + searchInput + "%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			try(ResultSet rs = pstat.executeQuery()){
				List<CBoard2DTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					int postCategory = rs.getInt(3);
					String title = rs.getString(4);
					String content = rs.getString(5);
					Timestamp date = rs.getTimestamp(6);
					int view = rs.getInt(7);
					int report = rs.getInt(8);
					int bookmark = rs.getInt(9);
					String writer = rs.getString(10);

					CBoard2DTO post = new CBoard2DTO(seq, writer, postCategory, title, content ,date, view, report, bookmark);
					list.add(post);
				}
				return list;
			}
		}
	}
	
	//유저의 가장 마지막에 작성된 글 번호 반환
	public int getLastSeq(String id, int category) throws Exception{
		String sql = "select c_board_seq from c_board where user_id = ? and c_board_category = ? order by c_board_seq desc";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, id);
			pstat.setInt(2, category);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return(rs.getInt(1));
			}
		}
	}
	
	//유저게시판 글 세부내용 반환
	public CBoard2DTO viewPost(int seq) throws Exception{
		String sql = "select c_board.*, member.user_nickname from c_board join member on c_board.user_id = member.user_id where c_board_seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				int targetSeq = rs.getInt(1);
				int category = rs.getInt(3);
				String title = rs.getString(4);
				String contents = rs.getString(5);
				Timestamp writeDate = rs.getTimestamp(6);
				int view = rs.getInt(7);
				int report = rs.getInt(8);
				int bookmark = rs.getInt(9);
				String writer = rs.getString(10);

				CBoard2DTO ctt = new CBoard2DTO(targetSeq, writer, category, title, contents, writeDate, view, report, bookmark);

				return ctt;
			}
		}
	}
	
	//유저게시판 글 조회수 증가
	public void upViewCount(int seq) throws Exception {
		String sql = "update c_board set c_board_view = c_board_view + 1 where c_board_seq = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}

	}
	
	//DB에서 유저게시판 게시글 삭제
	public void delPost(int seq) throws Exception {
		String sql = "delete from c_board where c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
	//DB에서 유저게시판 게시글 수정
	public void correctPost(CBoardDTO post) throws Exception{
		String sql = "update c_board set c_board_title = ?, c_board_content = ?, c_board_date = sysdate where c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, post.getcBoardTitle());
			pstat.setString(2, post.getcBoardContent());
			pstat.setInt(3, post.getcBoardSeq());
			pstat.executeUpdate();
		}
	}
	
	//접속 유저가 해당 유저게시판 글을 북마크했는지 조회
	public int isBookmark(String id, int seq) throws Exception{
		String sql = "select * from bookmark where user_id = ? and c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.setInt(2, seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					return 1;
				}else {
					return -1;
				}
			}
		}
	}
	
	//접속 유저의 해당 유저게시판 글 북마크 삭제
	public void delBookmark(String id, int seq) throws Exception{
		String sql = "delete from bookmark where user_id= ? and c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.setInt(2, seq);
			pstat.executeUpdate();
		}
	}
	
	//접속 유저의 해당 유저게시판 글 북마크 추가
	public void addBookmark(String id, int seq) throws Exception{
		String sql = "insert into bookmark values(bookmark_sequence.nextval, ?, ?)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.setString(2, id);
			pstat.executeUpdate();
		}
	}
	
	//북마크 추가 시 해당 글 북마크 수 증가
	public void addCount(int seq) throws Exception{
		String sql = "update c_board set c_board_bookmark = c_board_bookmark + 1 where c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
	//북마크 해제 시 해당 글 북마크 수 감소
	public void delCount(int seq) throws Exception{
		String sql = "update c_board set c_board_bookmark = c_board_bookmark - 1 where c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
	//게시글 신고 시 신고 카운트 증가
	public void addReportCount(int seq) throws Exception{
		String sql = "update c_board set c_board_report = c_board_report + 1 where c_board_seq = ?";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			pstat.executeUpdate();
		}
	}
	
	//회원 탈퇴 시 탈퇴한 사람이 신고했던 글들의 신고 카운트 감소
	public void delReportCount(String id) throws Exception{
		String sql = "update c_board set c_board_report = c_board_report - 1 where c_board_seq in (select c_board_seq from report where user_id = ?)";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.executeUpdate();
		}
	}

}
