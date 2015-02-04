package com.exe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.EmailAuthDAO;

@Controller
public class EmailAuthController {
	
	@Autowired
	@Qualifier("emailAuthDAO")
	EmailAuthDAO dao;
	
	/*@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String main() {
		return "index";
	}*/

}