package com.exe.dto;

public class PayMentDTO {

	private int payment;
	private String bkDay;
	private String mbId;

	private String sDate;
	private String eDate;

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getBkDay() {
		return bkDay;
	}

	public void setBkDay(String bkDay) {
		this.bkDay = bkDay;
	}

	public String getMbId() {
		return mbId;
	}

	public void setMbId(String mbId) {
		this.mbId = mbId;
	}

}
