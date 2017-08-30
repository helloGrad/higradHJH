package com.grad.admin.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
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
			
//			String accept = request.getHeader("accept");			//������ Ŭ���̾�Ʈ�� ������ ������ ���ؼ� �Ѱ���
//			if(accept.matches(".*application/json.*")){
//				//�轼 ���̺귯���� ����Ͽ� �޼��������ͷ� json���·� ����
//				//response.getOutputStream().write("{'result':'fail', 'message':'fail', 'data':{no:0}}");
//			} else {
//				response.sendRedirect(request.getContextPath()+"/login?result=fail");
//			}
			
			System.out.println(request.getContextPath());
			response.sendRedirect(request.getContextPath()+"/user/login?result=fail");
			return false;
		}		
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("authUser", memberVo);
		response.sendRedirect(request.getContextPath()+"/");
		
		return false;
	}	

}
