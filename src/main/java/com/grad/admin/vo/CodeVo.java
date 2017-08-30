package com.grad.admin.vo;

public class CodeVo {
	

	private String cdId;
	private String cdNm;
	private String engCodeNm;
	private String cdDstnct;
	private String prntsCdId;
	private long orgnzNo;
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
	public String getEngCodeNm() {
		return engCodeNm;
	}
	public void setEngCodeNm(String engCodeNm) {
		this.engCodeNm = engCodeNm;
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
	public long getOrgnzNo() {
		return orgnzNo;
	}
	public void setOrgnzNo(long orgnzNo) {
		this.orgnzNo = orgnzNo;
	}
	@Override
	public String toString() {
		return "CodeVo [cdId=" + cdId + ", cdNm=" + cdNm + ", engCodeNm=" + engCodeNm + ", cdDstnct=" + cdDstnct
				+ ", prntsCdId=" + prntsCdId + ", orgnzNo=" + orgnzNo + "]";
	}
	
	
	

}
