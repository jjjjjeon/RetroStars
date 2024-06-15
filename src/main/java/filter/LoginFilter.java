/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 15.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 15., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
@WebFilter("/*")
public class LoginFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("loginId") != null);
        boolean loginRequest = req.getRequestURI().equals("/index.jsp") || 
        					   req.getRequestURI().equals("/login.member") || 
                               req.getRequestURI().equals("/kakaoLogin.member") || 
                               req.getRequestURI().equals("/member/login/login.jsp") || 
                               req.getRequestURI().equals("/member/register/registerStart.jsp") ||
                               req.getRequestURI().equals("/member/register/registerId.jsp") ||
                               req.getRequestURI().equals("/member/register/registerPw.jsp") ||
                               req.getRequestURI().equals("/member/register/registerEmail.jsp") ||
                               req.getRequestURI().equals("/member/register/registerName.jsp") ||
                               req.getRequestURI().equals("/member/register/registerComplete.jsp");

//        String url = req.getServletPath();
//        
//        try {
//            System.out.println("## url: \t" + url);
//        } catch (Exception e) {
//            System.out.println("error : " + e);
//        }

        boolean resourceRequest = req.getRequestURI().startsWith("/resources/") ||
                                  req.getRequestURI().endsWith(".css") ||
                                  req.getRequestURI().endsWith(".js") ||
                                  req.getRequestURI().endsWith(".png") ||
                                  req.getRequestURI().endsWith(".jpg") ||
                                  req.getRequestURI().endsWith(".jpeg") ||
                                  req.getRequestURI().endsWith(".gif");

        if (loggedIn || loginRequest || resourceRequest) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect("/member/login/login.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 초기화 코드가 필요한 경우 여기에 추가합니다.
    }

    @Override
    public void destroy() {
        // 필터가 해제될 때 필요한 정리 작업이 있으면 여기에 추가합니다.
    }
}
