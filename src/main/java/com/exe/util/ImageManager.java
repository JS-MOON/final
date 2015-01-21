package com.exe.util;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

public class ImageManager {

	public static boolean doFileDownload(HttpServletResponse response,
			String saveFileName, String path){
		
		try {
					
			String filePath = path + File.separator + saveFileName;
			
			saveFileName =
					new String(saveFileName.getBytes("euc-kr"), "ISO-8859-1");
			
			File f = new File(filePath);
			
			if(!f.exists())
				return false;
			
			response.setContentType("application/octet-stream");
			response.setHeader("Cotent-disposition",
					"attatchment; filename=" + saveFileName);
			
			BufferedInputStream bis =
					new BufferedInputStream(new FileInputStream(f));
			
			OutputStream out = response.getOutputStream();
			
			int n;
			byte bytes[] = new byte[4096];
			
			while((n=bis.read(bytes, 0, 4096))!=-1){
				out.write(bytes, 0, n);
			}
			out.flush();
			out.close();
			bis.close();
				
	} catch (Exception e) {
		System.out.println(e.toString());
		return false;
		
	}
		return true;
	}
	
	//����
	public static void dofileDelete(String fileName, String path){
		
		try {
			
			String filePath = path + File.separator + fileName;
			
			File f = new File(filePath);
			
			if(f.exists())
				f.delete();
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

}
