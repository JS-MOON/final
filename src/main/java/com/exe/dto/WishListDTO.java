package com.exe.dto;

import java.sql.Date;

public class WishListDTO {
	
	private String mbId;
	private int brNum;
	private int wiNum;
	private Date wiDate;
	
	public String getMbId() {
		return mbId;
	}
	public void setMbId(String mbId) {
		this.mbId = mbId;
	}
	public int getBrNum() {
		return brNum;
	}
	public void setBrNum(int brNum) {
		this.brNum = brNum;
	}
	public int getWiNum() {
		return wiNum;
	}
	public void setWiNum(int wiNum) {
		this.wiNum = wiNum;
	}
	public Date getWiDate() {
		return wiDate;
	}
	public void setWiDate(Date wiDate) {
		this.wiDate = wiDate;
	}
}
