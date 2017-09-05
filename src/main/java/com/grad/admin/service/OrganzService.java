package com.grad.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grad.admin.repository.OrganzDao;
import com.grad.admin.vo.CodeForm;
import com.grad.admin.vo.CodeVo;
import com.grad.admin.vo.OrganzVo;
import com.grad.admin.vo.ResrchAcrsltVo;

@Service
public class OrganzService {

	@Autowired
	OrganzDao organzDao;

	///////////////////////////////////////////////////////////////// get

	/*
	 * 허주한 대학교 대학원 학과 list가져오기
	 */
	public List<OrganzVo> getOrgnzList(String type) {
		return organzDao.getOrgnzList(type);
	}

	/*
	 * 허주한 대학교 대학원 학과 no로 한 건 가져오기
	 */
	public OrganzVo getOrgnzByNo(int no, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("no", no);
		return organzDao.getOrgnzByNo(map);
	}

	/*
	 * 박가혜 연구실 no로 한 건 가져오기
	 */
	public OrganzVo getOrganz(int no) {
		return organzDao.getByNo(no);
	}

	/*
	 * 박가혜 연구실 목록
	 */
	public List<OrganzVo> getOrganzLabList() {
		return organzDao.getOrganzLabList();
	}

	/*
	 * 박가혜 연구실 별 연구실적
	 */
	public List<ResrchAcrsltVo> getResrchList(int orgnzNo) {

		return organzDao.getResrchList(orgnzNo);
	}

	/*
	 * 박가혜 연구실 별 연구실적 -> 연구실적 한 건 가져오기
	 */
	public ResrchAcrsltVo getResrchNo(int resrchAcrsltNo) {

		return organzDao.getResrchNo(resrchAcrsltNo);
	}

	/*
	 * 박가혜 연구실 맞춤정보 리스트 가져오기 2017-08-29
	 */

	public List<CodeVo> getOrganzInfo(int orgnzNo) {
		return organzDao.selectOrganzInfo(orgnzNo);
	}

	/*
	 * 정예린 학과 맞춤정보 리스트 가져오기 2017-08-31
	 */

	public List<CodeVo> getOrganzInfo(int no, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("type", type);
		return organzDao.selectOrganzInfo(map);
	}

	/////////////////////////////////////////////// insert
	/////////////////////////////////////////////// ////////////////////////////////////////

	/*
	 * 허주한 대학원, 대학교, 학과
	 */
	public boolean insert(OrganzVo organzVo, String prntsOrgnzStr) {
		if (prntsOrgnzStr.isEmpty() || prntsOrgnzStr.equals(null)) {
			organzVo.setPrntsOrgnzNo(-1);
		} else {
			organzVo.setPrntsOrgnzNo(Integer.parseInt(prntsOrgnzStr));
		}

		if (organzVo.getOrgnzDstnct().equals("대학원") || organzVo.getOrgnzDstnct().equals("학과")
				|| organzVo.getOrgnzDstnct().equals("대학교")) {
			return organzDao.insertGrad(organzVo);
		}
		return false;
	}

	/*
	 * 박가혜 연구실
	 */
	public void insertLab(OrganzVo organzVo) {

		organzDao.insertLab(organzVo);

	}

	/*
	 * 박가혜 연구실적
	 */
	public void insertResrch(ResrchAcrsltVo resrchAcrsltVo) {

		organzDao.insertResrch(resrchAcrsltVo);

	}

	/*
	 * 정예린 맞춤정보 입력
	 */

	public void setOrganzInfo(int lastId, List<String> cdlist) {

		CodeVo codeVo = new CodeVo();
		Integer id = lastId;

		for (int i = 0; i < cdlist.size(); i++) {
			codeVo.setOrgnzNo(id.longValue());
			codeVo.setCdId(cdlist.get(i));
			organzDao.setOgranzInfo(codeVo);
		}
	}

	/*
	 * 정예린 2017-08-30 학과 입력
	 */

	public void setOrganzInfo(int lastId, CodeForm codeForm) {

		CodeVo codeVo = new CodeVo();
		Integer id = lastId;
		codeVo.setOrgnzNo(id.longValue());

		if (codeForm.getCodes2() != null) {
			for (int i = 0; i < codeForm.getCodes2().size(); i++) {
				if (codeForm.getCodes2().get(i).getCdId() != null) {
					codeVo.setCdId(codeForm.getCodes2().get(i).getCdId());
					organzDao.setOgranzInfo(codeVo);
				}
			}

		}

		if (codeForm.getCodes() != null) {
			
			for (int i = 0; i < codeForm.getCodes().size(); i++) {
				if (codeForm.getCodes().get(i).getCdId() != null) {
					codeVo.setCdId(codeForm.getCodes().get(i).getCdId());
					organzDao.setOgranzInfo(codeVo);
				}

			}

		}

	}

	///////////////////////////////////////// update
	///////////////////////////////////////// ///////////////////////////////////////////////

	/*
	 * 허주한 대학원, 대학교, 학과
	 */

	public void update(OrganzVo organzVo, String type, String prntsOrgnzStr) {

		if (prntsOrgnzStr.isEmpty() || prntsOrgnzStr.equals(null) || prntsOrgnzStr.equals("0")) {
			organzVo.setPrntsOrgnzNo(-1);
		} else {
			organzVo.setPrntsOrgnzNo(Integer.parseInt(prntsOrgnzStr));
		}

		organzDao.update(organzVo);

	}

	/*
	 * 박가혜 연구실
	 */
	public void updateOrganz(OrganzVo organzVo) {

		organzDao.updateOrganz(organzVo);

	}

	/*
	 * 박가혜 연구실적
	 */
	public void updateResrch(ResrchAcrsltVo resrchAcrsltVo) {

		organzDao.updateResrch(resrchAcrsltVo);

	}

	/*
	 * 박가혜 연구실 맞춤정보 update 2017-08-29
	 */
	public void deleteOrganzInfo(int orgnzNo) {
		organzDao.deleteOrganzInfo(orgnzNo);

	}

	/*
	 * 정에린 2017-08-31
	 */
	public void deleteOrganzInfo(int orgnzNo, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", orgnzNo);
		map.put("type", type);
		organzDao.deleteOrganzInfo(map);

	}

	///////////////////////////// ㄱㄴㄷ순 페이징 service
	///////////////////////////// ///////////////////////////////////

	/*
	 * 허주한
	 */
	public int lastInsertId() {
		return organzDao.lastInsertId();
	}

	public List<OrganzVo> getListByChar(String type, String start, String end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		return organzDao.getListByChar(map);
	}

	///////////////////////////// 기관 검색하기 ///////////////////////////////////

	/*
	 * 정예린 기관 검색하기
	 */
	public List<OrganzVo> getResultList(Map<String, Object> map) {
		return organzDao.getResultList(map);
	}

	///////////////////////////////////////////// 맞춤검색/////////////////////////////////

	/*
	 * 허주한 2017/08/29
	 */
	public List<CodeVo> getCode(String type) {
		// TODO Auto-generated method stub
		String dstnct = null;

		if (type.equals("학과")) {
			dstnct = "학과";
		} else if (type.equals("연구실")) {
			dstnct = "연구분야";
		} else if (type.equals("전공")) {
			dstnct = "전공";
		}

		return organzDao.getCode(dstnct);
	}

}
