package com.grad.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.admin.security.Auth;
import com.grad.admin.service.NotiService;
import com.grad.admin.vo.NotiVo;

@Controller
@RequestMapping("/noti")
public class NotiController {

	@Autowired
	NotiService notiService;

	/**
	 * 허규준
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String notiAllList(Model model) {
		model.addAttribute("notiList", notiService.getNotiList("%"));
		return "/noti/list";
	}

	/**
	 * 허규준
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/grad", method = RequestMethod.GET)
	public String notiGradList(@RequestParam(value = "page", required = true, defaultValue = "1") int page,
			Model model) {
		model.addAttribute("notiList", notiService.getNotiList("대학원"));
		return "/noti/gradlist";
	}

	/**
	 * 허규준
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/lab", method = RequestMethod.GET)
	public String notiLabList(Model model) {
		model.addAttribute("notiList", notiService.getNotiList("연구실"));
		return "/noti/lablist";
	}
	
	/*
	 * 정예린
	 */	
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping("/insert")
	public String insertNoti() {

		return "noti/insert";		
	}	
	
	/*
	 * 정예린
	 */	
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/insert" , method = RequestMethod.POST)
	public String insertNoti(@ModelAttribute NotiVo notiVo,						
			@RequestParam String tabnm) {
		notiService.insertNoti(notiVo, tabnm);
		return "redirect:/noti/insert";		
	}
	
	/*
	 * 정예린, 박가혜
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping("/update")
	public String notiDetail(@RequestParam("no") int no, 
			@RequestParam("tabnm") String tabnm, 
			Model model) {

		model.addAttribute("vo", notiService.getNoti(tabnm, no));
		if (tabnm.equals("대학원")) {
			tabnm = "grad";
		} else if (tabnm.equals("연구실")) {
			tabnm = "lab";
		}
		
		return "/noti/update"+ tabnm;
	}
	
	/*
	 * 정예린
	 */
	@Auth(role=Auth.Role.ADMIN) 
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String notiDetail(@ModelAttribute NotiVo notiVo,
			@RequestParam("tabnm") String tabnm) {

		notiService.updateNoti(tabnm, notiVo);		
		
		return "redirect:/noti/list";
	}
	



	

}
