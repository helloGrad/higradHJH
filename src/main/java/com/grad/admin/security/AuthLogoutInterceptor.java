package com.grad.admin.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.grad.admin.service.*;


public class AuthLogoutInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private MemberService MemberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(true);
		
		session.removeAttribute("authUser");
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/user/login");

		return false;
	}

}
