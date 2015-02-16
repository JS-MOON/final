package com.exe.dto;

/**
 * Created by JS on 2014-12-01.
 */
public class MemberDTO {

    private String mbId;
    private String mbPw;
    private String mbTel;
    private String mbNickName;
    private String mbPic;
    private String mbAbout;
    
    //계좌관리
    private int bkNum;
    private String name;
    private String bank;
    
    //eMail 인증
    private int emailAuth;
    
	public int getEmailAuth() {
		return emailAuth;
	}
	public void setEmailAuth(int emailAuth) {
		this.emailAuth = emailAuth;
	}
	public int getBkNum() {
		return bkNum;
	}
	public void setBkNum(int bkNum) {
		this.bkNum = bkNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
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
	public String getMbTel() {
		return mbTel;
	}
	public void setMbTel(String mbTel) {
		this.mbTel = mbTel;
	}
	public String getMbNickName() {
		return mbNickName;
	}
	public void setMbNickName(String mbNickName) {
		this.mbNickName = mbNickName;
	}
	public String getMbPic() {
		return mbPic;
	}
	public void setMbPic(String mbPic) {
		this.mbPic = mbPic;
	}
	public String getMbAbout() {
		return mbAbout;
	}
	public void setMbAbout(String mbAbout) {
		this.mbAbout = mbAbout;
	}
    
    

}
