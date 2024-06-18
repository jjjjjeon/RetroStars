package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.BoardConfig;
import dao.CBoardDAO;
import dao.CFileDAO;
import dao.CReplyDAO;
import dao.MemberDAO;
import dao.ReportDAO;
import dto.CBoard2DTO;
import dto.CBoardDTO;
import dto.CFileDTO;
import dto.ReportDTO;

@WebServlet("*.cboard")
public class CBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CBoardDAO bManager = CBoardDAO.getInstance();
		CFileDAO fManager = CFileDAO.getInstance();
		CReplyDAO rManager = CReplyDAO.getInstance();
		MemberDAO mManager = MemberDAO.getInstance();
		ReportDAO rptManager = ReportDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("get:" + cmd);
		
		try {
			//카테고리별 글 목록 출력.
			if(cmd.equals("/list.cboard")) {
				String id = (String) request.getSession().getAttribute("loginId");
				
				String categoryStr = request.getParameter("category");
				if(categoryStr == null) {
					categoryStr = "0";
				}
				
				String cpageStr = request.getParameter("cpage");
				if(cpageStr == null) {
					cpageStr = "1";
				}
				
				int category = Integer.parseInt(categoryStr);
				int cpage = Integer.parseInt(cpageStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;
				int recordTotalCount = bManager.getRecordCount(category);
				
				List<CBoard2DTO> list = bManager.viewList(category, startNum, endNum);
				
				request.setAttribute("loginId", id);
				request.setAttribute("cpage", cpage);
				request.setAttribute("category", category);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", recordTotalCount);
				request.setAttribute("list", list);
				request.setAttribute("isSearchedList", 0);
				
				request.getRequestDispatcher("/cboard/mainBoard.jsp").forward(request, response);
				
			//카테고리별 제목별/작성자별 검색된 글 목록 출력.
			}else if (cmd.equals("/searchList.cboard")) {
				String categoryStr = request.getParameter("category");
				if(categoryStr == null) {
					categoryStr = "0";
				}
				
				String cpageStr = request.getParameter("cpage");
				if(cpageStr == null) {
					cpageStr = "1";
				}
				
				String searchType = request.getParameter("searchType");
				String searchInput = request.getParameter("searchInput");
				int cpage = Integer.parseInt(cpageStr);
				int category = Integer.parseInt(categoryStr);
				int startNum = cpage * BoardConfig.recordCountPerPage - (BoardConfig.recordCountPerPage - 1);
				int endNum = cpage * BoardConfig.recordCountPerPage;
				
				List<CBoard2DTO> searchedList = bManager.viewSearchedList(category, startNum, endNum, searchType, searchInput);
				
				request.setAttribute("cpage", cpage);
				request.setAttribute("category", category);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", bManager.getSearchedCount(category, searchType, searchInput));
				request.setAttribute("list", searchedList);
				request.setAttribute("isSearchedList", 1);
				request.setAttribute("searchType", searchType);
				request.setAttribute("searchInput", searchInput);
				
				request.getRequestDispatcher("/cboard/mainBoard.jsp").forward(request, response);

			//게시글 내용 열람.
			}else if(cmd.equals("/detail.cboard")) {
				String id = (String) request.getSession().getAttribute("loginId");
				
				String categoryStr = request.getParameter("category");
				if(categoryStr == null) {
					categoryStr = "0";
				}
				
				String cpageStr = request.getParameter("cpage");
				if(cpageStr == null) {
					cpageStr = "1";
				}
				
				int category = Integer.parseInt(categoryStr);
				int cpage = Integer.parseInt(cpageStr);
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				bManager.upViewCount(seq);
				CBoard2DTO post = bManager.viewPost(seq);
				
				List<CFileDTO> fileList = fManager.getFileList(seq);
				
				int isBookmark = bManager.isBookmark(id, seq);
				
				int replyTotalCount = rManager.countRepleList(seq);
				
				request.setAttribute("isBookmark", isBookmark);
				request.setAttribute("replyTotalCount", replyTotalCount);
				request.setAttribute("category", category);
				request.setAttribute("cpage", cpage);
				request.setAttribute("fileList", fileList);
				request.setAttribute("loginId", id);
				request.setAttribute("DTO", post);
				request.getRequestDispatcher("/cboard/detailBoard.jsp").forward(request, response);
				
			//유저게시판 게시글 삭제.	
			}else if (cmd.equals("/delete.cboard")) {
				int category = Integer.parseInt(request.getParameter("category"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				bManager.delPost(seq);
				
				response.sendRedirect("/list.cboard?category=" + category + "&cpage=" + cpage);
				
			//유저게시판 게시글 북마크 해제.
			}else if( cmd.equals("/delBookmark.cboard")) {
				String id = (String) request.getSession().getAttribute("loginId");
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				bManager.delBookmark(id, seq);
				
			//유저게시판 게시글 북마크 추가.
			}else if( cmd.equals("/addBookmark.cboard")) {
				String id = (String) request.getSession().getAttribute("loginId");
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				bManager.addBookmark(id, seq);
				
			//글쓰기게시판 이동.
			}else if(cmd.equals("/goWrite.cboard")) {
				String id = (String) request.getSession().getAttribute("loginId");
				String nickname = mManager.getNickname(id);
				
				request.setAttribute("loginId", id);
				request.setAttribute("nickname", nickname);
				request.getRequestDispatcher("/cboard/writeBoard.jsp").forward(request, response);
				
			//유저게시판 글 신고.
			}else if(cmd.equals("/report.cboard")) {
				int boardSeq = Integer.parseInt(request.getParameter("seq"));
				String reporterId = request.getParameter("loginId");
				int reportType = Integer.parseInt(request.getParameter("reportType"));
				
				if(rptManager.isDuplicate(boardSeq, reporterId)) {
					String result = "duplicated";
					PrintWriter pw = response.getWriter();
					pw.append(result);
				}else {
					ReportDTO report = new ReportDTO(0, boardSeq, reporterId, reportType, null);
					String result = rptManager.addReport(report);
					
					PrintWriter pw = response.getWriter();
					pw.append(result);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CBoardDAO bManager = CBoardDAO.getInstance();
		CFileDAO fManager = CFileDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("post:" + cmd);
		
		try {
			//유저게시판 게시글 작성.
			if(cmd.equals("/write.cboard")) {
				int category = 0;
				
				int maxSize = 1024 * 1024 * 10;
				String realPath = request.getServletContext().getRealPath("files");
				System.out.println(realPath);
				File uploadPath = new File(realPath);
				
				if(!uploadPath.exists()) {
					uploadPath.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				
				String categoryStr = multi.getParameter("category");
				if(categoryStr.equals("option1")){
					category = 1;
				}else {
					category = 2;
				}
				
				String id = multi.getParameter("userId");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");	
				
				CBoardDTO ctt = new CBoardDTO(0, id, category ,title, content, null, 0, 0, 0);
				
				bManager.insertPost(ctt);
				
				int parent_seq = bManager.getLastSeq(id, category);
				
				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String name = names.nextElement();
					String oriname = multi.getOriginalFileName(name);
					String sysname = multi.getFilesystemName(name);
					
					if(oriname != null) {
						fManager.addFile(new CFileDTO(0, oriname, sysname, parent_seq));
					}
				}
				
				response.sendRedirect("/list.cboard");
				
			//유저게시판 게시글 수정.
			}else if (cmd.equals("/correction.cboard")) {
				int category = Integer.parseInt(request.getParameter("category"));
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				CBoardDTO post = new CBoardDTO(seq, "system", category, title, content, null, 0, 0, 0);
				
				bManager.correctPost(post);
				
				response.sendRedirect("/detail.cboard?category=" + category + "&cpage=" + cpage + "&seq=" + seq);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
