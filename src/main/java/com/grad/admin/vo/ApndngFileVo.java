package com.grad.admin.vo;

public class ApndngFileVo {
	private Long apndngFileNo;
	private String prntsDstnct;
	private String apndngFileNm;
	private Long apndngFileSize;
	private String apndngFileEtsionNm;
	private String storgPath;
	private String resgtDt;
	private int prntsNo;
	public Long getApndngFileNo() {
		return apndngFileNo;
	}
	public void setApndngFileNo(Long apndngFileNo) {
		this.apndngFileNo = apndngFileNo;
	}
	public String getPrntsDstnct() {
		return prntsDstnct;
	}
	public void setPrntsDstnct(String prntsDstnct) {
		this.prntsDstnct = prntsDstnct;
	}
	public String getApndngFileNm() {
		return apndngFileNm;
	}
	public void setApndngFileNm(String apndngFileNm) {
		this.apndngFileNm = apndngFileNm;
	}
	public Long getApndngFileSize() {
		return apndngFileSize;
	}
	public void setApndngFileSize(Long apndngFileSize) {
		this.apndngFileSize = apndngFileSize;
	}
	public String getApndngFileEtsionNm() {
		return apndngFileEtsionNm;
	}
	public void setApndngFileEtsionNm(String apndngFileEtsionNm) {
		this.apndngFileEtsionNm = apndngFileEtsionNm;
	}
	public String getStorgPath() {
		return storgPath;
	}
	public void setStorgPath(String storgPath) {
		this.storgPath = storgPath;
	}
	public String getResgtDt() {
		return resgtDt;
	}
	public void setResgtDt(String resgtDt) {
		this.resgtDt = resgtDt;
	}
	public int getPrntsNo() {
		return prntsNo;
	}
	public void setPrntsNo(int prntsNo) {
		this.prntsNo = prntsNo;
	}
	@Override
	public String toString() {
		return "ApndngFileVo [apndngFileNo=" + apndngFileNo + ", prntsDstnct=" + prntsDstnct + ", apndngFileNm="
				+ apndngFileNm + ", apndngFileSize=" + apndngFileSize + ", apndngFileEtsionNm=" + apndngFileEtsionNm
				+ ", storgPath=" + storgPath + ", resgtDt=" + resgtDt + ", prntsNo=" + prntsNo + "]";
	}
	
	

}
