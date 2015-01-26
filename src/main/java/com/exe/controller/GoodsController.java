package com.exe.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.GoodsDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.CategoryDTO;
import com.exe.dto.CommentsDTO;
import com.exe.dto.MemberDTO;
import com.exe.util.DivideOptions;

@Controller
public class GoodsController {

	@Autowired
	@Qualifier("goodsDAO")
	GoodsDAO dao;

	// 메인
	@RequestMapping(value = "/", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String main() {

		return "index";
	}

	// 메인
	@RequestMapping(value = "/Goods/Main.action", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String mainaction(HttpServletRequest request,
							 HttpServletResponse response) {

		Cookie[] ck = request.getCookies();
		String cookies[] = new String[100];
		String cookiesPhoto[] = new String[100];
		try {
			if (ck != null) {

				int Photon = 0;
				int brNumn = 0;
				for (int i = ck.length - 2; i >= 0; i--) {

					if (ck[i].getName().indexOf("main") != -1) {
						cookiesPhoto[Photon] = URLDecoder.decode(
								ck[i].getName(), "UTF-8");
						Photon++;

					} else {
						cookies[brNumn] = URLDecoder.decode(ck[i].getName(),
								"UTF-8");
						brNumn++;
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		String str = "";

		str = (String) request.getAttribute("str");

		List<BoardDTO> newLists = dao.newTalentList();

		List<BoardDTO> countLists = dao.mainCountList();

		request.setAttribute("str", str);
		request.setAttribute("newLists", newLists);
		request.setAttribute("countLists", countLists);
		request.setAttribute("cookies", cookies);
		request.setAttribute("cookiesPhoto", cookiesPhoto);

		return "/Goods/Main";

	}

	// 최근 본 목록 쿠키 추가
	@RequestMapping(value = "/Goods/GDetail.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gDetail(String brNum, HttpServletRequest request,
						  HttpServletResponse response) {

		try {

			Cookie c = new Cookie(brNum, URLEncoder.encode(brNum, "UTF-8"));

			// c.setMaxAge(30);

			String cookiesPhoto = dao.onePhoto(Integer.parseInt(brNum));

			Cookie photo = new Cookie(cookiesPhoto, URLEncoder.encode(
					cookiesPhoto, "UTF-8"));

			response.addCookie(photo);
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

		String cp = request.getContextPath();

		try {

			Cookie[] ck = request.getCookies();
			String cookies[] = new String[100];
			String cookiesPhoto[] = new String[100];

			if (ck != null) {

				int Photon = 0;
				int brNumn = 0;
				for (int i = ck.length - 2; i >= 0; i--) {

					if (ck[i].getName().indexOf("main") != -1) {
						cookiesPhoto[Photon] = URLDecoder.decode(ck[i].getName(), "UTF-8");
						Photon++;

					} else {
						cookies[brNumn] = URLDecoder.decode(ck[i].getName(),"UTF-8");
						brNumn++;
					}
				}
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

			String MbId = dto.getMbId();

			MemberDTO mbdto = dao.getReadMember(MbId);
			String nickName = mbdto.getMbNickName();

			dto.setBrContent(dto.getBrContent().replaceAll("\n", "<br/>"));
			String imagePath = cp + "/Product";

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

			request.setAttribute("cookies", cookies);
			request.setAttribute("cookiesPhoto", cookiesPhoto);
			request.setAttribute("lists", newLists);
			request.setAttribute("subject", subject);
			request.setAttribute("ck", ck);
			request.setAttribute("nickName", nickName);
			request.setAttribute("category1", category1);
			request.setAttribute("category2", category2);
			request.setAttribute("op", op);
			request.setAttribute("imagePath", imagePath);
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

				int Photon = 0;
				int brNumn = 0;
				for (int i = ck.length - 2; i >= 0; i--) {

					if (ck[i].getName().indexOf("main") != -1) {
						cookiesPhoto[Photon] = URLDecoder.decode(
								ck[i].getName(), "UTF-8");
						Photon++;

					} else {
						cookies[brNumn] = URLDecoder.decode(ck[i].getName(),
								"UTF-8");
						brNumn++;
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}


		String cp = request.getContextPath();

		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));

		String option = request.getParameter("range");

		if (option.equals("1")) {// 가격 내림차순
			String column = "brprice";
			String order = "desc";
			List<BoardDTO> lists = dao.list(start, end, column, order);
			request.setAttribute("lists", lists);
		} else if (option.equals("2")) {// 가격 올림차순
			String column = "brprice";
			String order = "asc";
			List<BoardDTO> lists = dao.list(start, end, column, order);
			request.setAttribute("lists", lists);
		} else if (option.equals("3")) {// 날짜순
			String column = "brdate";
			String order = "desc";
			List<BoardDTO> lists = dao.list(start, end, column, order);
			request.setAttribute("lists", lists);
		} else {
			List<BoardDTO> lists = dao.list(start, end);
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

				int Photon = 0;
				int brNumn = 0;
				for (int i = ck.length - 2; i >= 0; i--) {

					if (ck[i].getName().indexOf("main") != -1) {
						cookiesPhoto[Photon] = URLDecoder.decode(
								ck[i].getName(), "UTF-8");
						Photon++;

					} else {
						cookies[brNumn] = URLDecoder.decode(ck[i].getName(),
								"UTF-8");
						brNumn++;
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		String searchValue = request.getParameter("searchValue");

		List<BoardDTO> lists = dao.selectSubject(searchValue);

		request.setAttribute("lists", lists);
		request.setAttribute("cookies", cookies);
		request.setAttribute("cookiesPhoto", cookiesPhoto);

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

		request.setAttribute("option", option);
		request.setAttribute("basicPrice", basicPrice);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("mainPhoto", mainPhoto);
		request.setAttribute("subject", subject);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("brNum", brNum);

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