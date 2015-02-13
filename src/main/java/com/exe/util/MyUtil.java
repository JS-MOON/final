package com.exe.util;

//����¡ ó��
public class MyUtil {

	public int getPageCount(int numPerPage,int dataCount){
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0){
			pageCount++;
		}
		
		return pageCount;
	}
}


























