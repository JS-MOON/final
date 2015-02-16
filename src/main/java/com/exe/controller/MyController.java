package com.exe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exe.dao.PointDAO;
import com.exe.dao.RegisterDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.PointDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dto.MemberSession;

import java.util.List;

@Controller
public class MyController {

	@Autowired
	@Qualifier("pointDAO")
	PointDAO pdao;
	
	@Autowired
	@Qualifier("registerDAO")
	RegisterDAO rdao;
	
	@RequestMapping(value="/My/MyAccount.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myAccount(HttpServletRequest req, HttpServletResponse res, MemberDTO dto){
	
		
		HttpSession session = req.getSession();
		MemberSession mb = (MemberSession) session.getAttribute("session");
		
		dto = rdao.getReadMember(mb.getMbId());
		System.out.println("밥팅!");
		req.setAttribute("dto", dto);
		return "My/MyAccount";
	}
	
	@RequestMapping(value="/My/MyFavority.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myFavority(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyFavority";
	}
	
	@RequestMapping(value="/My/MyMessage.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myMessage(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyMessage";
	}
	
	@RequestMapping(value="/My/MyMistus.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myMistus(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyMistus";
	}
	
	@RequestMapping(value="/My/MyPoint.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myPoint(HttpServletRequest req, HttpServletResponse res){
		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		List<PointDTO> pointDTOList = pdao.ptGetAll(mbs.getMbId());
		req.setAttribute("pointDTOList", pointDTOList);

		return "My/MyPoint";
	}
	
}
