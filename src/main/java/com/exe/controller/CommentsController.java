package com.exe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.CommentsDAO;
import com.exe.dto.CommentsDTO;
import com.exe.util.MyUtil;

@Controller
public class CommentsController {
	
	@Autowired
	@Qualifier("commentsDAO")
	CommentsDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/Goods/comments_ok.action",method=RequestMethod.GET)
	public String comments_ok(int brNum, HttpServletRequest request, HttpServletResponse response){
		
		CommentsDTO dto = new CommentsDTO();
		
		int cmMaxNum = dao.cmMaxNum();
		
		dto.setCmNum(cmMaxNum+1);
		dto.setBrNum(brNum);
		dto.setCmContent(request.getParameter("cm_content"));
		dto.setCmNickName(request.getParameter("cm_nickName"));
		dto.setCmRating(Integer.parseInt(request.getParameter("cm_rating")));
		
		dao.cmInsert(dto);
		
		return "redirect:/Goods/GDtail.action?brNum=" + brNum;
	}
	
	

}
