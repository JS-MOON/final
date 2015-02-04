package com.exe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exe.dao.PointDAO;
import com.exe.dao.WishListDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.HistoryDTO;
import com.exe.dto.PointDTO;
import com.exe.dto.WishListDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dto.MemberSession;

import java.util.List;

@Controller
public class MyController {

	@Autowired
	@Qualifier("pointDAO")
	PointDAO pdao;

	@Autowired
	@Qualifier("wishListDAO")
	WishListDAO widao;

	@RequestMapping(value = "/My/MyAccount.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String myAccount(HttpServletRequest req, HttpServletResponse res) {
		/*
		 * HttpSession session = req.getSession();
		 * 
		 * MemberSession mbs = (MemberSession) session.getAttribute("session");
		 * 
		 * String mbPw = mbs.getMbPw();
		 * 
		 * req.setAttribute("mbPw1", mbPw);
		 * 
		 * System.out.println(mbPw + "asdfasdfasdfasdfasdfasdfasdfasdf");
		 */
		return "My/MyAccount";
	}

	@RequestMapping(value = "/My/AddMyFavority.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String AddMyFavority(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		String MbId = mbs.getMbId();
		
		int brNum = Integer.parseInt(req.getParameter("brNum"));

		int maxNum = widao.wiMaxNum();
		WishListDTO dto = new WishListDTO();
		dto.setMbId(MbId);
		dto.setBrNum(brNum);
		dto.setWiNum(maxNum + 1);
		
		widao.wiInsert(dto);

		return "My/MyFavority";
	}
	
	@RequestMapping(value = "/My/DelMyFavority.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String DelMyFavority(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		String MbId = mbs.getMbId();
		
		int brNum = Integer.parseInt(req.getParameter("brNum"));
		
		widao.delWishList(brNum,MbId);

		return "redirect:/My/MyFavority.action";
	}
	
	@RequestMapping(value = "/My/MyFavority.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String myFavority(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		
		String MbId = mbs.getMbId();
		
		List<BoardDTO> lists = widao.selectWishList(MbId);
		
		req.setAttribute("lists", lists);


		return "My/MyFavority";
	}
	
	

	@RequestMapping(value = "/My/MyMessage.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String myMessage(HttpServletRequest req, HttpServletResponse res) {

		return "My/MyMessage";
	}

	@RequestMapping(value = "/My/MyMistus.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String myMistus(HttpServletRequest req, HttpServletResponse res) {

		return "My/MyMistus";
	}

	@RequestMapping(value = "/My/MyPoint.action", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String myPoint(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		List<PointDTO> pointDTOList = pdao.ptGetAll(mbs.getMbId());
		req.setAttribute("pointDTOList", pointDTOList);

		return "My/MyPoint";
	}

}
