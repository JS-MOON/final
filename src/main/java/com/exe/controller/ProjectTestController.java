package com.exe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.GoodsDAO;
import com.exe.dto.BoardDTO;

@Controller
public class ProjectTestController {
	
	@Autowired
	@Qualifier("goodsDAO")
	GoodsDAO dao;
	
	@RequestMapping(value="/1",method=RequestMethod.GET)
	public String test(){
		
		return "index";
		
		
	}
	
	@RequestMapping(value="/My/MyAccount.action",method=RequestMethod.GET)
	public String myAccount(){
		return "/My/MyAccount";
	}
	
	@RequestMapping(value="/Register/Register.action",method=RequestMethod.GET)
	public String register(){
		return "/Register/Register";
	}
	
/*	@RequestMapping(value="/Goods/Main.action", method=RequestMethod.GET)
	public String mainaction(HttpServletRequest request,
			HttpServletResponse response){
		
		String cp = request.getContextPath();
		
		String str = "";

		String imagePath = cp + "/WEB-INF/views/Product";
		
		System.out.println(imagePath);
		
		str = (String) request.getAttribute("str");
		
		List<BoardDTO> newLists = dao.newTalentList();
		
		List<BoardDTO> countLists = dao.mainCountList();

		request.setAttribute("str", str);
		request.setAttribute("imagePath", imagePath);
		request.setAttribute("newLists", newLists);
		request.setAttribute("countLists", countLists);

		return "/Goods/Main";
		
	}*/

}
