package com.grad.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;

/*
 * 정예린 : admin으로 옮김
 */

@Repository
public class OrganzDao {

	@Autowired
	SqlSession sqlSession;

	/////////////////////////////////////////////////////////////////// get

	/*
	 * 허주한
	 */
	public List<OrganzVo> getOrgnzList(String type) {
		return sqlSession.selectList("organz.getOrgnzList", type);
	}

	/*
	 * 허주한 정예린 //업데이트 가져오기 완료 업데이트 수정 ***************리스트 가져오기 오류 확인
	 */
	public OrganzVo getOrgnzByNo(Map<String, Object> map) {
		if (map.get("type").equals("대학교")) {
			System.out.println("대학교");
			return sqlSession.selectOne("organz.getUniByNo", map);
		} else {
			return sqlSession.selectOne("organz.getOrgnzByNo", map);
		}

	}

	/*
	 * 허주한
	 */
	public OrganzVo getByNo(int no) {
		OrganzVo vo = sqlSession.selectOne("organz.getByNo", no);
		return vo;
	}

	/*
	 * 박가혜
	 */
	public List<OrganzVo> getOrganzLabList() {
		return sqlSession.selectList("organz.selectOrganzLabList");
	}

	/*
	 * 박가혜
	 */
	public List<ResrchAcrsltVo> getResrchList(int orgnzNo) {
		return sqlSession.selectList("organz.getResrchList", orgnzNo);
	}

	/*
	 * 박가혜
	 */
	public ResrchAcrsltVo getResrchNo(int resrchAcrsltNo) {
		return sqlSession.selectOne("organz.getResrchNo", resrchAcrsltNo);
	}

	////////////////////////////////////////////////////////////////// insert

	/*
	 * 허주한
	 */
	public boolean insertGrad(OrganzVo organzVo) {
		return (1 == sqlSession.insert("organz.insertGrad", organzVo));
	}

	/*
	 * 박가혜
	 */
	public void insertLab(OrganzVo organzVo) {
		sqlSession.insert("organz.insertLab", organzVo);
	}

	/*
	 * 박가혜
	 */
	public void insertResrch(ResrchAcrsltVo resrchAcrsltVo) {
		sqlSession.insert("organz.insertResrch", resrchAcrsltVo);
	}

	////////////////////////////////////////////////////////////////// update

	/*
	 * 허주한
	 */
	public void update(OrganzVo vo) {
		System.out.println(vo);
		sqlSession.update("organz.updateGrad", vo);
	}

	/*
	 * 박가혜
	 */
	public void updateOrganz(OrganzVo organzVo) {
		sqlSession.update("organz.updateOrganz", organzVo);
	}

	/*
	 * 박가혜
	 */
	public void updateResrch(ResrchAcrsltVo resrchAcrsltVo) {
		sqlSession.update("organz.updateResrch", resrchAcrsltVo);
	}

	////////////////////////////////////////////////////////////////// ㄱㄴㄷ페이징

	/*
	 * 허주한
	 */
	public int lastInsertId() {
		return sqlSession.selectOne("organz.lastInsertId");
	}

	/*
	 * 허주한
	 */
	public List<OrganzVo> getListByChar(Map<String, Object> map) {
		return sqlSession.selectList("organz.getListByChar", map);
	}

	///////////////////////////////////////////////////////////////// 기관 검색하기

	/*
	 * 정예린
	 */
	public List<OrganzVo> getResultList(Map<String, Object> map) {
		if (map.get("type2") != null) {
			return sqlSession.selectList("organz.getResultList2", map);

		} else {

			return sqlSession.selectList("organz.getResultList", map);
		}

	}
	
	/*
	 * 허주한 2017/08/29
	 */
	public List<CodeVo> getCode(String dstnct) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("organz.getCode", dstnct);
	}

}
