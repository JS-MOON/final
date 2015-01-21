package com.exe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.exe.util.ImageName;



@Controller
public class SellController {
	
	@Autowired
	ImageName im;
	
	@RequestMapping(value="SellIncome.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellIncome(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellIncome";
	}
	
	@RequestMapping(value="SellMng.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellMng(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellMng";
	}
	
	@RequestMapping(value="SellProdListMy.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellProdListMy(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellProdListMy";
	}
	
	@RequestMapping(value="SellProdReg.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellProdReg(HttpServletRequest req, HttpServletResponse res){
		
		
		return "My/SellProdReg";
	}
	
	@RequestMapping(value="SellProdReg_ok.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellProdReg_ok(HttpServletRequest req, HttpServletResponse res) {
		
		
		return "My/SellProdReg_ok";
	}



}