package com.exe.dto;

import java.sql.Date;

/**
 * Created by JS_Laptop on 2015-01-27.
 */
public class PointDTO {
    private int ptNum;
    private String mbId;
    private int ptPoint;
    private Date ptDate;
    private String ptHistory;

    public int getPtNum() {
        return ptNum;
    }

    public void setPtNum(int ptNum) {
        this.ptNum = ptNum;
    }

    public String getMbId() {
        return mbId;
    }

    public void setMbId(String mbId) {
        this.mbId = mbId;
    }

    public int getPtPoint() {
        return ptPoint;
    }

    public void setPtPoint(int ptPoint) {
        this.ptPoint = ptPoint;
    }

    public Date getPtDate() {
        return ptDate;
    }

    public void setPtDate(Date ptDate) {
        this.ptDate = ptDate;
    }

    public String getPtHistory() {
        return ptHistory;
    }

    public void setPtHistory(String ptHistory) {
        this.ptHistory = ptHistory;
    }
}
