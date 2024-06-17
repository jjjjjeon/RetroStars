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
				// 파일 최대 사이즈 10MB로 제한
				
				session = request.getSession();
				String id = (String)session.getAttribute("loginId");
				
				int maxSize = 1024 * 1024 * 1;
				String fileSavePath = "/upload/profile"; // 웹 경로
                
                // 실제 파일 시스템 경로 가져오기
                String realPath = request.getServletContext().getRealPath(fileSavePath);
                System.out.println("Real Path: " + realPath); // 실제 경로 확인
                
                 //실제 경로가 null이 아닌지 확인
                if (realPath == null) {
                    throw new IOException("Real path not found");
                }
                
                File uploadDir = new File(realPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // 디렉토리 생성
                }
				
				MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,"UTF8", new DefaultFileRenamePolicy());
				
				Enumeration<String> names = multi.getFileNames();
				
				while(names.hasMoreElements()) {
				
					String name = names.nextElement();
					String oriname = multi.getOriginalFileName(name); // 원본 파일 이름
					String sysname = multi.getFilesystemName(name); // 서버에 저장되었을 때 이름 (중복시 라벨링 된 이름)
				
					if(oriname != null) {imgDao.insertImg(new UserProfileImgDTO(0,id,oriname,sysname));}
				}
				request.getRequestDispatcher("/updateList.member").forward(request, response);
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
