package com.grad.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.MemberDao;
import com.grad.admin.vo.MemberVo;



/*
 * 정예린, 박가혜
 */	

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;

	public void register(MemberVo memberVo) {
		memberDao.insert(memberVo);

	}


	public MemberVo getUser(String iden, String pw) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iden", iden);
		map.put("pw", pw);

		return memberDao.getUser(map);

	}

	public boolean existEamil(String IDEN) {
		MemberVo memberVo = memberDao.getByIden(IDEN);
		return memberVo != null;
	}


}
