package com.exe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EtcController {

	
	//서비스 이용약관
	@RequestMapping(value="/Etc/LawService.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawService(){
		return "Etc/LawService";
	}
	
	//개인정보 취급방침
	@RequestMapping(value="/Etc/LawPersonal.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawPersonal(){
		return "Etc/LawPersonal";
	}
	
	//제안하기
	@RequestMapping(value="/Etc/Suggest.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String Suggest(){
		return "CS/Suggest";
	}
	
	//공지사항
	@RequestMapping(value="/Etc/Notice.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String notice(){
		return "CS/Notice";
	}
	
	//재능등록심사규정
	@RequestMapping(value="/Etc/LawGoodsReg.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawGoodsReg(){
		return "Etc/LawGoodsReg";
	}
	
	//재능광고신청
	@RequestMapping(value="/Etc/ADPayment.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String aDPayment(){
		return "DisplayAD/ADPayment";
	}
	
	//자주 묻는 질문
	@RequestMapping(value="/Etc/FAQ.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String fAQ(){
		return "CS/FAQ";
	}
	
	//1:1문의하기
	@RequestMapping(value="/Etc/Inquiry.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String inquiry(){
		return "CS/Inquiry";
	}


}
