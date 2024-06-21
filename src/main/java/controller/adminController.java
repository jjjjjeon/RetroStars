package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.BoardConfig;
import dao.adminDAO;
import dto.CBoard2DTO;
import dto.MemberDTO;
import dto.ReportDTO;

@WebServlet("*.admin")
public class adminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		adminDAO aManager = adminDAO.getInstance();
		Gson g = new Gson();
		String cmd = request.getRequestURI();
		System.out.println("get:" + cmd);

		try {
			// 회원 목록 : 전체 회원 목록 출력
			if (cmd.equals("/memberList.admin")) {
				String id = (String) request.getSession().getAttribute("loginId");

				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
					cpageStr = "1";
				}

				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;
				int recordTotalCount = aManager.getRecordCount();

				List<MemberDTO> list = aManager.viewMemberList(startNum, endNum);

				request.setAttribute("loginId", id);
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", recordTotalCount);
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 0);

				request.getRequestDispatcher("/admin/memberManagement.jsp").forward(request, response);

				// 회원 목록 : ID로 검색된 회원 목록 출력
			} else if (cmd.equals("/searchMemberList.admin")) {
				String id = (String) request.getSession().getAttribute("loginId");

				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
					cpageStr = "1";
				}

				String searchInput = request.getParameter("searchInput");
				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;

				List<MemberDTO> list = aManager.viewSearchedMemberList(searchInput, startNum, endNum);

				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", aManager.getSearchedRecordCount(searchInput));
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 1);
				request.setAttribute("searchInput", searchInput);

				request.getRequestDispatcher("/admin/memberManagement.jsp").forward(request, response);

				// 회원 목록 : 유저 블랙하기
			} else if (cmd.equals("/blackUser.admin")) {
				String userId = request.getParameter("id");

				String result = aManager.blackUser(userId);

				PrintWriter pw = response.getWriter();
				pw.append(result);

				// 회원 목록 : 유저 탈퇴시키기
			} else if (cmd.equals("/quitUser.admin")) {
				String userId = request.getParameter("id");

				String result = aManager.quitUser(userId);

				PrintWriter pw = response.getWriter();
				pw.append(result);

				// 블랙회원 관리 : 블랙된 회원 목록 출력
			} else if (cmd.equals("/blackList.admin")) {
				String id = (String) request.getSession().getAttribute("loginId");
				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
					cpageStr = "1";
				}

				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;
				int recordTotalCount = aManager.getBlackMemberCount();

				List<MemberDTO> list = aManager.viewBlackList(startNum, endNum);

				request.setAttribute("loginId", id);
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", recordTotalCount);
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 0);

				request.getRequestDispatcher("/admin/blackMember.jsp").forward(request, response);

				// 블랙회원 관리 : ID로 검색한 블랙된 회원 목록 출력
			} else if (cmd.equals("/searchBlackList.admin")) {
				String id = (String) request.getSession().getAttribute("loginId");
				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
					cpageStr = "1";
				}

				String searchInput = request.getParameter("searchInput");
				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;

				List<MemberDTO> list = aManager.viewSearchedBlackList(searchInput, startNum, endNum);

				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", aManager.getSearchedBlackCount(searchInput));
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 1);
				request.setAttribute("searchInput", searchInput);

				request.getRequestDispatcher("/admin/blackMember.jsp").forward(request, response);

				// 블랙회원 관리 : 블랙 취소
			} else if (cmd.equals("/blackCancelUser.admin")) {
				String userId = request.getParameter("id");

				String result = aManager.blackCancelUser(userId);

				PrintWriter pw = response.getWriter();
				pw.append(result);

				// 신고 현황 : 신고된 글 목록 출력
			} else if (cmd.equals("/reportList.admin")) {
				String id = (String) request.getSession().getAttribute("loginId");

				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
					cpageStr = "1";
				}

				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;
				int recordTotalCount = aManager.getReportPostListCount();

				List<CBoard2DTO> list = aManager.viewReportPostList(startNum, endNum);

				request.setAttribute("loginId", id);
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", recordTotalCount);
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 0);

				request.getRequestDispatcher("/admin/reportManagement.jsp").forward(request, response);

				// 신고 현황 : 검색된 작성자명으로 신고된 글 목록 출력
			} else if (cmd.equals("/searchPostList.admin")) {
				String id = (String) request.getSession().getAttribute("loginId");

				String cpageStr = request.getParameter("cpage");
				if (cpageStr == null) {
					cpageStr = "1";
				}

				String searchInput = request.getParameter("searchInput");
				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;

				List<CBoard2DTO> list = aManager.viewSearchedPostList(searchInput, startNum, endNum);

				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", aManager.getSearchedPostCount(searchInput));
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 1);
				request.setAttribute("searchInput", searchInput);

				request.getRequestDispatcher("/admin/reportManagement.jsp").forward(request, response);

				// 신고 현황 : 신고된 글의 신고 내역 출력
			} else if (cmd.equals("/viewReport.admin")) {
				int seq = Integer.parseInt(request.getParameter("seq"));

				List<ReportDTO> list = aManager.viewReportList(seq);

				String result = g.toJson(list);

				PrintWriter pw = response.getWriter();
				pw.append(result);

				// 대시보드 이동
			} else if (cmd.equals("/dashBoard.admin")) {
				int[] gameNumberOfArr = aManager.getGameNumberOfUse();
				int[] ageNumberOfArr = aManager.getAgeNumberOfUse();
				int[] genderRatioOfMem = aManager.getGenderRatioOfMem();
				float[] gameAvgOfTime = aManager.getGameAvgOfTime();
				ArrayList<HashMap<String, ?>> list = aManager.getUnresolvedQBoard();
				System.out.println(list);
				request.setAttribute("gameNumberOfArr", gameNumberOfArr);
				request.setAttribute("ageNumberOfArr", ageNumberOfArr);
				request.setAttribute("genderRatioOfMem", genderRatioOfMem);
				request.setAttribute("gameAvgOfTime", gameAvgOfTime);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/dashBoard.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
