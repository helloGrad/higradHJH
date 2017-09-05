package com.grad.admin.vo;

public class CodeVo {
	

	private String cdId;
	private String cdNm;
	private String cdDstnct;
	private String prntsCdId;
	private String engCodeNm;
	private Long orgnzNo;
	
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getCdDstnct() {
		return cdDstnct;
	}
	public void setCdDstnct(String cdDstnct) {
		this.cdDstnct = cdDstnct;
	}
	public String getPrntsCdId() {
		return prntsCdId;
	}
	public void setPrntsCdId(String prntsCdId) {
		this.prntsCdId = prntsCdId;
	}
	public String getEngCodeNm() {
		return engCodeNm;
	}
	public void setEngCodeNm(String engCodeNm) {
		this.engCodeNm = engCodeNm;
	}
	
	public Long getOrgnzNo() {
		return orgnzNo;
	}
	public void setOrgnzNo(Long orgnzNo) {
		this.orgnzNo = orgnzNo;
	}
	@Override
	public String toString() {
		return "CodeVo [cdId=" + cdId + ", cdNm=" + cdNm + ", cdDstnct=" + cdDstnct + ", prntsCdId=" + prntsCdId
				+ ", engCodeNm=" + engCodeNm + ", orgnzNo=" + orgnzNo + "]";
	}

	
	
	
	
	

}
