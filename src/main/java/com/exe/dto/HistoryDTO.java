package com.exe.dto;

import java.sql.Date;

/**
 * Created by JS on 2014-12-01.
 */
public class HistoryDTO {

    private int hsNum;
    private String mbId;
    private int brNum;
    private Date hsDate;
    private int hsPrice;
    private int hsTotalPrice;
	private String hsOptions;
	private String brSubject;
	private String brMainPhoto;
	private String srId;
	private int ptNum;
	private int progress;
	
	public int getPtNum() {
		return ptNum;
	}

	public void setPtNum(int ptNum) {
		this.ptNum = ptNum;
	}

	public String getSrId() {
		return srId;
	}

	public void setSrId(String srId) {
		this.srId = srId;
	}

	public int getHsNum() {
		return hsNum;
	}

	public String getBrSubject() {
		return brSubject;
	}

	public void setBrSubject(String brSubject) {
		this.brSubject = brSubject;
	}

	public String getBrMainPhoto() {
		return brMainPhoto;
	}

	public void setBrMainPhoto(String brMainPhoto) {
		this.brMainPhoto = brMainPhoto;
	}

	public void setHsNum(int hsNum) {
		this.hsNum = hsNum;
	}

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

	public Date getHsDate() {
		return hsDate;
	}

	public void setHsDate(Date hsDate) {
		this.hsDate = hsDate;
	}

	public int getHsPrice() {
		return hsPrice;
	}

	public void setHsPrice(int hsPrice) {
		this.hsPrice = hsPrice;
	}

	public int getHsTotalPrice() {
		return hsTotalPrice;
	}

	public void setHsTotalPrice(int hsTotalPrice) {
		this.hsTotalPrice = hsTotalPrice;
	}

	public String getHsOptions() {
		return hsOptions;
	}

	public void setHsOptions(String hsOptions) {
		this.hsOptions = hsOptions;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;

	}
	
}