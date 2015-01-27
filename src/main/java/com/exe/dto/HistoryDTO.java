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
	private String brMainphoto;
	private int ptNum;

	public int getPtNum() {
		return ptNum;
	}

	public void setPtNum(int ptNum) {
		this.ptNum = ptNum;
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

	public String getBrMainphoto() {
		return brMainphoto;
	}

	public void setBrMainphoto(String brMainphoto) {
		this.brMainphoto = brMainphoto;
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
}