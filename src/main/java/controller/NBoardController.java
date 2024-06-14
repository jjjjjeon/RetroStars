package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.BoardConfig;
import dao.NBoardDAO;
import dto.NBoardDTO;


@WebServlet("*.nboard")
public class NBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		NBoardDAO nManager = NBoardDAO.getInstance();
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/write.nboard")) {
				HttpSession session = request.getSession();
				
				String userId = (String)request.getSession().getAttribute("loginId");
				String nBoardTitle = request.getParameter("title");
				String nBoardContent = request.getParameter("contents");
				
				int result = nManager.insert(new NBoardDTO(0,userId,nBoardTitle,nBoardTitle,null,0));
				
				System.out.println(userId);
				System.out.println(nBoardTitle);
				System.out.println(nBoardContent);
				
				response.sendRedirect("/list.nboard");
			} else if(cmd.equals("/list.nboard")) {
				String pcpage = request.getParameter("cpage");
				
				if(pcpage==null) {pcpage="1";}
				int cpage = Integer.parseInt(pcpage);
				
				
				List<NBoardDTO> list = 
						nManager.selectNtoM(
						cpage*BoardConfig.recordCountPerPage-(BoardConfig.recordCountPerPage-1),
						cpage*BoardConfig.recordCountPerPage
				);
				
				request.setAttribute("list", list); // 현재 내가 해당하는 페이지의 목록들.
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", BoardConfig.recordCountPerPage);
				request.setAttribute("navi_count_per_page", BoardConfig.naviCountPerPage);
				request.setAttribute("record_total_count", nManager.getRecordCount());
				
				request.getRequestDispatcher("/nboard/nboardMain.jsp").forward(request,response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
