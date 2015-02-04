package com.exe.dto;


public class EmailAuthDTO {

	private int authNum;
	private String mbId;
	private int emailAuth;
	private int authCode;
	
	public int getAuthNum() {
		return authNum;
	}
	public void setAuthNum(int authNum) {
		this.authNum = authNum;
	}
	public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public int getEmailAuth() {
		return emailAuth;
	}
	public void setEmailAuth(int emailAuth) {
		this.emailAuth = emailAuth;
	}
	public int getAuthCode() {
		return authCode;
	}
	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
}
