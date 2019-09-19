package com.amiko.ymd.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
        HttpSession session = request.getSession();
//        LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");
         String id = (String) session.getAttribute("id");
 

        if(id != null){
            response.sendRedirect("/ymd/home");
            return false;
        }

        
        return true;
    }
 
}