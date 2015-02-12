package com.exe.dto;

public class MsgDTO {
	
	private int brNum;
	private int msgNum;
	private String sender;
	private String receiver;
	private String msgContent;
	private String msgDate;
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public String getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}
	public int getBrNum() {
		return brNum;
	}
	public void setBrNum(int brNum) {
		this.brNum = brNum;
	}
	
	
	
	

}
