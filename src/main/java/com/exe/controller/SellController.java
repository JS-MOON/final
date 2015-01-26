package com.exe.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.exe.dao.GoodsDAO;
import com.exe.dao.RegisterDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.MemberDTO;
import com.exe.util.ImageName;



@Controller
public class SellController {
	
	@Autowired
	@Qualifier("goodsDAO")
	GoodsDAO dao;
	
	@RequestMapping(value="/My/SellIncome.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellIncome(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellIncome";
	}
	
	@RequestMapping(value="/My/SellMng.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellMng(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellMng";
	}
	
	@RequestMapping(value="/My/SellProdListMy.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellProdListMy(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellProdListMy";
	}
	
	@RequestMapping(value="/My/SellProdReg.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellProdReg(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellProdReg";
	}
	
	@RequestMapping(value="/My/SellProdReg_ok.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellProdReg_ok(MultipartHttpServletRequest multipartRequest,HttpServletRequest req, HttpServletResponse res) {
		
		BoardDTO dto = new BoardDTO();
		ImageName im = new ImageName();

		String encType = "UTF-8";
		int maxSize = 5 * 1024 * 1024; // 5mb

		String path = multipartRequest.getSession().getServletContext()
				.getRealPath("/WEB-INF/images/Product/");
		
		String[] photoName = {"brMainPhoto", "brMorePhoto"};
		String[] newPhotoName = new String[2];
		
		for(int i=0;i<2;i++) {
			MultipartFile photoMF = multipartRequest.getFile(photoName[i]);
					
			if(i==0)
				newPhotoName[i] = im.mainPhotoName();
			else
				newPhotoName[i] = im.morePhotoName();
			
			if (photoMF!=null&&photoMF.getSize()>0) {
				try {
					String photoPath = path + File.separator + photoMF;
					
					File photoFile = new File(photoPath);
										
					if (photoFile.exists()) { 
						File newFile = new File(path + File.separator + newPhotoName[i] + ".jpg");
						photoFile.renameTo(newFile); // rename...
					}
					
					FileOutputStream fos = new FileOutputStream(path + File.separator + newPhotoName[i] + ".jpg");
	
					InputStream is = photoMF.getInputStream();
	
					byte[] buffer = new byte[512];
	
					while (true) {
						int count = is.read(buffer, 0, buffer.length);
						if (count == -1) {
							break;
						}
						fos.write(buffer, 0, count);
					}
					is.close();
					fos.close();
				} catch (Exception e) {
					System.out.println(e.toString());
				}
			}// end of if...
		}// end of for...

		String mainPhotoName = newPhotoName[0] + ".jpg"; //Main
		String morePhotoName = newPhotoName[1] + ".jpg"; //More
		
		String completedOption = multipartRequest.getParameter("completedOption");
		int s2 = Integer.parseInt(multipartRequest.getParameter("s2"));

		dto.setBrNum(dao.brMaxNum() + 1);
		dto.setMbId(multipartRequest.getParameter("mbId"));
		dto.setCgNum(s2);
		dto.setBrSubject(multipartRequest.getParameter("brSubject"));
		dto.setBrMainPhoto(mainPhotoName);
		dto.setBrMorePhoto(morePhotoName);
		dto.setBrContent(multipartRequest.getParameter("brContent"));
		dto.setBrOptions(completedOption);
		dto.setBrPrice(Integer.parseInt(multipartRequest.getParameter("brPrice")));

		dao.boardInsert(dto);

		return "redirect:/Goods/Main.action";
	}



}
