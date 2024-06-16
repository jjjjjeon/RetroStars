package controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			
			}else if(cmd.equals("/list.qboard")) {
				//받은 정보 처리하기
				String strcpage=request.getParameter("cpage");
				if(strcpage==null) {strcpage="1";}
				int cpage=Integer.parseInt(strcpage);
				String strcategory=request.getParameter("category");
				if(strcategory==null) {strcategory="0";}
				int category=Integer.parseInt(strcategory);
				String searchBy=request.getParameter("searchBy");
				if(searchBy==null) {searchBy="0";}
				String searchData=request.getParameter("searchData");
				if(searchData==null) {searchData="0";}		
				
				//보낼 정보 처리하기
				request.setAttribute("cpage", cpage);
				request.setAttribute("category", category);
				//response.getWriter().append(g.toJson(new String[] {searchBy, searchData}));
				request.setAttribute("searchBy", searchBy);
				request.setAttribute("searchData", searchData);
				request.setAttribute("record_count_per_page", Static.QBOARD_RECOD_COUNT_PER_PAGE);
				request.setAttribute("navi_count_per_page", Static.QBOARD_NAVI_COUNT_PER_PAGE);
				
				System.out.println("=========="+searchBy+searchData);
				
				
				//게시판 전체 레코드 체크
				request.setAttribute("record_total_count", boarddao.getRecordCount(category,searchBy,searchData));
				System.out.println(boarddao.getRecordCount(category,searchBy,searchData));
				ArrayList<QBoardDTO> list=boarddao.select(cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
										cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE,category, searchBy, searchData);
				request.setAttribute("list", list);
				System.out.println(list);
				request.getRequestDispatcher("/qboard/mainBoard.jsp").forward(request, response);
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
