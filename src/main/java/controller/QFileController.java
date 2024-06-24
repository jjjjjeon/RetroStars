package controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QFileDAO;

/**
 * Servlet implementation class QFileController
 */
@WebServlet("*.qfile")
public class QFileController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			QFileDAO filedao=QFileDAO.getInstance();
			String cmd=request.getRequestURI();
			
			if(cmd.equals("/download.qfile")) {
				String filepath=request.getServletContext().getRealPath("qfiles"); //HDD위치 확보
				String sysname=request.getParameter("sysname");//파일 이름 확보
				String oriname=request.getParameter("oriname");
				
				oriname=new String(oriname.getBytes("UTF8"), "ISO-8859-1");
				response.reset();
				response.setHeader("Content-Disposition", "attachment;filename=\""+oriname+"\""); //내가 너한테 보내는건 attachment=첨부파일이야
				
				File target=new File(filepath+"/"+sysname); //완전 경로 만들기
				byte[] fileContents = new byte[(int)target.length()];//HDD에 저장할 배열 준비
				
				try(FileInputStream fis=new FileInputStream(target);//HDD 연결
					DataInputStream dis=new DataInputStream(fis);//타켓파일에 스트림 연결
					ServletOutputStream sos= response.getOutputStream(); //클라이언트에게 데이터를 보낼 수 있는 스트림 개발
					){
					dis.readFully(fileContents); //RAM으로 복사
					sos.write(fileContents);//파일 내용 전송
					sos.flush();
				}
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
