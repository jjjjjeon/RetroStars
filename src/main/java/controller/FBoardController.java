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
				
//				session = request.getSession();
//				String id = (String) session.getAttribute("loginId");
//				
				List<FBoardDTO> fboardCate1 = fBoardDao.listCate1();
				List<FBoardDTO> fboardCate2 = fBoardDao.listCate2();
				List<FBoardDTO> fboardCate3 = fBoardDao.listCate3();
				List<FBoardDTO> fboardCate4 = fBoardDao.listCate4();
				
				request.setAttribute("fboardCate1", fboardCate1);
				request.setAttribute("fboardCate2", fboardCate2);
				request.setAttribute("fboardCate3", fboardCate3);
				request.setAttribute("fboardCate4", fboardCate4);
				request.getRequestDispatcher("/fboard/fBoard.jsp").forward(request, response);	
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
		
	}

}
