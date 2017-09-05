package com.grad.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.grad.admin.security.Auth;



@Controller
public class HomeController {
	/*
	 * 정예린
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping("/test")
	public String testPage() {
		
		return "testView";
	}
	
}
