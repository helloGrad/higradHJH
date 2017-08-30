package com.grad.admin.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.grad.admin.vo.MemberVo;



public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if (handler instanceof HandlerMethod == false) {

			return true;
		}

		Auth auth = ((HandlerMethod) handler).getMethodAnnotation(Auth.class);

		if (auth == null) {

			auth = ((HandlerMethod) handler).getMethod().getDeclaringClass().getAnnotation(Auth.class);
			if (auth == null) {

				return true;
			}

		}

		HttpSession session = request.getSession();

		if (session == null) {

			response.sendRedirect(request.getContextPath() + "/user/login");
			return false;
		}

		if (session.getAttribute("authUser") == null) {

			response.sendRedirect(request.getContextPath() + "/user/login");
			return false;

		}

		Auth.Role role = auth.role();
		MemberVo vo = (MemberVo) session.getAttribute("authUser");

		if (role == Auth.Role.ADMIN && vo.getMbDstnct().equals("관리자") == false) {

			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}

		return true;
	}

}