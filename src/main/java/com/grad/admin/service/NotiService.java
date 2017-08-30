package com.grad.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.NotiDao;
import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.NotiVo;

@Service
public class NotiService {
	
	@Autowired
	NotiDao notiDao;

	/**
	 * 허주한
	 */
	public List<NotiVo> getNotiList(String type) {
		
		return notiDao.getNotiList(type);
	}
	
	
	/*
	 * 정예린, 박가혜
	 */	
	public NotiVo getNoti(String tabnm, int no) {
		return notiDao.getByNo(tabnm,no);
		
	}
	
	/*
	 * 정예린
	 */
	public void insertNoti(NotiVo notiVo, String tabnm) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notiVo", notiVo);
		map.put("tabnm", tabnm);
		notiDao.insertNoti(map);		
	}

	/*
	 * 정예린
	 */

	public void updateNoti(String tabnm, NotiVo notiVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notiVo", notiVo);
		map.put("tabnm", tabnm);
		notiDao.updateNoti(map);
	}


	/*
	 * 허주한 2017/08/29
	 */
	public List<CodeVo> getCode(String type) {
		// TODO Auto-generated method stub
		String dstnct=null;
		if(type.equals("학과")) {
			dstnct="학과";
		} else if(type.equals("연구실")){
			dstnct="연구분야";
		}
		
		return notiDao.getCode(dstnct);
	}

}
