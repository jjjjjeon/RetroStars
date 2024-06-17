//package filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// * Description : 클래스에 대한 설명을 입력해주세요.
// * Date : 2024. 6. 15.
// * History :
// *  - 작성자 : Jin, 날짜 : 2024. 6. 15., 설명 : 최초작성
// *
// * @version 1.0 
// */
//@WebFilter("/*")
//public class LoginFilter implements Filter {
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse res = (HttpServletResponse) response;
//        HttpSession session = req.getSession(false);
//        boolean loggedIn = (session != null && session.getAttribute("loginId") != null);
//
//        String[] openUrls = {
//            "/",
//            "/index.jsp",
//            "/login.member",
//            "/kakaoLogin.member",
//            "/member/login/login.jsp",
//            "/member/register/registerStart.jsp",
//            "/member/register/registerId.jsp",
//            "/member/register/registerPw.jsp",
//            "/member/register/registerEmail.jsp",
//            "/member/register/registerName.jsp",
//            "/member/register/registerComplete.jsp",
//            "/term.member",
//            "/checkUserId.member",
//            "/checkUserNickname.member"
//        };
//
//        String requestURI = req.getRequestURI();
//        String contextPath = req.getContextPath();
//        String path = requestURI.substring(contextPath.length());
//
//        boolean loginRequest = false;
//        for (String url : openUrls) {
//            System.out.println("Comparing path: " + path + " with url: " + url);
//            if (path.equals(url)) {
//                loginRequest = true;
//                break;
//            }
//        }
//        System.out.println("로그인 현재 어딘지: " + loginRequest);
//
//        String url = req.getServletPath();
//        
//        try {
//            System.out.println("## url: \t" + url);
//        } catch (Exception e) {
//            System.out.println("error : " + e);
//        }
//
//        boolean resourceRequest = req.getRequestURI().startsWith(contextPath + "/resources/") ||
//                                  req.getRequestURI().endsWith(".css") ||
//                                  req.getRequestURI().endsWith(".js") ||
//                                  req.getRequestURI().endsWith(".png") ||
//                                  req.getRequestURI().endsWith(".jpg") ||
//                                  req.getRequestURI().endsWith(".jpeg") ||
//                                  req.getRequestURI().endsWith(".gif");
//
//        if (loggedIn || loginRequest || resourceRequest) {
//            chain.doFilter(request, response);
//        } else {
//            System.out.println("Redirecting to login page: " + req.getRequestURI());
//            res.sendRedirect(contextPath + "/member/login/login.jsp");
//        }
//    }
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    @Override
//    public void destroy() {
//
//    }
//}
