package com.exe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	
	@RequestMapping(value="MyAccount.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myAccount(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyAccount";
	}
	
	@RequestMapping(value="MyFavority.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myFavority(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyFavority";
	}
	
	@RequestMapping(value="MyMessage.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myMessage(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyMessage";
	}
	
	@RequestMapping(value="MyMistus.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myMistus(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyMistus";
	}
	
	@RequestMapping(value="MyPoint.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myPoint(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/MyPoint";
	}
	
}
