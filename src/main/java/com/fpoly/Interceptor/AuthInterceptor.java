package com.fpoly.Interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fpoly.Entity.Users;
import com.fpoly.Untils.Session;


@Service
public class AuthInterceptor implements HandlerInterceptor{
	@Autowired
	Session session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Users us = session.get("user");
		String error="";
		if(us==null) {
			error = "Please login!";
		}else if (us.getAdmin()==2 && uri.startsWith("/index")) {
			error ="Access denied";
		}
		if(error.length()>0) {
			session.set("security-uri",uri);
			response.sendRedirect("/login?error="+error);
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
