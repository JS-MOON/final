package com.exe.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.ListIterator;

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

	// 구매페이지(결제)
	@RequestMapping(value = "/Goods/GOrder_ok.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String gorder_ok(HttpServletRequest req, HttpServletResponse res,
			HistoryDTO dto) {

		// 포인트 사용 관련
		int absUsedPoint = Integer.parseInt(req.getParameter("usedPoint"));
		if (absUsedPoint > 0) {
			int usedPoint = -1
					* Integer.parseInt(req.getParameter("usedPoint"));
			int ptMaxNum = pdao.ptMaxNum();
			PointDTO pdto = new PointDTO();
			pdto.setPtNum(ptMaxNum + 1);
			pdto.setMbId(req.getParameter("mbId"));
			pdto.setPtPoint(usedPoint);
			pdto.setPtHistory("포인트 사용 차감");
			pdao.ptInsert(pdto);
		}

		// 포인트 적립 관련
		int point = (int) (Integer.parseInt(req.getParameter("price")) * 0.1);
		int ptMaxNum = pdao.ptMaxNum();
		PointDTO pdto = new PointDTO();
		pdto.setPtNum(ptMaxNum + 1);
		pdto.setMbId(req.getParameter("mbId"));
		pdto.setPtPoint(point);
		pdto.setPtHistory("상품 구매 10% 적립");
		pdao.ptInsert(pdto);

		// 구입관리 관련
		int hsMaxNum = dao.hsMaxNum();
		dto.setHsNum(hsMaxNum + 1);
		dto.setMbId(req.getParameter("mbId"));
		dto.setSrId(req.getParameter("srId"));
		dto.setBrNum(Integer.parseInt(req.getParameter("brNum")));
		dto.setHsOptions(req.getParameter("options"));
		dto.setHsPrice(Integer.parseInt(req.getParameter("price")));
		dto.setHsTotalPrice(Integer.parseInt(req.getParameter("totalPrice")));
		dto.setPtNum(ptMaxNum);
		dao.hsInsert(dto);

		return "redirect:/My/MyOrderMng.action";

	}

	// 구매내역
	@RequestMapping(value = "/My/MyOrderMng.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String myOrderMng(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		String mbId = mbs.getMbId();

		String pageNum = req.getParameter("pageNum");

		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String searchBuyValue = req.getParameter("searchBuyValue");

		try {

			if (searchBuyValue == null) {
				searchBuyValue = "";
			} else {

				if (req.getMethod().equalsIgnoreCase("GET"))
					searchBuyValue = URLDecoder.decode(searchBuyValue, "UTF-8");

			}

			// 전체데이터갯수
			int dataCount = dao.myOrderMngDataCount(mbId, searchBuyValue);

			// 전체페이지수
			int numPerPage = 5;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if (currentPage > totalPage)
				currentPage = totalPage;

			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

            List<HistoryDTO> lists = dao.selectHistory(mbId, start, end,
					searchBuyValue);

			int listNum,n=0;
			ListIterator<HistoryDTO> it = lists.listIterator();
			while(it.hasNext()){
				HistoryDTO dto = it.next();
				listNum = dataCount-(start+n-1);
				dto.setListNum(listNum);
				n++;
			}

			req.setAttribute("lists", lists);
			req.setAttribute("dataCount", dataCount);
            req.setAttribute("totalPage", totalPage);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return "/My/MyOrderMng";
	}

    @RequestMapping(value = "/Ajax/MyOrderMng.action", method = {
            RequestMethod.GET, RequestMethod.POST })
    public String myOrderMngAjax(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();

        MemberSession mbs = (MemberSession) session.getAttribute("session");

        String mbId = mbs.getMbId();
        String pageNum = req.getParameter("pageNum");

        int currentPage = 1;

        if (pageNum != null)
            currentPage = Integer.parseInt(pageNum);

        String searchBuyValue = req.getParameter("searchBuyValue");

        try {
            if (searchBuyValue == null) {
                searchBuyValue = "";
            } else {
                if (req.getMethod().equalsIgnoreCase("GET"))
                    searchBuyValue = URLDecoder.decode(searchBuyValue, "UTF-8");
            }

            // 전체데이터갯수
            int dataCount = dao.myOrderMngDataCount(mbId, searchBuyValue);

            // 전체페이지수
            int numPerPage = 5;
            int totalPage = myUtil.getPageCount(numPerPage, dataCount);

            if (currentPage > totalPage)
                currentPage = totalPage;

            int start = (currentPage - 1) * numPerPage + 1;
            int end = currentPage * numPerPage;

            List<HistoryDTO> lists = dao.selectHistory(mbId, start, end,
                    searchBuyValue);

            int listNum,n=0;
            ListIterator<HistoryDTO> it = lists.listIterator();
            while(it.hasNext()){
                HistoryDTO dto = it.next();
                listNum = dataCount-(start+n-1);
                dto.setListNum(listNum);
                n++;
            }

            req.setAttribute("lists", lists);

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return "/Ajax/MyOrderMng";
    }

	// 판매내역
	@RequestMapping(value = "/My/SellMng.action", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String sellMng(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		String mbId = mbs.getMbId();

        String pageNum = req.getParameter("pageNum");

        int currentPage = 1;

        if (pageNum != null)
            currentPage = Integer.parseInt(pageNum);

        String searchSellValue = req.getParameter("searchSellValue");

        try {
            if (searchSellValue == null) {
                searchSellValue = "";
            } else {
                if (req.getMethod().equalsIgnoreCase("GET"))
                    searchSellValue = URLDecoder.decode(searchSellValue, "UTF-8");
            }

            // 전체데이터갯수
            int dataCount = dao.sellMngDataCount(mbId, searchSellValue);

            // 전체페이지수
            int numPerPage = 5;
            int totalPage = myUtil.getPageCount(numPerPage, dataCount);

            if (currentPage > totalPage)
                currentPage = totalPage;

            int start = (currentPage - 1) * numPerPage + 1;
            int end = currentPage * numPerPage;

            List<HistoryDTO> lists = dao.selectSellHistory(mbId, start, end,
                    searchSellValue);

            int listNum,n=0;
            ListIterator<HistoryDTO> it = lists.listIterator();
            while(it.hasNext()){
                HistoryDTO dto = it.next();
                listNum = dataCount-(start+n-1);
                dto.setListNum(listNum);
                n++;
            }

            req.setAttribute("lists", lists);
            req.setAttribute("dataCount", dataCount);
            req.setAttribute("totalPage", totalPage);

        } catch (Exception e) {
            System.out.println(e.toString());
        }

		return "My/SellMng";
	}

    @RequestMapping(value = "/Ajax/SellMng.action", method = { RequestMethod.GET,
            RequestMethod.POST })
    public String sellMngAjax(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();

        MemberSession mbs = (MemberSession) session.getAttribute("session");

        String mbId = mbs.getMbId();


        String pageNum = req.getParameter("pageNum");

        int currentPage = 1;

        if (pageNum != null)
            currentPage = Integer.parseInt(pageNum);

        String searchSellValue = req.getParameter("searchSellValue");

        try {
            if (searchSellValue == null) {
                searchSellValue = "";
            } else {
                if (req.getMethod().equalsIgnoreCase("GET"))
                    searchSellValue = URLDecoder.decode(searchSellValue, "UTF-8");
            }

            // 전체데이터갯수
            int dataCount = dao.myOrderMngDataCount(mbId, searchSellValue);

            // 전체페이지수
            int numPerPage = 5;
            int totalPage = myUtil.getPageCount(numPerPage, dataCount);

            if (currentPage > totalPage)
                currentPage = totalPage;

            int start = (currentPage - 1) * numPerPage + 1;
            int end = currentPage * numPerPage;

            List<HistoryDTO> lists = dao.selectSellHistory(mbId, start, end,
                    searchSellValue);

            int listNum,n=0;
            ListIterator<HistoryDTO> it = lists.listIterator();
            while(it.hasNext()){
                HistoryDTO dto = it.next();
                listNum = dataCount-(start+n-1);
                dto.setListNum(listNum);
                n++;
            }

            req.setAttribute("lists", lists);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return "Ajax/SellMng";
    }

	@RequestMapping(value = "/My/SellComplete.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String sellComplete(HttpServletRequest req, HttpServletResponse res) {

		int hsNum = Integer.parseInt(req.getParameter("hsNum"));

		dao.updateSellerProgress(hsNum);

		return "redirect:/My/SellMng.action";
	}

	@RequestMapping(value = "/My/BuyComplete.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String buyComplete(HttpServletRequest req, HttpServletResponse res) {

		int hsNum = Integer.parseInt(req.getParameter("hsNum"));

		dao.updateMemberProgress(hsNum);

		return "redirect:/My/MyOrderMng.action";
	}

	@RequestMapping(value = "/My/BuyCancel.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String buyCancel(HttpServletRequest req, HttpServletResponse res) {

		int hsNum = Integer.parseInt(req.getParameter("hsNum"));

		dao.updateCancelProgress(hsNum);

		return "redirect:/My/MyOrderMng.action";
	}

}
