package com.exe.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exe.dao.PointDAO;
import com.exe.dao.WishListDAO;
import com.exe.dto.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.GoodsDAO;
import com.exe.util.DivideOptions;

@Controller
public class GoodsController {

	@Autowired
	@Qualifier("goodsDAO")
	GoodsDAO dao;

	@Autowired
	@Qualifier("pointDAO")
	PointDAO pdao;
	
	@Autowired
	@Qualifier("wishListDAO")
	WishListDAO widao;

	// 메인
	@RequestMapping(value = "/", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String main() {

		return "index";
	}

	// 메인화면
	@RequestMapping(value = "/Goods/Main.action", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String mainaction(HttpServletRequest request,
			HttpServletResponse response) {

		//get Cookie
		Cookie[] cookies = request.getCookies();
		String[] brNumbs = new String[4];
		String[] photos = new String[4];

		try {
			if (cookies != null && cookies.length > 0) {
				for (Cookie cooky : cookies) {
					if(cooky.getName().equals("myWishList")) {
						String temp = cooky.getValue();

						String[] wishListsArray = temp.split(",,");

						for (int i = 0; i < wishListsArray.length; i++) {
							if (i % 2 == 0)
								brNumbs[i / 2] = wishListsArray[i];
							else
								photos[i / 2] = wishListsArray[i];
						}
					}
				}
			}
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		//getSession
		HttpSession session = request.getSession();
		String sessionMbId = "";
		List<BoardDTO> countLists = null;
		
		//session이 존재할 경우에만 id저장
		if(session.getAttribute("session")!=null){
			MemberSession mbs = (MemberSession) session.getAttribute("session");
			sessionMbId = mbs.getMbId();
			countLists = dao.mainWishList(sessionMbId);
		}else if(session.getAttribute("session")==null){	
			countLists = dao.mainCountList();
		}

		String str = "";
		str = (String) request.getAttribute("str");

		List<BoardDTO> newLists = dao.newTalentList();
		
		request.setAttribute("str", str);
		request.setAttribute("newLists", newLists);
		request.setAttribute("countLists", countLists);
		request.setAttribute("cookies", brNumbs);
		request.setAttribute("cookiesPhoto", photos);
		request.setAttribute("mbId", sessionMbId);

		return "/Goods/Main";

	}
	
	// 최근 본 목록 쿠키 추가
	@RequestMapping(value = "/Goods/GDetail.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gDetail(String brNum, HttpServletRequest request,
						  HttpServletResponse response) {

		try {
			String wishLists = "";
			Cookie[] cookies = request.getCookies();

			if(cookies != null && cookies.length > 0) {
				for (Cookie cooky : cookies) {
					if (cooky.getName().equals("myWishList")) {
						wishLists = cooky.getValue();

						if (!wishLists.contains(brNum + ",,")) {
							String[] wishListsArray = wishLists.split(",,");
							if (wishListsArray.length >= 8) {
								wishLists = "";
								for (int j = 2; j < wishListsArray.length; j++) {
									wishLists += wishListsArray[j];
									wishLists += ",,";
								}
							} else {
								wishLists += ",,";
							}
						}
					}
				}
			}

			if(!wishLists.contains(brNum + ",,")) {
				wishLists += brNum;
				wishLists += ",,";
				wishLists += dao.onePhoto(Integer.parseInt(brNum));
			}

			Cookie c = new Cookie("myWishList", wishLists);

			response.addCookie(c);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return "redirect:/Goods/RGDetail.action?brNum=" + brNum;
	}

	// 상품상세설명창
	@RequestMapping(value = "/Goods/RGDetail.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String redirectGDetail(HttpServletRequest request,
								  HttpServletResponse response) {


		try {
			Cookie[] cookies = request.getCookies();
			String[] brNumbs = new String[4];
			String[] photos = new String[4];

			try {
				if (cookies != null && cookies.length > 0) {
					for (Cookie cooky : cookies) {
						if(cooky.getName().equals("myWishList")) {
							String temp = cooky.getValue();

							String[] wishListsArray = temp.split(",,");

							for (int i = 0; i < wishListsArray.length; i++) {
								if (i % 2 == 0)
									brNumbs[i / 2] = wishListsArray[i];
								else
									photos[i / 2] = wishListsArray[i];
							}
						}
					}
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}

			int brNum = Integer.parseInt(request.getParameter("brNum"));

			BoardDTO dto = dao.getReadData(brNum);

			dao.updateBrCount(brNum);

			List<String> op = dto.getBrOptionsList();

			int cgNum = dto.getCgNum();
			
			CategoryDTO cgdto = dao.getReadCategory(cgNum);
			String category1 = cgdto.getCgCategory1();
			String category2 = cgdto.getCgCategory2();

			// 관련재능 select
			List<BoardDTO> relists = dao.list(cgNum);

			request.setAttribute("relists", relists);

			String mbId = dto.getMbId();

			MemberDTO mbdto = dao.getReadMember(mbId);
			String nickName = mbdto.getMbNickName();

			dto.setBrContent(dto.getBrContent().replaceAll("\n", "<br/>"));

			List<CommentsDTO> lists = dao.cmList(brNum);
			List<CommentsDTO> newLists = new ArrayList<CommentsDTO>();

			String[] subject = new String[lists.size()];

			for (int i = 0; i < lists.size(); i++) {
				CommentsDTO cdto = lists.get(i);

				if (cdto.getCmContent().contains("\r\n")) {
					String[] a = cdto.getCmContent().split("\r\n");
					subject[i] = a[0];
				} else {
					String a = cdto.getCmContent();
					subject[i] = a;
				}

				cdto.setCmContent(cdto.getCmContent().replaceAll("\n", "<br/>"));
				newLists.add(cdto);

			}

			request.setAttribute("cookies", brNumbs);
			request.setAttribute("cookiesPhoto", photos);
			request.setAttribute("lists", newLists);
			request.setAttribute("subject", subject);
			request.setAttribute("ck", cookies);
			request.setAttribute("nickName", nickName);
			request.setAttribute("category1", category1);
			request.setAttribute("category2", category2);
			request.setAttribute("op", op);
			request.setAttribute("dto", dto);
			request.setAttribute("brNum", brNum);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return "Goods/GDetail";

	}

	//
	@RequestMapping(value = "/Goods/GList.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gList(HttpServletRequest request, HttpServletResponse response) {

		Cookie[] ck = request.getCookies();
		String cookies[] = new String[100];
		String cookiesPhoto[] = new String[100];
		try {
			if (ck != null) {

				int photoOnCookie = 0;
				int brNumOnCookie = 0;
				for (int i = ck.length - 2; i >= 0; i--) {

					if (ck[i].getName().indexOf("main") != -1) {
						cookiesPhoto[photoOnCookie] = URLDecoder.decode(
								ck[i].getName(), "UTF-8");
						photoOnCookie++;

					} else {
						cookies[brNumOnCookie] = URLDecoder.decode(ck[i].getName(),
								"UTF-8");
						brNumOnCookie++;
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		//getSession
		HttpSession session = request.getSession();
		String sessionMbId = "";
		List<BoardDTO> lists = null;
		
		String cp = request.getContextPath();

		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));

		String option = request.getParameter("range");

		if (option.equals("1")) {// 가격 내림차순(최고가순)
			String column = "brprice";
			String order = "desc";
			if(session.getAttribute("session")!=null){
				MemberSession mbs = (MemberSession) session.getAttribute("session");
				sessionMbId = mbs.getMbId();
				lists = dao.wishlist(start, end, column, order,sessionMbId);
			}else if(session.getAttribute("session")==null){	
				lists = dao.list(start, end, column, order);
			}
			request.setAttribute("lists", lists);
		} else if (option.equals("2")) {// 가격 올림차순(최저가순)
			String column = "brprice";
			String order = "asc";
			if(session.getAttribute("session")!=null){
				MemberSession mbs = (MemberSession) session.getAttribute("session");
				sessionMbId = mbs.getMbId();
				lists = dao.wishlist(start, end, column, order,sessionMbId);
			}else if(session.getAttribute("session")==null){	
				lists = dao.list(start, end, column, order);
			}
			request.setAttribute("lists", lists);
		} else if (option.equals("3")) {// 날짜순
			String column = "brdate";
			String order = "desc";
			if(session.getAttribute("session")!=null){
				MemberSession mbs = (MemberSession) session.getAttribute("session");
				sessionMbId = mbs.getMbId();
				lists = dao.wishlist(start, end, column, order,sessionMbId);
			}else if(session.getAttribute("session")==null){	
				lists = dao.list(start, end, column, order);
			}
			request.setAttribute("lists", lists);
		} else {
			if(session.getAttribute("session")!=null){
				MemberSession mbs = (MemberSession) session.getAttribute("session");
				sessionMbId = mbs.getMbId();
				lists = dao.wishlist(start, end,sessionMbId);
			}else if(session.getAttribute("session")==null){	
				lists = dao.list(start,end);
			}
			request.setAttribute("lists", lists);

			if (1 <= start && start <= 14) {
				start = 1;
				end = 14;
			}
			if (15 <= start && start <= 22) {
				start = 15;
				end = 22;
			}
			if (23 <= start && start <= 30) {
				start = 23;
				end = 30;
			}
			if (31 <= start && start <= 41) {
				start = 31;
				end = 41;
			}
			if (42 <= start && start <= 50) {
				start = 42;
				end = 50;
			}
			if (51 <= start && start <= 58) {
				start = 51;
				end = 58;
			}
			if (59 <= start && start <= 68) {
				start = 59;
				end = 68;
			}
			if (69 <= start && start <= 79) {
				start = 69;
				end = 79;
			}
			if (80 <= start && start <= 90) {
				start = 80;
				end = 90;
			}
			if (91 <= start && start <= 96) {
				start = 91;
				end = 96;
			}
			if (97 <= start && start <= 109) {
				start = 97;
				end = 109;
			}
		}

		// 카테고리 찍어주기
		String imagePath = cp + "/Product";

		List<CategoryDTO> cglists = dao.getReadCategory(start, end);

		request.setAttribute("cglists", cglists);
		request.setAttribute("imagePath", imagePath);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("cookies", cookies);
		request.setAttribute("cookiesPhoto", cookiesPhoto);
		request.setAttribute("mbId", sessionMbId);

		return "Goods/GList";
	}

	@RequestMapping(value = "/Goods/GList_ok.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gList_ok(HttpServletRequest request,
						   HttpServletResponse response) {

		int cgNum = Integer.parseInt(request.getParameter("cgNum"));

		return "redirect:/Goods/GList.action?start=" + cgNum + "&end=" + cgNum
				+ "&range=0";
	}

	@RequestMapping(value = "/Goods/GSearchList.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gSearchList(HttpServletRequest request,
			HttpServletResponse response) {

		Cookie[] ck = request.getCookies();
		String cookies[] = new String[100];
		String cookiesPhoto[] = new String[100];
		try {
			if (ck != null) {

				int photoOnCookie = 0;
				int brNumOnCookie = 0;
				for (int i = ck.length - 2; i >= 0; i--) {

					if (ck[i].getName().indexOf("main") != -1) {
						cookiesPhoto[photoOnCookie] = URLDecoder.decode(
								ck[i].getName(), "UTF-8");
						photoOnCookie++;

					} else {
						cookies[brNumOnCookie] = URLDecoder.decode(
								ck[i].getName(), "UTF-8");
						brNumOnCookie++;
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		String searchValue = request.getParameter("searchValue");

		//getSession
		HttpSession session = request.getSession();
		String sessionMbId = "";
		List<BoardDTO> lists = null;
		
		//session이 존재할 경우에만 id저장
		if(session.getAttribute("session")!=null){
			MemberSession mbs = (MemberSession) session.getAttribute("session");
			sessionMbId = mbs.getMbId();
			lists = dao.selectWishSubject(searchValue,sessionMbId);
			
		}else if(session.getAttribute("session")==null){	
			lists = dao.selectSubject(searchValue);
		}
		request.setAttribute("lists", lists);
		request.setAttribute("cookies", cookies);
		request.setAttribute("cookiesPhoto", cookiesPhoto);
		request.setAttribute("mbId", sessionMbId);

		return "/Goods/GSearchList";

	}

	@RequestMapping(value = "/Goods/GOrder.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gOrder(HttpServletRequest request,
						 HttpServletResponse response) {

		String option = request.getParameter("completedOption");
		String basicPrice = request.getParameter("basicPrice");
		String totalPrice = request.getParameter("totalPrice");
		String mainPhoto = request.getParameter("mainPhoto");
		String subject = request.getParameter("subject");
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		String brNum = request.getParameter("brNum");
		String srId = request.getParameter("srId");

		request.setAttribute("option", option);
		request.setAttribute("basicPrice", basicPrice);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("mainPhoto", mainPhoto);
		request.setAttribute("subject", subject);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("brNum", brNum);
		request.setAttribute("srId", srId);

		DivideOptions divideOptions = new DivideOptions();
		List<String> op = divideOptions.parse(option);
		request.setAttribute("op", op);

		int optionPrice = 0;
		for (int i = 1; i < op.size(); i += 2) {
			if (op.get(i) != null) {
				optionPrice += Integer.parseInt(op.get(i));
			}
		}
		request.setAttribute("optionPrice", optionPrice);

		int vatAddedtotalPrice = (int) (Integer.parseInt(totalPrice) * 1.1);
		request.setAttribute("vatAddedtotalPrice", vatAddedtotalPrice);

		HttpSession session = request.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		int restPoint = pdao.ptGetSum(mbs.getMbId());
		request.setAttribute("restPoint", restPoint);

		return "Goods/GOrder";
	}

	@RequestMapping(value = "/Goods/logout.action", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String logout(HttpServletRequest request,HttpServletResponse response) {

		String str = "";
		
		str = "로그아웃 되셨습니다.";

		Cookie[] ck = request.getCookies();

		if(ck != null && ck.length > 0){
			for (int i = 0; i < ck.length; i++) {


				Cookie cookie = new Cookie(ck[i].getName(), ck[i].getValue());
				cookie.setMaxAge(0);
				response.addCookie(cookie);

			}
		}

		request.setAttribute("str", str);

		HttpSession session = request.getSession();
		session.invalidate();


		return "Register/Register";

	}

}
