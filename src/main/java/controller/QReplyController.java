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
import com.google.gson.JsonObject;

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
				
			}else if(cmd.equals("/select.qreply")) {
				//받은 정보
				int qBoardSeq=Integer.parseInt(request.getParameter("qBoardSeq"));
				String loginId=(String)request.getSession().getAttribute("loginId"); 
	
				//보낼 정보
				PrintWriter pw=response.getWriter();
				ArrayList<QReplyDTO> replylist=replydao.selectAll();
				
				//직렬화
				JsonObject obj=new JsonObject();
				obj.addProperty("loginId", loginId);
				obj.add("replylist", g.toJsonTree(replylist)); //이게 뭘까?
				String result=g.toJson(obj);
				pw.append(result);
				
			}else if(cmd.equals("/delete.qreply")) {
				int replyseq=Integer.parseInt(request.getParameter("replyseq"));
				int boardseq=Integer.parseInt(request.getParameter("boardseq"));
				System.out.println(replyseq);
				int result=replydao.deleteBySeq(replyseq);
				request.getRequestDispatcher("/detail.qboard?seq="+boardseq).forward(request, response);
				
			}else if(cmd.equals("/update.qreply")) {
				int replyseq=Integer.parseInt(request.getParameter("replyseq"));
				int boardseq=Integer.parseInt(request.getParameter("boardseq"));
				String replycontent=request.getParameter("replycontent");
				System.out.println(replycontent);
				int result=replydao.updateBySeq(replyseq, replycontent);
				request.getRequestDispatcher("/detail.qboard?seq="+boardseq).forward(request, response);
				
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
