package com.exe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EtcController {

	
	@RequestMapping(value="/Etc/LawService.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawService(){
		return "Etc/LawService";
	}
	
	@RequestMapping(value="/Etc/LawPersonal.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawPersonal(){
		return "Etc/LawPersonal";
	}
	@RequestMapping(value="/Etc/Suggest.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String Suggest(){
		return "CS/Suggest";
	}
	@RequestMapping(value="/Etc/Notice.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String notice(){
		return "CS/Notice";
	}
	@RequestMapping(value="/Etc/LawGoodsReg.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawGoodsReg(){
		return "Etc/LawGoodsReg";
	}
	
	@RequestMapping(value="/Etc/ADPayment.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String aDPayment(){
		return "DisplayAD/ADPayment";
	}

}
