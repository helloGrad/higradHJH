package com.grad.admin.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.admin.dto.JSONResult;
import com.grad.admin.service.MemberService;
import com.grad.admin.service.OrganzService;
import com.grad.admin.vo.MemberVo;
import com.grad.admin.vo.OrganzVo;

@Controller("memberAPIController")
@RequestMapping("/user/api")
public class MemberController {

	@Autowired
	MemberService memberService;

	
	/*
	 * 허주한 2017/09/02
	 */
	@ResponseBody
	@RequestMapping(value = "/checklogin" , method = RequestMethod.POST)
	public JSONResult getList(@RequestParam("iden") String iden, @RequestParam("pw") String pw) {

		try {
			if(memberService.getUser(iden, pw)==null) {
				return JSONResult.success(false);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return JSONResult.success(true);

	}
	
	@ResponseBody
	@RequestMapping(value = "/setsession" , method = RequestMethod.POST)
	public JSONResult setSession(HttpServletRequest request, HttpServletResponse response,@RequestParam("iden") String iden, @RequestParam("pw") String pw) {

		
		System.out.println(iden+" "+pw);
		MemberVo memberVo = null;
		try {
			memberVo = memberService.getUser(iden, pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession(true);
		
		session.setAttribute("authUser", memberVo);
//		response.sendRedirect(request.getContextPath()+"/");
		System.out.println("세션등록");
		
		return JSONResult.success(true);

	}


}
