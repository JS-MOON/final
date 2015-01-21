package com.exe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	MyUtil myUtil;
	
	@RequestMapping(value="GOrder_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String gorder_ok(HttpServletRequest req, HttpServletResponse res){
		
		HistoryDTO dto = new HistoryDTO();
		
		int hsMaxNum = dao.hsMaxNum();
		
		dto.setHsNum(hsMaxNum+1);
		dto.setMbId(req.getParameter("mbId"));
		dto.setBrNum(Integer.parseInt(req.getParameter("brNum")));
		dto.setHsOptions(req.getParameter("options"));
		dto.setHsPrice(Integer.parseInt(req.getParameter("price")));
		dto.setHsTotalPrice(Integer.parseInt(req.getParameter("totalPrice")));
		
		dao.hsInsert(dto);
		
		return  "redirect:/My/MyOrderMng.do";
	}
	
	@RequestMapping(value="MyOrderMng.action", method={RequestMethod.GET,RequestMethod.POST})
	public String myOrderMng(HttpServletRequest req, HttpServletResponse res){
		
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		
		String MbId = mbs.getMbId();
		
		List<HistoryDTO> lists = dao.selectHistory(MbId);
		
		req.setAttribute("lists", lists);
		
		return "/My/MyOrderMng";
	}
	


}
