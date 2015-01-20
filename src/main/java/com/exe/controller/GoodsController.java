package com.exe.controller;

import java.util.ArrayList;
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
import com.exe.dto.CategoryDTO;
import com.exe.dto.CommentsDTO;
import com.exe.dto.MemberDTO;

@Controller
public class GoodsController {
	
	@Autowired
	@Qualifier("goodsDAO")
	GoodsDAO dao;
	
	
	
	//메인
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String main() {
		
		return "index";
	}
	
	//메인
	@RequestMapping(value="/Goods/Main.action", method=RequestMethod.GET)
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
		
	}
	
	@RequestMapping(value="/Goods/GDetail.action")
	public String gDetail(int brNum,HttpServletRequest request,
			HttpServletResponse response){
		
		String cp = request.getContextPath();
		
		//int brNum = Integer.parseInt(request.getParameter("brNum"));
		System.out.println(brNum);
		BoardDTO dto = dao.getReadData(brNum);

		dao.updateBrCount(brNum);
		
		List<String> op = dto.getBrOptionsList();



		int cgNum = dto.getCgNum();
		CategoryDTO cgdto = dao.getReadCategory(cgNum);
		String category1 = cgdto.getCgCategory1();
		String category2 = cgdto.getCgCategory2();

	//관련재능 select
		List<BoardDTO> relists = dao.list(cgNum);

		request.setAttribute("relists", relists);


		String MbId = dto.getMbId();


		MemberDTO mbdto = dao.getReadMember(MbId);
		String nickName = mbdto.getMbNickName();

		dto.setBrContent(dto.getBrContent().replaceAll("\n", "<br/>"));
		String imagePath = cp + "/Product";


		List<CommentsDTO> lists = dao.cmList(brNum);
		List<CommentsDTO> newLists = new ArrayList<CommentsDTO>();

		String[] subject = new String[lists.size()];

		for (int i = 0; i < lists.size(); i++) {
			CommentsDTO cdto = lists.get(i);

			if(cdto.getCmContent().contains("\r\n")) {
				String[] a = cdto.getCmContent().split("\r\n");
				subject[i] = a[0];
			} else {
				String a = cdto.getCmContent();
				subject[i] = a;
			}

			cdto.setCmContent(cdto.getCmContent().replaceAll("\n", "<br/>"));
			newLists.add(cdto);
		}
		request.setAttribute("lists", newLists);
		request.setAttribute("subject", subject);

		request.setAttribute("nickName", nickName);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("op", op);
		request.setAttribute("imagePath", imagePath);
		request.setAttribute("dto", dto);
		request.setAttribute("brNum", brNum);
		
		return "Goods/GDetail";

		
		
	}
		
}
