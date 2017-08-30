package com.grad.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.admin.vo.ApndngFileVo;

/*
 * 허주한
 */

@Repository
public class ApndngFileDao {

	
	@Autowired
	SqlSession sqlSession;


	public boolean insert(ApndngFileVo vo) {
		return (1==sqlSession.insert("apndngfile.insert", vo));
	}


	public ApndngFileVo getFileInfo(Long id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("apndngfile.getFileInfo", id);
	}


	public List<ApndngFileVo> getFileList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apndngfile.getFileList", map);
	}
	
}