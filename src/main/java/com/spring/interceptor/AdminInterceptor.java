package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	
	@Override
	 public boolean preHandle(HttpServletRequest req,
	    HttpServletResponse res, Object handler) throws Exception {
		
		HttpSession session = req.getSession();
		
		
		Object obj = session.getAttribute("userId");
		
		  
		if(obj == null) {
			res.sendRedirect("/model/user_login.do");
			return false;
		}
		
		if(obj != null && !("admin1".equals(obj) )) {
			res.sendRedirect("/model/");
			return false;
		}

		  return true;
		 }

}
