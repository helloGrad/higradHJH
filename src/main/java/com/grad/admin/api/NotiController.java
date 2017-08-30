package com.grad.admin.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.admin.dto.JSONResult;
import com.grad.admin.service.NotiService;

@Controller("notiAPIController")
@RequestMapping("/noti/api")
public class NotiController {
	
	@Autowired
	NotiService notiService;
	
	/*
	 * 허주한 2017/08/29
	 */
	@ResponseBody
	@RequestMapping(value = "/getcode")
	public JSONResult getCode(@RequestParam String type) {
		return JSONResult.success(notiService.getCode(type));

	}
}
