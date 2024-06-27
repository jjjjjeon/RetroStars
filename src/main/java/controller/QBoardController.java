package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Static;
import dao.MemberDAO;
import dao.QBoardDAO;
import dao.QFileDAO;
import dto.QBoardDTO;
import dto.QFileDTO;

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
		QFileDAO filedao=QFileDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.qboard")){
				//파일전송
				int maxSize=1024*1024*10; //10메가 사이즈 용량제한
				String realPath=request.getServletContext().getRealPath("qfiles");	//파일 저장 위치
				System.out.println(realPath);
				File uploadPath=new File(realPath); //파일인스턴스로 생성해 단순 문자열이 아닌 컨트롤할 수 있도록 변경
				if(!uploadPath.exists()) {
					uploadPath.mkdir(); //파일 업로드 폴더가 존재하지 않을 경우 직접 생성하는 코드
				}
				
				MultipartRequest multi=new MultipartRequest(request, realPath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				String loginId=(String)request.getSession().getAttribute("loginId");
				String boardWriterNicname=multi.getParameter("boardWriterNicname");
				String strqBoardCategory=multi.getParameter("qBoardCategory");
				int intqBoardCategory= boarddao.getCategory(strqBoardCategory);
				String qBoardTitle= multi.getParameter("qBoardTitle");
				String qBoardContent= multi.getParameter("qBoardContent");
				String qBoardSecret=boarddao.getSecretYN(multi.getParameter("qBoardSecret")) ;
				
				//System.out.println("전체"+loginId+intqBoardCategory+qBoardTitle+qBoardContent+qBoardSecret);	
				int parent_seq=boarddao.insert(new QBoardDTO(0,loginId,intqBoardCategory,qBoardTitle,qBoardContent,null,"N",qBoardSecret));
				String oriName=multi.getOriginalFileName("file"); //업로드 당시 파일 이름
				String sysName=multi.getFilesystemName("file"); //저장된 파일 이름
				if(oriName!=null) {
					filedao.insert(new QFileDTO(0,oriName,sysName,parent_seq));
				}
				
				response.sendRedirect("/list.qboard");
				
			}else if(cmd.equals("/list.qboard")) {
				String loginId=(String)request.getSession().getAttribute("loginId");
				boolean isAdmin=false;
				if(!(loginId==null)) {
					isAdmin=memberdao.isAdmin(loginId);
				}
				
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
				request.setAttribute("isAdmin", isAdmin);
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
				boolean isAdmin=memberdao.isAdmin(loginId);
				String loginnickname=memberdao.getNickname(loginId);
				HashMap<String,?> dto=boarddao.selectcontent(seq);
				QFileDTO file=filedao.selectByParentSeq(seq);
				
				request.setAttribute("file", file);
				request.setAttribute("dto", dto);
				request.setAttribute("loginId", loginId);
				request.setAttribute("isAdmin", isAdmin);
				request.setAttribute("loginnickname", loginnickname);
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
				request.setAttribute("seq", seq);
				request.getRequestDispatcher("/detail.qboard").forward(request, response);
				
			}else if(cmd.equals("/gowrite.qboard")) {
				//닉네임처리
				String loginId=(String)request.getSession().getAttribute("loginId");
				String nickname=memberdao.getNickname(loginId);
				
				request.setAttribute("nickname", nickname);
				request.getRequestDispatcher("/qboard/writeBoard.jsp").forward(request, response);
				
			}else if(cmd.equals("/selectAnswer.qboard")) {
				String strselected=request.getParameter("selected");
				int qBoardSeq= Integer.parseInt(request.getParameter("qBoardSeq"));
				System.out.println(strselected+qBoardSeq);
				int result=boarddao.updateAnswer(qBoardSeq, strselected);
				response.sendRedirect("/list.qboard");
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
