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
				List<FBoardDTO> fboardCate = fBoardDao.listCateNtoM(category,
				cpage*FBoardConfig.recordCountPerFPage-(FBoardConfig.recordCountPerFPage-1),
				cpage*FBoardConfig.recordCountPerFPage);

				request.setAttribute("isAdmin", isAdmin);
				request.setAttribute("category", category);
				request.setAttribute("cpage", cpage);
				request.setAttribute("fboardCate", fboardCate);
				request.setAttribute("recordCountPerPage", FBoardConfig.recordCountPerFPage);
				request.setAttribute("naviCountPerPage", FBoardConfig.naviCountPerFPage);
				request.setAttribute("recordTotalCount",fBoardDao.getRecordCount(category));
				
				
				request.getRequestDispatcher("/fboard/fBoard.jsp").forward(request, response);
				
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
				
				request.getRequestDispatcher("/fboard/fBoard.jsp").forward(request, response);

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
