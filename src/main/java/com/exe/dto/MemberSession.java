package com.exe.dto;

public class MemberSession {
	
	private String mbId;
	private String mbPw;
	private String mbNickName;
    private int ptPoint;

    public int getPtPoint() {
        return ptPoint;
    }

    public void setPtPoint(int ptPoint) {
        this.ptPoint = ptPoint;
    }

    public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public String getMbPw() {
		return mbPw;
	}
	public void setMbPw(String mbPw) {
		this.mbPw = mbPw;
	}
	public String getMbNickName() {
		return mbNickName;
	}
	public void setMbNickName(String mbNickName) {
		this.mbNickName = mbNickName;
	}
	


}
