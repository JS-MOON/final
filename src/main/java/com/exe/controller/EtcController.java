package com.exe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EtcController {

	
	//���� �̿���
	@RequestMapping(value="/Etc/LawService.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawService(){
		return "Etc/LawService";
	}
	
	//�������� ��޹�ħ
	@RequestMapping(value="/Etc/LawPersonal.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawPersonal(){
		return "Etc/LawPersonal";
	}
	
	//�����ϱ�
	@RequestMapping(value="/Etc/Suggest.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String Suggest(){
		return "CS/Suggest";
	}
	
	//��������
	@RequestMapping(value="/Etc/Notice.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String notice(){
		return "CS/Notice";
	}
	
	//��ɵ�Ͻɻ����
	@RequestMapping(value="/Etc/LawGoodsReg.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String lawGoodsReg(){
		return "Etc/LawGoodsReg";
	}
	
	//��ɱ����û
	@RequestMapping(value="/Etc/ADPayment.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String aDPayment(){
		return "DisplayAD/ADPayment";
	}
	
	//���� ���� ����
	@RequestMapping(value="/Etc/FAQ.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String fAQ(){
		return "CS/FAQ";
	}
	
	//1:1�����ϱ�
	@RequestMapping(value="/Etc/Inquiry.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String inquiry(){
		return "CS/Inquiry";
	}


}
