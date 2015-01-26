package com.exe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dto.MemberSession;

@Controller
public class MyController {
	
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
