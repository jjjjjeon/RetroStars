package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CBoard2DTO;
import dto.MemberDTO;
import dto.Report2DTO;

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
	public int getReportPostListCount() throws Exception {
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
	public int getSearchedBlackCount(String id) throws Exception {
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
	public int getSearchedPostCount(String searchInput) throws Exception {
		String sql = "select count(c_board_seq) from (select c_board.*, row_number() over(order by c_board_seq desc) rown from c_board join member on c_board.user_id = member.user_id where user_nickname like ? and c_board_report >= 5)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchInput + "%");
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	// 전체 회원 목록 반환
	public List<MemberDTO> viewMemberList(int n, int m) throws Exception {
		String sql = "select user_id, user_name, user_nickname, user_join_date, user_active from (select member.*, row_number() over(order by user_join_date desc) rown from member where user_id != 'admin' and user_black != 'Y') where rown between ? and ?";
		
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
		String sql = "select user_id, user_name, user_nickname, user_join_date from (select member.*, row_number() over(order by user_join_date desc) rown from member where user_black = 'Y') where rown between ? and ?";

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
	public List<CBoard2DTO> viewReportPostList(int n, int m) throws Exception {
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
		String sql = "select user_id, user_name, user_nickname, user_join_date, user_active from (select member.*, row_number() over(order by user_join_date desc) rown from member where user_id != 'admin' and user_black != 'Y' and user_id like ?) where rown between ? and ?";

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
	public List<MemberDTO> viewSearchedBlackList(String id, int n, int m) throws Exception {
		String sql = "select user_id, user_name, user_nickname, user_join_date from (select member.*, row_number() over(order by user_join_date desc) rown from member where user_black = 'Y' and user_id like ?) where rown between ? and ?";

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
	public List<CBoard2DTO> viewSearchedPostList(String searchInput, int n, int m) throws Exception {
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
	public String blackCancelUser(String id) throws Exception {
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
	public List<Report2DTO> viewReportList(int seq) throws Exception {
		String sql = "select * from (select report.*, user_nickname from report join member on report.user_id  = member.user_id where c_board_seq = ?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			try (ResultSet rs = pstat.executeQuery();) {
				List<Report2DTO> list = new ArrayList<>();
				while (rs.next()) {
					int reportType = rs.getInt(4);
					Timestamp reportDate = rs.getTimestamp(5);
					String writer = rs.getString(6);

					Report2DTO report = new Report2DTO(0, seq, writer, reportType, reportDate);
					list.add(report);
				}
				return list;
			}
		}
	}

	// 게임별 이용횟수
	public ArrayList<HashMap<String,?>> getGameNumberOfUse() throws Exception {
		ArrayList<HashMap<String,?>> list=new ArrayList<>();
		String sql = "SELECT p.game_seq, g.game_title, COUNT(*) AS play_count "
				+ "FROM play_record p "
				+ "LEFT JOIN game g ON p.game_seq = g.game_seq "
				+ "GROUP BY p.game_seq, g.game_title "
				+ "ORDER BY 1";
		try (Connection con = this.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				HashMap map=new HashMap<>();
				map.put("game_seq",rs.getInt(1));
				map.put("game_title",rs.getString(2));
				map.put("play_count",rs.getInt(3));
				list.add(map);
			}
			return list;
		}
	}

	// 연령별 이용횟수 10~50대
	public int[] getAgeNumberOfUse() throws Exception {
		int[] arr = new int[6]; // 0-5인데 0은 사용하지 않을 것.
		String sql = "select age, count(*) from (SELECT p.*, " + "m.user_id AS m_user_id, "
				+ "m.user_no, m.user_name, substr(m.user_no, 1, 2) AS birthday_year, "
				+ "substr((to_char(sysdate, 'yyyy') - CASE "
				+ "WHEN TO_NUMBER(SUBSTR(m.user_no, 1, 2)) <= TO_NUMBER(TO_CHAR(SYSDATE, 'YY')) "
				+ "THEN 2000 + TO_NUMBER(SUBSTR(m.user_no, 1, 2)) ELSE "
				+ "1900 + TO_NUMBER(SUBSTR(m.user_no, 1, 2)) END), 1, 1) AS age " + "FROM play_record p "
				+ "LEFT JOIN member m ON p.user_id = m.user_id) total " + "group by age order by 1 ";

		try (Connection con = this.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			int i = 1;
			while (rs.next()) {
				arr[i] = rs.getInt(2);
				i++;
			}
			return arr;
		}
	}

	// 성별별 회원수
	public int[] getGenderRatioOfMem() throws Exception {
		int[] arr = new int[3]; // 0-2인데 0은 사용하지 않을 것. 1은 남자 2는 여자
		String sql = "select gender,count(*) from( " + "select user_id, user_no, user_name, user_admin, "
				+ "decode(substr(user_no, 7, 1),1,'남자',3,'남자',2,'여자',4,'여자','결과없음') as gender "
				+ "from member where user_admin = 'N') " + "group by gender order by 1";

		try (Connection con = this.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			int i = 1;
			while (rs.next()) {
				arr[i] = rs.getInt(2);
				i++;
			}
			return arr;
		}
	}

	// 게임별 평균 플레이 시간
	public ArrayList<HashMap<String,?>> getGameAvgOfTime() throws Exception {
		ArrayList<HashMap<String,?>> list=new ArrayList<>();
		String sql = "select p.game_seq, g.game_title, avg(play_duration) as play_duration "
				+ "FROM play_record p "
				+ "LEFT JOIN game g ON p.game_seq = g.game_seq "
				+ "GROUP BY p.game_seq, g.game_title "
				+ "order by 1";
		try (Connection con = this.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				HashMap map=new HashMap<>();
				map.put("game_seq",rs.getInt(1));
				map.put("game_title",rs.getString(2));
				map.put("play_duration",rs.getFloat(3));
				list.add(map);
			}
			return list;
		}
	}

	// 미해결 디테일페이지 내용 출력하기
	public ArrayList<HashMap<String, ?>> getUnresolvedQBoard() throws Exception {
		ArrayList<HashMap<String, ?>> list = new ArrayList<>();

		String sql = "select q.*, m.user_nickname as nickname from q_board q "
				+ "left join member m on q.user_id=m.user_id " + "where q_board_answer='N' order by 1";

		try (Connection con = this.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				HashMap map = new HashMap<>();
				map.put("qBoardSeq", rs.getInt("q_board_seq"));
				map.put("userId", rs.getString("user_id"));
				map.put("qBoardCategory", rs.getInt("q_board_category"));
				map.put("qBoardTitle", rs.getString("q_board_title"));
				map.put("qBoardContent", rs.getString("q_board_content"));
				map.put("qBoardDate", rs.getTimestamp("q_board_date"));
				map.put("qBoardAnswer", rs.getString("q_board_answer"));
				map.put("qBoardSecret", rs.getString("q_board_secret"));
				map.put("qBoardUserNickname", rs.getString("nickname"));
				list.add(map);
			}
			return list;
		}
	}
	
	// 신고 현황에 집계된 모든 글 삭제
	public void delAllReportedPost() throws Exception{
		String sql = "delete from c_board where c_board_report >= 5";
		
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.executeUpdate();
		}
	}

}
