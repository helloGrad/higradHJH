package com.grad.admin.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.grad.admin.service.MemberService;
import com.grad.admin.vo.MemberVo;



public class AuthLoginInterceptor extends HandlerInterceptorAdapter {	

	@Autowired
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {		
		
		String iden = request.getParameter("iden");
		String pw=request.getParameter("pw");		
		System.out.println(iden+" "+pw);
		
		MemberVo memberVo=  memberService.getUser(iden, pw);
		
		if( memberVo == null){
			
//			response.sendRedirect(request.getContextPath()+"/user/login?result=fail");
			return false;
		}		
		
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("authUser", memberVo);
//		response.sendRedirect(request.getContextPath()+"/");
		System.out.println("세션등록");
		
		return true;
	}	

}
