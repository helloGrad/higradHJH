package com.grad.admin.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grad.admin.dto.JSONResult;
import com.grad.admin.service.OrganzService;
import com.grad.admin.vo.OrganzVo;

@Controller("orgnzAPIController")
@RequestMapping("/organz/api")
public class OrganzController {

	@Autowired
	OrganzService organzService;

	@ResponseBody
	@RequestMapping(value = "/getlist")
	public JSONResult getList(@RequestParam("type") String type, @RequestParam("start") String start,
			@RequestParam("end") String end) {

		List<OrganzVo> list = organzService.getListByChar(type, start, end);
		return JSONResult.success(list);

	}

	/*
	 * 허주한 2017/08/29
	 */
	@ResponseBody
	@RequestMapping(value = "/getcode")
	public JSONResult getCode(@RequestParam String type) {
		return JSONResult.success(organzService.getCode(type));

	}
	
	@ResponseBody
	@RequestMapping(value = "/getcode2")
	public JSONResult getCode2(@RequestParam String type) {
		return JSONResult.success(organzService.getCode(type));

	}

}
