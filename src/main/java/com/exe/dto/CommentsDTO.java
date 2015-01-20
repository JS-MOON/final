package com.exe.dto;

import java.sql.Date;

/**
 * Created by JS on 2014-12-01.
 */
public class CommentsDTO {

    private int cmNum;
    private int brNum;
    private String cmContent;
    private String cmNickName;
    private Date cmDate;
    private int cmRating;
	public int getCmNum() {
		return cmNum;
	}
	public void setCmNum(int cmNum) {
		this.cmNum = cmNum;
	}
	public int getBrNum() {
		return brNum;
	}
	public void setBrNum(int brNum) {
		this.brNum = brNum;
	}
	public String getCmContent() {
		return cmContent;
	}
	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}
	public String getCmNickName() {
		return cmNickName;
	}
	public void setCmNickName(String cmNickName) {
		this.cmNickName = cmNickName;
	}
	public Date getCmDate() {
		return cmDate;
	}
	public void setCmDate(Date cmDate) {
		this.cmDate = cmDate;
	}
	public int getCmRating() {
		return cmRating;
	}
	public void setCmRating(int cmRating) {
		this.cmRating = cmRating;
	}
    
    

}
