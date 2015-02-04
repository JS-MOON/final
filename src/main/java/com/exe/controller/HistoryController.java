package com.exe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exe.dao.PointDAO;
import com.exe.dto.PointDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.HistoryDAO;
import com.exe.dto.HistoryDTO;
import com.exe.dto.MemberSession;
import com.exe.util.MyUtil;

@Controller
public class HistoryController {
	
	@Autowired
	@Qualifier("historyDAO")
	HistoryDAO dao;

	@Autowired
	@Qualifier("pointDAO")
	PointDAO pdao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/Goods/GOrder_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String gorder_ok(HttpServletRequest req, HttpServletResponse res, HistoryDTO dto){

		//포인트 사용 관련
		int absUsedPoint = Integer.parseInt(req.getParameter("usedPoint"));
		if(absUsedPoint > 0) {
			int usedPoint = -1 * Integer.parseInt(req.getParameter("usedPoint"));
			int ptMaxNum = pdao.ptMaxNum();
			PointDTO pdto = new PointDTO();
			pdto.setPtNum(ptMaxNum+1);
			pdto.setMbId(req.getParameter("mbId"));
			pdto.setPtPoint(usedPoint);
			pdto.setPtHistory("포인트 사용 차감");
			pdao.ptInsert(pdto);
		}

		//포인트 적립 관련
		int point = (int) (Integer.parseInt(req.getParameter("price"))*0.1);
		int ptMaxNum = pdao.ptMaxNum();
		PointDTO pdto = new PointDTO();
		pdto.setPtNum(ptMaxNum+1);
		pdto.setMbId(req.getParameter("mbId"));
		pdto.setPtPoint(point);
		pdto.setPtHistory("상품 구매 10% 적립");
		pdao.ptInsert(pdto);

		//구입관리 관련
		int hsMaxNum = dao.hsMaxNum();
		dto.setHsNum(hsMaxNum+1);
		dto.setMbId(req.getParameter("mbId"));
		dto.setSrId(req.getParameter("srId"));
		dto.setBrNum(Integer.parseInt(req.getParameter("brNum")));
		dto.setHsOptions(req.getParameter("options"));
		dto.setHsPrice(Integer.parseInt(req.getParameter("price")));
		dto.setHsTotalPrice(Integer.parseInt(req.getParameter("totalPrice")));
		dto.setPtNum(ptMaxNum);
		dao.hsInsert(dto);

		return  "redirect:/My/MyOrderMng.action";
	}
	
	@RequestMapping(value="/My/MyOrderMng.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myOrderMng(HttpServletRequest req, HttpServletResponse res){
		
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		
		String MbId = mbs.getMbId();
		
		List<HistoryDTO> lists = dao.selectHistory(MbId);
		
		req.setAttribute("lists", lists);
		
		return "/My/MyOrderMng";
	}

	@RequestMapping(value="/My/SellMng.action", method={RequestMethod.GET,RequestMethod.POST})
	public String sellMng(HttpServletRequest req, HttpServletResponse res){
		
		//판매내역 
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		
		String mbId = mbs.getMbId();
		
		String searchSellValue = req.getParameter("searchSellValue");
		
		if(searchSellValue==null){
			searchSellValue="";
		}
		
		System.out.println(mbId);
		
		List<HistoryDTO> lists = dao.selectSellHistory(mbId,searchSellValue);
		
		req.setAttribute("lists", lists);
		
		System.out.println(lists);
		
		return "My/SellMng";
	}

}
