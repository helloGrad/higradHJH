package com.grad.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grad.admin.security.Auth;
import com.grad.admin.security.AuthUser;
import com.grad.admin.service.MemberService;
import com.grad.admin.vo.MemberVo;


/*
 * 정예린,박가혜
 */	
@Controller
@RequestMapping("/user")
public class MemberController {

	@Autowired
	MemberService memberService;


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

		System.out.println("login main");
		return "login";
	}
 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String register(@ModelAttribute MemberVo memberVo) {

		System.out.println(memberVo.getEmail() + " " + memberVo.getPw() + " " + memberVo.getNknm());
		memberService.register(memberVo);

		return "redirect:/user/login";
	}


	/////////////////////////////// mypage 세션 확인 ///////////////////////////////////
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model,@AuthUser MemberVo authUser) {
		System.out.println(authUser.getMbDstnct());
		return "mypage";
	}

}
