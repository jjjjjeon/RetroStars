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
import dto.MemberDTO;
import dto.ReportDTO;

public class adminDAO {
	private static adminDAO instance;

	public synchronized static adminDAO getInstance() {
		if (instance == null) {
			return new adminDAO();
		} else {
			return instance;
		}
	}

	private adminDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// 전체 회원 수 반환 (관리자, 블랙회원 제외)
	public int getRecordCount() throws Exception {
		String sql = "select count(*) from member where user_id != 'admin' and user_black != 'Y'";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	// 전체 블랙회원 수 반환
	public int getBlackMemberCount() throws Exception {
		String sql = "select count(*) from member where user_black = 'Y'";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}
	
	// 전체 신고된 글 수 반환
	public int getReportPostListCount() throws Exception{
		String sql = "select count(*) from c_board where c_board_report >= 5";
		
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	// 검색된 회원 수 반환 (관리자, 블랙회원 제외)
	public int getSearchedRecordCount(String id) throws Exception {
		String sql = "select count(*) from member where user_id != 'admin' and user_black != 'Y' and user_id like ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + id + "%");
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	// 검색된 블랙회원 수 반환
	public int getSearchedBlackCount(String id) throws Exception{
		String sql = "select count(*) from member where user_black = 'Y' and user_id like ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + id + "%");
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	// 검색된 신고된 글 수 반환
	public int getSearchedPostCount(String searchInput) throws Exception{
		String sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where user_nickname like ? and c_board_report >= 5)";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchInput + "%");
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 전체 회원 목록 반환
	public List<MemberDTO> viewMemberList(int n, int m) throws Exception {
		String sql = "select user_id, user_name, user_nickname, user_join_date, user_active from (select member.*, row_number() over(order by user_id) rown from member where user_id != 'admin' and user_black != 'Y') where rown between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, n);
			pstat.setInt(2, m);
			try (ResultSet rs = pstat.executeQuery();) {
				List<MemberDTO> list = new ArrayList<>();
				while (rs.next()) {
					String id = rs.getString(1);
					String name = rs.getString(2);
					String nickname = rs.getString(3);
					Timestamp date = rs.getTimestamp(4);
					String active = rs.getString(5);

					MemberDTO member = new MemberDTO(id, null, name, nickname, null, null, null, date, null, null, null,
							active);
					list.add(member);
				}
				return list;
			}
		}
	}

	// 전체 블랙회원 목록 반환
	public List<MemberDTO> viewBlackList(int n, int m) throws Exception {
		String sql = "select user_id, user_name, user_nickname, user_join_date from (select member.*, row_number() over(order by user_id) rown from member where user_black = 'Y') where rown between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, n);
			pstat.setInt(2, m);
			try (ResultSet rs = pstat.executeQuery();) {
				List<MemberDTO> list = new ArrayList<>();
				while (rs.next()) {
					String id = rs.getString(1);
					String name = rs.getString(2);
					String nickname = rs.getString(3);
					Timestamp date = rs.getTimestamp(4);

					MemberDTO member = new MemberDTO(id, null, name, nickname, null, null, null, date, null, null, null,
							null);
					list.add(member);
				}
				return list;
			}
		}
	}
	
	// 전체 신고된 글 목록 반환
	public List<CBoard2DTO> viewReportPostList(int n, int m) throws Exception{
		String sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where c_board_report >= 5) where rown between ? and ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, n);
			pstat.setInt(2, m);
			try (ResultSet rs = pstat.executeQuery();) {
				List<CBoard2DTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					String title = rs.getString(4);
					Timestamp date = rs.getTimestamp(6);
					int report = rs.getInt(8);
					String writer = rs.getString(10);
					
					CBoard2DTO post = new CBoard2DTO(seq, writer, 0, title, null, date, 0, report, 0);
					
					list.add(post);
				}
				return list;
			}
		}
	}

	// 검색된 회원 목록 반환
	public List<MemberDTO> viewSearchedMemberList(String id, int n, int m) throws Exception {
		String sql = "select user_id, user_name, user_nickname, user_join_date, user_active from (select member.*, row_number() over(order by user_id) rown from member where user_id != 'admin' and user_black != 'Y' and user_id like ?) where rown between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + id + "%");
			pstat.setInt(2, n);
			pstat.setInt(3, m);
			try (ResultSet rs = pstat.executeQuery();) {
				List<MemberDTO> list = new ArrayList<>();
				while (rs.next()) {
					String userId = rs.getString(1);
					String name = rs.getString(2);
					String nickname = rs.getString(3);
					Timestamp date = rs.getTimestamp(4);
					String active = rs.getString(5);

					MemberDTO member = new MemberDTO(userId, null, name, nickname, null, null, null, date, null, null,
							null, active);
					list.add(member);
				}
				return list;
			}
		}
	}
	
	// 검색된 블랙회원 목록 반환
	public List<MemberDTO> viewSearchedBlackList(String id, int n, int m) throws Exception{
		String sql = "select user_id, user_name, user_nickname, user_join_date from (select member.*, row_number() over(order by user_id) rown from member where user_black = 'Y' and user_id like ?) where rown between ? and ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + id + "%");
			pstat.setInt(2, n);
			pstat.setInt(3, m);
			try (ResultSet rs = pstat.executeQuery();) {
				List<MemberDTO> list = new ArrayList<>();
				while (rs.next()) {
					String userId = rs.getString(1);
					String name = rs.getString(2);
					String nickname = rs.getString(3);
					Timestamp date = rs.getTimestamp(4);

					MemberDTO member = new MemberDTO(userId, null, name, nickname, null, null, null, date, null, null,
							null, null);
					list.add(member);
				}
				return list;
			}
		}
	}
	
	// 검색된 신고 글 목록 반환
	public List<CBoard2DTO> viewSearchedPostList(String searchInput, int n, int m) throws Exception{
		String sql = "select * from (select c_board.*, member.user_nickname, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where user_nickname like ? and c_board_report >= 5) where rown between ? and ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchInput + "%");
			pstat.setInt(2, n);
			pstat.setInt(3, m);
			try (ResultSet rs = pstat.executeQuery();) {
				List<CBoard2DTO> list = new ArrayList<>();
				while (rs.next()) {
					int seq = rs.getInt(1);
					String title = rs.getString(4);
					Timestamp date = rs.getTimestamp(6);
					int report = rs.getInt(8);
					String writer = rs.getString(10);
					
					CBoard2DTO post = new CBoard2DTO(seq, writer, 0, title, null, date, 0, report, 0);
					
					list.add(post);
				}
				return list;
			}
		}
	}
	

	// 회원목록 유저 블랙
	public String blackUser(String id) throws Exception {
		String sql = "update member set user_black = 'Y' where user_id = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();

			if (result > 0) {
				return "success";
			} else {
				return "failed";
			}
		}
	}

	// 회원목록 유저 탈퇴
	public String quitUser(String id) throws Exception {
		String sql = "delete from member where user_id = ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();

			if (result > 0) {
				return "success";
			} else {
				return "failed";
			}
		}
	}
	
	// 블랙회원관리 유저 블랙 취소
	public String blackCancelUser(String id) throws Exception{
		String sql = "update member set user_black = 'N' where user_id = ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();

			if (result > 0) {
				return "success";
			} else {
				return "failed";
			}
		}
	}
	
	// 신고된 게시글의 신고 현황 조회
	public List<ReportDTO> viewReportList(int seq) throws Exception{
		String sql = "select * from report where c_board_seq = ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReportDTO> list = new ArrayList<>();
				while(rs.next()) {
					String writer = rs.getString(3);
					int reportType = rs.getInt(4);
					Timestamp reportDate = rs.getTimestamp(5);
					
					ReportDTO report = new ReportDTO(0, seq, writer, reportType, reportDate);
					list.add(report);
				}
				return list;
			}
		}
	}
	
}
