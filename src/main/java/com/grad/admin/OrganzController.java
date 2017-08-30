package com.grad.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.grad.admin.security.Auth;
import com.grad.admin.service.ApndngFileService;
import com.grad.admin.service.OrganzService;
import com.grad.admin.vo.ApndngFileVo;
import com.grad.admin.vo.CodeForm;
import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;

@Controller
@RequestMapping("/organz")
public class OrganzController {

	@Autowired
	OrganzService organzService;

	@Autowired
	ApndngFileService apndngFileService;

	//////////////////////////////////////////////////////////////////////// get

	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/unilist")
	public String uniList(Model model) {

		model.addAttribute("list", organzService.getOrgnzList("대학교"));
		return "/organz/list";
	}

	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping({ "/list", "/gradlist" })
	public String gradList(Model model) {

		model.addAttribute("list", organzService.getOrgnzList("대학원"));
		return "/organz/list";
	}

	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/deptlist")
	public String deptList(Model model) {

		model.addAttribute("list", organzService.getOrgnzList("학과"));
		return "/organz/list";
	}

	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/lablist") // 연구실 리스트
	public String lablist(Model model) {

		model.addAttribute("list", organzService.getOrganzLabList());

		return "organz/list";
	}

	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/resrchlist") // 연구실적리스트
	public String resrchlist(Model model, @RequestParam(value = "no", required = true, defaultValue = "") int orgnzNo) {

		List<ResrchAcrsltVo> resrchAcrsltList = organzService.getResrchList(orgnzNo);
		model.addAttribute("resrchAcrsltList", resrchAcrsltList);

		return "organz/resrchlist";
	}


	/////////////////////////////////////////////////////////////////////// insert

	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/insertform")
	public String insertGradForm(Model model, @RequestParam String type) {

		if (type.equals("대학원") || type.equals("대학교") || type.equals("학과")) {
			return "/organz/insertgrad";
		} else {
			return "organz/insertlab";
		}

	}

	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertGrad(Model model, @ModelAttribute OrganzVo organzVo,
			@RequestParam(value = "prntsOrgnzStr", required = true, defaultValue = "") String prntsOrgnzStr,
			@ModelAttribute ResrchAcrsltVo resrchAcrsltVo, 
			@RequestParam (value = "tabnm", required = true, defaultValue = "") String tabnm, 
			@RequestParam(value = "attachFile", required = false) MultipartFile[] attachFile, @ModelAttribute("codeForm") CodeForm codeForm) {
		
		int lastId = 0;
		ApndngFileVo vo = null;
//		System.out.println(codeForm.getCodes().get(0));
		
		System.out.println(organzVo.getOrgnzDstnct()+"----"+resrchAcrsltVo);

		if (organzVo.getOrgnzDstnct().equals("연구실")) {

			System.out.println("연구실적 입력");
			if (resrchAcrsltVo.getResrchText() == null) { // 연구실입력인 경우
				organzService.insertLab(organzVo);
				lastId = organzService.lastInsertId();
			}

			if (organzVo.getOrgnzNm() == null) { // 연구실적입력인 경우
				System.out.println("연구실적 입력");
				organzService.insertResrch(resrchAcrsltVo);
			}

		} else {
			organzService.insert(organzVo, prntsOrgnzStr);
			lastId = organzService.lastInsertId();

		}
		
		if(attachFile != null) {
			for(int i=0;i<attachFile.length;i++) {

				if(!attachFile[i].isEmpty()) {
					apndngFileService.restore(attachFile[i]);
					vo = apndngFileService.getFileVo();
					vo.setPrntsDstnct(organzVo.getOrgnzDstnct());
					vo.setPrntsNo(lastId);
					apndngFileService.insert(vo);
				}
			}
		}

		return "redirect:/organz/list";
	}

	////////////////////////////////////////////////////////////////////// update
	
	
	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/updateform")
	public String updateGradForm(Model model, @RequestParam int no, @RequestParam String type) {

		/*
		 * 박가혜
		 */
		if (type.equals("연구실")) {

			model.addAttribute("organzLabList", organzService.getOrganz(no));
			return "organz/labupdatedetail";

		} else {

			model.addAttribute("vo", organzService.getOrgnzByNo(no, type));

			System.out.println(apndngFileService.getFileList(no, type));
			model.addAttribute("fileList", apndngFileService.getFileList(no, type));
			return "organz/updategrad";

		}
	}	
	
	/*
	 * 허주한
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateGrad(Model model, @ModelAttribute OrganzVo organzVo, @RequestParam String type,
			@RequestParam(value = "prntsOrgnzStr", required = true, defaultValue = "") String prntsOrgnzStr) {
		/*
		 * 박가혜
		 */
		System.out.println(type);
		if (type.equals("연구실")) {

			organzService.updateOrganz(organzVo);
			return "redirect:/organz/lablist";

		} else {
			organzService.update(organzVo, type, prntsOrgnzStr);
			return "redirect:/organz/list";
		}
	}
	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping("/resrchdetail") // 연구실적 수정폼
	public String resrchdetail(Model model,
			@RequestParam(value = "no", required = true, defaultValue = "") int resrchAcrsltNo) {

		ResrchAcrsltVo resrchAcrsltVo = organzService.getResrchNo(resrchAcrsltNo);
		model.addAttribute("resrchAcrsltVo", resrchAcrsltVo);

		return "organz/resrchupdate";
	}	
	
	/*
	 * 박가혜
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/resrchupdate", method = RequestMethod.POST) // 연구실적 수정폼
	public String resrchupdate(Model model, @ModelAttribute ResrchAcrsltVo resrchAcrsltVo) {

		organzService.updateResrch(resrchAcrsltVo);
		return "redirect:/organz/lablist";
	}


	//////////////////////////////////////////////////////////////////////// 기관 검색하기
	
	/*
	 * 정예린 기관 검색하기 기능
	 */
	@Auth(role = Auth.Role.ADMIN)
	@RequestMapping(value = "/search")
	public String search(@RequestParam(value = "stext", required = true, defaultValue = "**") String stext,
			@RequestParam(value = "type", required = true, defaultValue = "") String type, Model model) {

		System.out.println(stext);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("연구실 기관 update : "+type);
		map.put("type", type);
		map.put("stext", stext);
		
		
		if(type.equals("연구실업데이트")) {
			map.put("type2","대학원");
			map.put("type", "학과");
		}

		
		model.addAttribute("list", organzService.getResultList(map));
		return "/organz/search";
	}

}
