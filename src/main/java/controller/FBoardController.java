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
import dto.FBoardDTO;

@WebServlet("*.fboard")
public class FBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String cmd = request.getRequestURI();
		FBoardDAO fBoardDao = FBoardDAO.getInstance();
		System.out.println(cmd);
		
		try {		
			// FAQ 목록 출력
			if(cmd.equals("/list.fboard")) {
			
				//List<FBoardDTO> fboardCate = fBoardDao.listCate();
//				List<FBoardDTO> fboardCate1 = fBoardDao.listCate1();
//				List<FBoardDTO> fboardCate2 = fBoardDao.listCate2();
//				List<FBoardDTO> fboardCate3 = fBoardDao.listCate3();
				
				String category = request.getParameter("category");
				if(category==null) {category = "0";}
				
				String pcpage = request.getParameter("cpage");
				if (pcpage == null) {pcpage = "1";}
				int cpage = Integer.parseInt(pcpage);
				
				
				List<FBoardDTO> fboardCate = fBoardDao.selectNtoM(
				cpage*FBoardConfig.recordCountPerFPage-(FBoardConfig.recordCountPerFPage-1),
				cpage*FBoardConfig.recordCountPerFPage);
				
//				request.setAttribute("fboardCate1", fboardCate1);
//				request.setAttribute("fboardCate2", fboardCate2);
//				request.setAttribute("fboardCate3", fboardCate3);
				
				request.setAttribute("category", category);
				request.setAttribute("cpage", cpage);
				request.setAttribute("fboardCate", fboardCate);
				request.setAttribute("recordCountPerPage", FBoardConfig.recordCountPerFPage);
				request.setAttribute("naviCountPerPage", FBoardConfig.naviCountPerFPage);
				request.setAttribute("recordTotalCount",fBoardDao.getRecordCountAll());
				request.getRequestDispatcher("/fboard/fBoard.jsp").forward(request, response);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
		
	}

}
