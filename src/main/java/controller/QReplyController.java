package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.QReplyDAO;
import dto.QReplyDTO;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 12.
 * History :
 *  - 작성자 : Sam, 날짜 : 2024. 6. 17., 설명 : 최초작성
 *
 * @author : Sam
 * @version 1.0 
 */

@WebServlet("*.qreply")
public class QReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		Gson g=new Gson();
		
		request.setCharacterEncoding("UTF-8");
		String cmd=request.getRequestURI();
		System.out.println(cmd);
		QReplyDAO replydao=QReplyDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.qreply")) {
				String loginId=request.getParameter("loginId");
				String comment=request.getParameter("comment");
				int qBoardSeq=Integer.parseInt(request.getParameter("qBoardSeq"));
				System.out.println(loginId+comment+ qBoardSeq);
				QReplyDTO qdto=replydao.insert(new QReplyDTO(0,qBoardSeq,loginId,comment,null));
				System.out.println(qdto);
				PrintWriter pw=response.getWriter();
				pw.append(g.toJson(qdto));
				
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
