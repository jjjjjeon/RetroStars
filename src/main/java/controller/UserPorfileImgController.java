package controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.UserProfileImgDAO;
import dto.UserProfileImgDTO;

@WebServlet("*.userprofileimg")
public class UserPorfileImgController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		UserProfileImgDAO imgDao = UserProfileImgDAO.getInstance();
		HttpSession session = request.getSession();
		
		try {
			if(cmd.equals("/upload.userprofileimg")) {
				
				session = request.getSession();
				String id = (String)session.getAttribute("loginId");
				
				int maxSize = 1024 * 1024 * 100;
				
				// 실제 경로
				 String filePath = "C:\\workspace\\profileImg";
				 File downloadFile = new File(filePath);
				 
				 if (!downloadFile.exists()) {
					  downloadFile.mkdir();
			        }
				 
				 MultipartRequest multi = new MultipartRequest(request, filePath, maxSize,"UTF8", new DefaultFileRenamePolicy());
				 Enumeration<String> names = multi.getFileNames();
				 
				 while(names.hasMoreElements()) {						
							String name = names.nextElement();
							String oriname = multi.getOriginalFileName(name); // 원본 파일 이름
							String sysname = multi.getFilesystemName(name); // 서버에 저장되었을 때 이름 (중복시 라벨링 된 이름)						
							if(oriname != null) {
								imgDao.updateImg(new UserProfileImgDTO(0,id,oriname,sysname));
								}
						}
				 
					//세션 프로필 갱신 by 조진혁
	             String updatedProfileUrl = imgDao.selectMyUrl(id);
	             session.setAttribute("userProfileUrl", updatedProfileUrl);
				 request.getRequestDispatcher("/member/mypage/close.jsp").forward(request, response);
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
