package controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import common.FBoardConfig;
import dao.FBoardDAO;
import dao.MemberDAO;
import dto.FBoardDTO;

@WebServlet("*.fboard")
public class FBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String cmd = request.getRequestURI();
		FBoardDAO fBoardDao = FBoardDAO.getInstance();
		MemberDAO mBoardDao = MemberDAO.getInstance();
		System.out.println(cmd);
		
		try {		
			// FAQ 목록 출력
			if(cmd.equals("/list.fboard")) {
				
				String category = request.getParameter("category");
				if(category == null) {category = "0";}
				String pcpage = request.getParameter("cpage");
				if (pcpage == null) {pcpage = "1";}
				int cpage = Integer.parseInt(pcpage);	
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");				
				
				boolean isAdmin = mBoardDao.isAdmin(id);
				String admin = "";
				
				if(isAdmin) {
					admin = "admin";
				}else {
					admin="user";
				}
				
				List<FBoardDTO> fboardCate = fBoardDao.listCateNtoM(category,
				cpage*FBoardConfig.recordCountPerFPage-(FBoardConfig.recordCountPerFPage-1),
				cpage*FBoardConfig.recordCountPerFPage);

				request.setAttribute("isAdmin", admin);
				request.setAttribute("category", category);
				request.setAttribute("cpage", cpage);
				request.setAttribute("fboardCate", fboardCate);
				request.setAttribute("recordCountPerPage", FBoardConfig.recordCountPerFPage);
				request.setAttribute("naviCountPerPage", FBoardConfig.naviCountPerFPage);
				request.setAttribute("recordTotalCount",fBoardDao.getRecordCount(category));
				System.out.println("컨트롤ㄹ러 출력"+admin);
				
				request.getRequestDispatcher("/fboard/mainBoard.jsp").forward(request, response);
			
			// 검색 유형 및 카테고리 별 검색 기능
			}else if(cmd.equals("/search.fboard")) {
				
				String kind = request.getParameter("kind");
				String category = request.getParameter("category");
				String search = request.getParameter("search");
				String pullCate = "4";
				
				String pcpage = request.getParameter("cpage");
				
				System.out.println(kind+":"+category+":"+search+":"+pullCate+":"+pcpage);
				
				
				if (pcpage == "null") {pcpage = "1";}
				int cpage = Integer.parseInt(pcpage);
				
				List<FBoardDTO> fboardCate = fBoardDao.searchNtoM(kind, category, search,
						cpage*FBoardConfig.recordCountPerFPage-(FBoardConfig.recordCountPerFPage-1),
						cpage*FBoardConfig.recordCountPerFPage);				
				int recordSize = fboardCate.size();
				
				System.out.println(recordSize);
				
				request.setAttribute("kind", kind);
				request.setAttribute("search", search);
				request.setAttribute("category", pullCate);
				request.setAttribute("cpage", cpage);
				request.setAttribute("fboardCate", fboardCate);
				request.setAttribute("recordCountPerPage", FBoardConfig.recordCountPerFPage);
				request.setAttribute("naviCountPerPage", FBoardConfig.naviCountPerFPage);
				request.setAttribute("recordTotalCount",recordSize);
				
				request.getRequestDispatcher("/fboard/mainBoard.jsp").forward(request, response);
				
			// 게시글 작성 페이지 이동 시 관리자 유무 확인	
			}else if(cmd.equals("/goWriteFaq.fboard")) {
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");		
				boolean adminYn = mBoardDao.isAdmin(id);
				
				
				request.setAttribute("isAdmin", adminYn);
				request.getRequestDispatcher("/fboard/writeBoard.jsp").forward(request, response);
			
			// 게시글 입력 (관리자)	
			}else if(cmd.equals("/insert.fboard")) {
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");	
				
				String category = request.getParameter("category");
				String question = request.getParameter("question");
				String answer = request.getParameter("answer");
				
				//System.out.println(id +":"+ category +":"+ question +":"+ answer);
				
				fBoardDao.insert(new FBoardDTO(0, id, category, question, answer));
				
				response.sendRedirect("/list.fboard");
				
			// 게시글 삭제 (관리자)	
			}else if(cmd.equals("/delete.fboard")) {
				
				session = request.getSession();
				String id = (String) session.getAttribute("loginId");
				
				boolean adminYn = mBoardDao.isAdmin(id);
				
				if(adminYn) {
					
					String title = request.getParameter("title");
					String category = request.getParameter("category");					
					System.out.println(title +":"+ category);
					
					fBoardDao.delete(title);
					
					request.getRequestDispatcher("/list.fboard?category"+category).forward(request, response);

					
				}else {
					
				} 
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
}
	
}
