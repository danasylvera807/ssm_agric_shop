package com.group3.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    private String[] urls = new String[]{
            ".js",".css",".png",".jpg",".jpeg","login","startup","captcha","Login","register"
    };
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String url = request.getRequestURI();
        boolean r = false;
        for (String u :
                urls) {
            if (url.contains(u)){
//                System.out.println(url+"====contains=====>  "+u);
                r = true;
                break;
            }else{
//                System.out.println(url+"====does not contain=====>  "+u);
            }
        }
        if(r){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            if((request.getSession().getAttribute("user") == null)){
                HttpServletResponse response = (HttpServletResponse) servletResponse;
                response.sendRedirect(request.getContextPath()+"/login.do");
            }else{
                filterChain.doFilter(servletRequest,servletResponse);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
