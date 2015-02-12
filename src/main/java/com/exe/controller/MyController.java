package com.exe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.GoodsDAO;
import com.exe.dao.HistoryDAO;
import com.exe.dao.MsgDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.HistoryDTO;
import com.exe.dto.MemberSession;
import com.exe.dto.MsgDTO;

@Controller
public class MyController {
	
	@Autowired
	HistoryDAO dao;
	
	@Autowired
	GoodsDAO GoodsDao;
	
	@Autowired
	MsgDAO msgDAO;
	
	@RequestMapping(value="/My/MyAccount.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myAccount(HttpServletRequest req, HttpServletResponse res){
		/*
		HttpSession session = req.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		String mbPw = mbs.getMbPw();
		
		req.setAttribute("mbPw1", mbPw);
		
		System.out.println(mbPw + "asdfasdfasdfasdfasdfasdfasdfasdf");

		*/
		return "My/MyAccount";
	}
	
	@RequestMapping(value="/My/MyFavority.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myFavority(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyFavority";
	}
	
	@RequestMapping(value="/My/MyMessage.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myMessage(HttpServletRequest req, HttpServletResponse res){
		
/*		int brNum =Integer.parseInt(req.getParameter("brNum"));
		System.out.println("brnum 들어오나요"+brNum);*/
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		
		String sender = mbs.getMbId();
		
		
		List<MsgDTO> lists = msgDAO.selectMsg(sender);
		
		List<MsgDTO> listsRe = msgDAO.selectReceiver(sender);
		
		
		
		req.setAttribute("lists", lists);
		req.setAttribute("listsRe", listsRe);
		
		return "My/MyMessage";
	}
	
	@RequestMapping(value="/My/MyMistus.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myMistus(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyMistus";
	}
	
	@RequestMapping(value="/My/MyPoint.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myPoint(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyPoint";
	}
	
}
