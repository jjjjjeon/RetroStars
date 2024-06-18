package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CReplyDAO;
import dao.MemberDAO;
import dto.CReply2DTO;
import dto.CReplyDTO;

@WebServlet("*.reply")
public class CReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CReplyDAO manager = CReplyDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("get:" + cmd);
		Gson g = new Gson();
		
		try {
			//유저게시판 글의 댓글 목록을 json으로 클라이언트에게 반환.
			if(cmd.equals("/viewReple.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				List<CReply2DTO> repleList = manager.viewRepleList(seq);
				
				String result = g.toJson(repleList);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pw = response.getWriter();
				pw.append(result);
				
			//유저게시판 글의 대댓글 목록을 json으로 클라이언트에게 반환.
			}else if(cmd.equals("/viewRepleReple.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				List<CReply2DTO> replerepleList = manager.viewRepleRepleList(seq);
				
				String result = g.toJson(replerepleList);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pw = response.getWriter();
				pw.append(result);
				
			//유저게시판 글의 댓글 삭제.
			}else if(cmd.equals("/delReple.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				manager.delReple(seq);
				manager.delRepleChildren(seq);
			
			//유저게시판 글의 대댓글 삭제.
			}else if(cmd.equals("/delRepleReple.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				manager.delReple(seq);
				
			//유저게시판 글의 총 댓글 수 반환.
			}else if(cmd.equals("/countRepleList.reply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String result = "" + manager.countRepleList(seq);
				
				PrintWriter pw = response.getWriter();
				pw.append(result);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CReplyDAO rManager = CReplyDAO.getInstance();
		MemberDAO mManager = MemberDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("post:" + cmd);
		Gson g = new Gson();
		
		try {
			//유저게시판 글에 댓글 추가.
			if (cmd.equals("/addReple.reply")) {
				String id = (String) request.getSession().getAttribute("loginId");

				int parentSeq = Integer.parseInt(request.getParameter("parentSeq"));
				String content = request.getParameter("content");

				CReplyDTO rpl = new CReplyDTO(0, parentSeq, id, content, null, 0);
				rManager.addReple(rpl);
				
				CReply2DTO addedReple = rManager.viewReple(id, parentSeq, 0);
				
				String result = g.toJson(addedReple);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pw = response.getWriter();
				pw.append(result);
				
			//유저게시판 글의 댓글에 답글 추가.
			}else if(cmd.equals("/addReplyReply.reply")) {
				String id = (String) request.getSession().getAttribute("loginId");
				int boardSeq = Integer.parseInt(request.getParameter("parentBoardSeq"));
				int replySeq = Integer.parseInt(request.getParameter("parentReplySeq"));
				String content = request.getParameter("content");
				
				CReplyDTO rerpl = new CReplyDTO(0, boardSeq, id, content , null, replySeq);
				rManager.addReplyReply(rerpl);
				
				CReply2DTO addedReReple = rManager.viewReple(id, boardSeq, replySeq);
				
				String result = g.toJson(addedReReple);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pw = response.getWriter();
				pw.append(result);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
