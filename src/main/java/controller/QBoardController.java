package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.Static;
import dao.QBoardDAO;
import dto.QBoardDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Sam, 날짜 : 2024. 6. 13., 설명 : 최초작성
 *
 * @author : Sam
 * @version 1.0 
 */

@WebServlet("*.qboard")
public class QBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Gson g=new Gson();
		
		String cmd=request.getRequestURI();
		System.out.println(cmd);
		QBoardDAO boarddao=QBoardDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.qboard")){
				String userId=request.getParameter("userId");
				int qBoardCategory= boarddao.getCategory(request.getParameter("qBoardCategory")) ;
				String qBoardTitle= request.getParameter("qBoardTitle");
				String qBoardContent= request.getParameter("qBoardContent");
				String qBoardSecret=boarddao.getSecretYN(request.getParameter("qBoardSecret")) ;
				boarddao.insert(new QBoardDTO(0,userId,qBoardCategory,qBoardTitle,qBoardContent,null,"N",qBoardSecret));
				
			}else if(cmd.equals("/select.qboard")) {
				String pcpage=request.getParameter("cpage");
				if(pcpage==null) {pcpage="1";}
				int cpage=Integer.parseInt(pcpage);
				int recordCountPerPage = Static.QBOARD_RECOD_COUNT_PER_PAGE;
	            int naviCountPerPage = Static.QBOARD_NAVI_COUNT_PER_PAGE;
	            int recordTotalCount = boarddao.getRecordCount();
				ArrayList<QBoardDTO> list=
						boarddao.select(
								cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
								cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE);
				
				request.setAttribute("list", list);
				String json = g.toJson(new Object[] { cpage, recordCountPerPage, naviCountPerPage, recordTotalCount, list });
		        response.getWriter().write(json);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
