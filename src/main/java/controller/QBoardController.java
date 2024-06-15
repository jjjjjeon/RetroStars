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
				String pcpage=request.getParameter("cpage");
				if(pcpage==null) {pcpage="1";}
				int cpage=Integer.parseInt(pcpage);
				
				//보낼 정보 처리하기
				request.setAttribute("cpage", cpage);
				request.setAttribute("record_count_per_page", Static.QBOARD_RECOD_COUNT_PER_PAGE);
				request.setAttribute("navi_count_per_page", Static.QBOARD_NAVI_COUNT_PER_PAGE);
				
				//전체출력리스트
				
				request.setAttribute("record_total_count", boarddao.getRecordCountAll());
				ArrayList<QBoardDTO> list=boarddao.selectAll(cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
										cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/qboard/mainBoard.jsp").forward(request, response);
				
				
		  
			}else if(cmd.equals("/categoryList.qboard")) {
				HttpSession session=request.getSession();
				
				//받은 정보 처리하기
				String pcpage=request.getParameter("cpage");
				if(pcpage==null) {pcpage="1";}
				int cpage=Integer.parseInt(pcpage);
				
				String strcategory=String.valueOf(session.getAttribute("category"));
				//넘길 변수
				int sscategory;
				if(strcategory==null) { //세션정보 없다.
					String rcategory=request.getParameter("category");
					session.setAttribute("category", rcategory);
					sscategory=Integer.parseInt(rcategory);
				}else {//세션에 정보 있다.
					sscategory=Integer.parseInt(strcategory);
				}
				
			
				System.out.println(sscategory);
	

				
				//보낼 정보 처리하기
				request.setAttribute("cpage", cpage);
				request.setAttribute("category", sscategory);
				request.setAttribute("record_count_per_page", Static.QBOARD_RECOD_COUNT_PER_PAGE);
				request.setAttribute("navi_count_per_page", Static.QBOARD_NAVI_COUNT_PER_PAGE);
				request.setAttribute("record_total_count", boarddao.getRecordCountCategory(sscategory));
				ArrayList<QBoardDTO> list=boarddao.selectCategory(
							cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
							cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE,
							sscategory);
				request.setAttribute("list", list);
				
				
				request.getRequestDispatcher("/qboard/mainBoard.jsp").forward(request, response);
							
			}else if(cmd.equals("/selectCategoryList.qboard")) {
				//여기서 페이징 처리하고 화면에 보여줘
				
				
				
				
			}
			/*else if(cmd.equals("/select.qboard")) {
				String pcpage=request.getParameter("cpage");
				if(pcpage==null) {pcpage="1";}
				int cpage=Integer.parseInt(pcpage);
				int recordCountPerPage = Static.QBOARD_RECOD_COUNT_PER_PAGE;
	            int naviCountPerPage = Static.QBOARD_NAVI_COUNT_PER_PAGE;
	            int recordTotalCount = boarddao.getRecordCount();
	            System.out.println("1. 페이지정보" + cpage);
	            
	            String strcategory=request.getParameter("category");
	            System.out.println("2.카테고리정보" +strcategory);
	            
	            //String searchBy=request.getParameter("searchBy");
	            //System.out.println("3. 검색분류" +searchBy);
	            
	            ///String searchDetail=request.getParameter("searchDetail");
	            //System.out.println("4. 검색내용" +searchDetail);
	            
	            ArrayList<QBoardDTO> list=null;
	            if(strcategory.equals("전체")) {
	            	list=boarddao.selectAll(cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
									cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE);
	            	
	            }else if(strcategory.equals("게임문의")||strcategory.equals("제휴문의")||strcategory.equals("기타문의")){
	            	int category= boarddao.getCategory(strcategory);
	            	list=boarddao.selectCategory(
									cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE-(Static.QBOARD_RECOD_COUNT_PER_PAGE-1),
									cpage*Static.QBOARD_RECOD_COUNT_PER_PAGE,
									category);
	            }
				
				request.setAttribute("list", list);
				String json = g.toJson(new Object[] { cpage,recordCountPerPage, naviCountPerPage, recordTotalCount, list });
		        response.getWriter().write(json);
			}*/
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
