/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package filter;

import java.io.IOException;
import java.util.Date;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
/**
 * Description : 로깅용 필터.
 * Date : 2024. 6. 15.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 15., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
@WebFilter("/*")
public class LoggingFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println("Incoming request: " + req.getMethod() + " " + req.getRequestURI() + " at " + new Date());
        chain.doFilter(request, response);
        System.out.println("Outgoing response: " + req.getMethod() + " " + req.getRequestURI() + " at " + new Date());
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void destroy() {
    }
}