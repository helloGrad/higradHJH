package com.grad.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.NotiDao;
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

}
