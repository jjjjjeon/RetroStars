package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.Static;
import dao.MemberDAO;
import dao.QBoardDAO;
import dto.QBoardDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Sam, 날짜 : 2024. 6. 17., 설명 : CRUD완성
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
		MemberDAO memberdao=MemberDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.qboard")){
				String loginId=(String)request.getSession().getAttribute("loginId");
				String boardWriterNicname=request.getParameter("boardWriterNicname");
				int qBoardCategory= boarddao.getCategory(request.getParameter("qBoardCategory")) ;
				String qBoardTitle= request.getParameter("qBoardTitle");
				String qBoardContent= request.getParameter("qBoardContent");
				String qBoardSecret=boarddao.getSecretYN(request.getParameter("qBoardSecret")) ;
				
				System.out.println(loginId+qBoardCategory+qBoardTitle+qBoardContent+qBoardSecret);	
				boarddao.insert(new QBoardDTO(0,loginId,qBoardCategory,qBoardTitle,qBoardContent,null,"N",qBoardSecret));
				response.sendRedirect("/list.qboard");
				
			}else if(cmd.equals("/list.qboard")) {
				String loginId=(String)request.getSession().getAttribute("loginId");
				if(loginId==null) {loginId="0";}
				
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
				request.setAttribute("loginId", loginId);
				request.setAttribute("cpage", cpage);
				request.setAttribute("category", category);
				request.setAttribute("searchBy", searchBy);
				request.setAttribute("searchData", searchData);
				request.setAttribute("record_count_per_page", Static.QBOARD_RECOD_COUNT_PER_PAGE);
				request.setAttribute("navi_count_per_page", Static.QBOARD_NAVI_COUNT_PER_PAGE);
				
				//게시판 전체 레코드 체크
				request.setAttribute("record_total_count", boarddao.getRecordCount(category,searchBy,searchData));
				//System.out.println(boarddao.getRecordCount(category,searchBy,searchData));
				ArrayList<HashMap<String,?>> list= boarddao.select(cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
										cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE,category, searchBy, searchData);	
				request.setAttribute("list", list);
				//System.out.println(list);
				request.getRequestDispatcher("/qboard/mainBoard.jsp").forward(request, response);
			
			}else if(cmd.equals("/detail.qboard")) {
				String loginId=(String)request.getSession().getAttribute("loginId");
				int seq=Integer.parseInt(request.getParameter("seq"));
				QBoardDTO dto=boarddao.selectcontent(seq);
				request.setAttribute("dto", dto);
				request.setAttribute("loginId", loginId);
				
				request.getRequestDispatcher("/qboard/detailBoard.jsp").forward(request, response);
			}else if(cmd.equals("/delete.qboard")) {
				int seq=Integer.parseInt(request.getParameter("seq"));
				int result=boarddao.deleteBySeq(seq);
				response.sendRedirect("/list.qboard");
				
			}else if(cmd.equals("/update.qboard")) {
				int seq=Integer.parseInt(request.getParameter("seq"));
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				int result=boarddao.updateBySeq(seq,title,content);
				response.sendRedirect("/list.qboard");
				
			}else if(cmd.equals("/gowrite.qboard")) {
				//닉네임처리
				String loginId=(String)request.getSession().getAttribute("loginId");
				String nickname=memberdao.getNickname(loginId);
				request.setAttribute("nickname", nickname);
				request.getRequestDispatcher("/qboard/writeBoard.jsp").forward(request, response);
				
				
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
