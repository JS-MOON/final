package com.exe.dto;


import java.util.List;

import com.exe.util.DivideOptions;

/**
 * Created by JS on 2014-12-01.
 */
public class CopyOfBoardDTO {

    private int brNum;
    private String mbId;
    private int cgNum;
    private String brSubject;
    private String brMainPhoto;
    private String brMorePhoto;
    private String brContent;
    private String brOptions;
    private List<String> brOptionsList;
    private int brPrice;
    private String brDate;
    private String mbNickName;
    private String cgCategory1;
    private int brCount;
    private String mbPic;

    public String getMbPic() {
        return mbPic;
    }

    public void setMbPic(String mbPic) {
        this.mbPic = mbPic;
    }

    public int getBrCount() {
		return brCount;
	}

	public void setBrCount(int brCount) {
		this.brCount = brCount;
	}

	public String getCgCategory1() {
		return cgCategory1;
	}

	public void setCgCategory1(String cgCategory1) {
		this.cgCategory1 = cgCategory1;
	}

	public String getMbNickName() {
		return mbNickName;
	}

	public void setMbNickName(String mbNickName) {
		this.mbNickName = mbNickName;
	}

	public int getBrNum() {
        return brNum;
    }

    public void setBrNum(int brNum) {
        this.brNum = brNum;
    }

    public String getMbId() {
        return mbId;
    }

    public void setMbId(String mbId) {
        this.mbId = mbId;
    }

    public int getCgNum() {
        return cgNum;
    }

    public void setCgNum(int cgNum) {
        this.cgNum = cgNum;
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

    public String getBrMorePhoto() {
        return brMorePhoto;
    }

    public void setBrMorePhoto(String brMorePhoto) {
        this.brMorePhoto = brMorePhoto;
    }

    public String getBrContent() {
        return brContent;
    }

    public void setBrContent(String brContent) {
        this.brContent = brContent;
    }

    public String getBrOptions() {
        return brOptions;
    }

   public void setBrOptions(String brOptions) {
        this.brOptions = brOptions;
        
        DivideOptions divideOptions = new DivideOptions();

        setBrOptionsList(divideOptions.parse(brOptions));
    }

    public List<String> getBrOptionsList() {
        return brOptionsList;
    }

    public void setBrOptionsList(List<String> brOptionsList) {
        this.brOptionsList = brOptionsList;
    }

    public int getBrPrice() {
        return brPrice;
    }

    public void setBrPrice(int brPrice) {
        this.brPrice = brPrice;
    }

    public String getBrDate() {
        return brDate;
    }

    public void setBrDate(String brDate) {
        this.brDate = brDate;
    }
}
