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
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Description : XSS 공격 방지 필터.
 * Date : 2024. 6. 15.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 15., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
@WebFilter("/*")
public class XSSFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        chain.doFilter(new XSSRequestWrapper((HttpServletRequest) request), response);
    }
    
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void destroy() {
    }

    private static class XSSRequestWrapper extends HttpServletRequestWrapper {
        public XSSRequestWrapper(HttpServletRequest servletRequest) {
            super(servletRequest);
        }

        @Override
        public String getParameter(String name) {
            String value = super.getParameter(name);
            return sanitize(value);
        }

        @Override
        public String[] getParameterValues(String name) {
            String[] values = super.getParameterValues(name);
            if (values != null) {
                int length = values.length;
                String[] sanitizedValues = new String[length];
                for (int i = 0; i < length; i++) {
                    sanitizedValues[i] = sanitize(values[i]);
                }
                return sanitizedValues;
            }
            return null;
        }

        private String sanitize(String value) {
            if (value != null) {
                value = value.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
                value = value.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
                value = value.replaceAll("'", "&#39;");
                value = value.replaceAll("eval\\((.*)\\)", "");
                value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
                value = value.replaceAll("script", "");
            }
            return value;
        }
    }
}
