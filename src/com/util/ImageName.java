package com.util;

import java.util.Calendar;
import java.util.Date;

public class ImageName {
	
	
	public String mainPhotoName(){
		
		String str="";
		
		Calendar today = Calendar.getInstance();

		str = "main";
		str+= Integer.toString(today.get(Calendar.YEAR));
		str+= Integer.toString((today.get(Calendar.MONTH)+1));
		str+= Integer.toString(today.get(Calendar.DATE));
		str+= Integer.toString(today.get(Calendar.MILLISECOND));
		
		return str;
	}
	
	
	
	public String morePhotoName(){
		
		String str="";
		
		Calendar today = Calendar.getInstance();

		str = "more";
		str+= Integer.toString(today.get(Calendar.YEAR));
		str+= Integer.toString((today.get(Calendar.MONTH)+1));
		str+= Integer.toString(today.get(Calendar.DATE));
		str+= Integer.toString(today.get(Calendar.MILLISECOND));
		
		return str;
	}

}
