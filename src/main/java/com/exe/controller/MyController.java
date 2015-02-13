package com.exe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exe.dao.HistoryDAO;
import com.exe.dao.PointDAO;
import com.exe.dao.WishListDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.PointDTO;
import com.exe.dto.WishListDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dao.GoodsDAO;
import com.exe.dao.MsgDAO;
import com.exe.dto.MemberSession;
import com.exe.dto.MsgDTO;

@Controller
public class MyController {

    @Autowired
    @Qualifier("pointDAO")
    PointDAO pdao;

    @Autowired
    @Qualifier("wishListDAO")
    WishListDAO widao;

    @Autowired
    @Qualifier("historyDAO")
    HistoryDAO hdao;

    @Autowired
    HistoryDAO dao;

    @Autowired
    GoodsDAO GoodsDao;

    @Autowired
    MsgDAO msgDAO;

    @RequestMapping(value="/My/MyAccount.action", method={RequestMethod.GET,RequestMethod.POST})
    public String myAccount(HttpServletRequest req, HttpServletResponse res){

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

    //찜목록 추가
    @RequestMapping(value = "/My/AddMyFavority.action", method = {RequestMethod.GET, RequestMethod.POST})
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

    //찜목록 삭제
    @RequestMapping(value = "/My/DelMyFavority.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String DelMyFavority(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();
        MemberSession mbs = (MemberSession) session.getAttribute("session");
        String MbId = mbs.getMbId();

        int brNum = Integer.parseInt(req.getParameter("brNum"));

        widao.delWishList(brNum,MbId);

        return "redirect:/My/MyFavority.action";
    }

    //찜목록 리스트
    @RequestMapping(value = "/My/MyFavority.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String myFavority(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();

        MemberSession mbs = (MemberSession)session.getAttribute("session");

        String mbId = mbs.getMbId();

        List<BoardDTO> lists = widao.selectWishList(mbId);

        req.setAttribute("lists", lists);

        return "My/MyFavority";

    }


    //메세지
    @RequestMapping(value = "/My/MyMessage.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String myMessage(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();

        MemberSession mbs = (MemberSession) session.getAttribute("session");

        String sender = mbs.getMbId();

        List<MsgDTO> lists = msgDAO.selectMsg(sender);
        List<MsgDTO> listsRe = msgDAO.selectReceiver(sender);

        req.setAttribute("lists", lists);
        req.setAttribute("listsRe", listsRe);

        return "My/MyMessage";
    }

    //재능관리
    @RequestMapping(value = "/My/MyTalent.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String myTalent(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();

        MemberSession mbs = (MemberSession)session.getAttribute("session");

        String mbId = mbs.getMbId();

        int buyOnGoing = hdao.selectCountBuyOnGoing(mbId);
        int buyChecked = hdao.selectCountBuyChecked(mbId);
        int buyCompleted = hdao.selectCountBuyCompleted(mbId);
        int buyCanceled = hdao.selectCountBuyCanceled(mbId);

        req.setAttribute("buyOnGoing", buyOnGoing);
        req.setAttribute("buyChecked", buyChecked);
        req.setAttribute("buyCompleted", buyCompleted);
        req.setAttribute("buyCanceled", buyCanceled);

        int sellOnGoing = hdao.selectCountSellOnGoing(mbId);
        int sellChecked = hdao.selectCountSellChecked(mbId);
        int sellCompleted = hdao.selectCountSellCompleted(mbId);
        int sellCanceled = hdao.selectCountSellCanceled(mbId);

        req.setAttribute("sellOnGoing", sellOnGoing);
        req.setAttribute("sellChecked", sellChecked);
        req.setAttribute("sellCompleted", sellCompleted);
        req.setAttribute("sellCanceled", sellCanceled);

        return "My/MyTalent";
    }

    //포인트
    @RequestMapping(value = "/My/MyPoint.action", method = { RequestMethod.GET, RequestMethod.POST})
    public String myPoint(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();
        MemberSession mbs = (MemberSession) session.getAttribute("session");

        List<PointDTO> pointDTOList = pdao.ptGetAll(mbs.getMbId());

        req.setAttribute("pointDTOList", pointDTOList);

        return "My/MyPoint";

    }

}
