package com.exe.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.exe.dao.GoodsDAO;
import com.exe.dao.HistoryDAO;
import com.exe.dao.RegisterDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.MemberDTO;
import com.exe.dto.MemberSession;
import com.exe.dto.PayMentDTO;
import com.exe.util.ImageName;

@Controller
public class SellController {

	@Autowired
	@Qualifier("goodsDAO")
	GoodsDAO dao;

	@Autowired
	@Qualifier("registerDAO")
	RegisterDAO rdao;

	@Autowired
	@Qualifier("historyDAO")
	HistoryDAO hdao;

	@RequestMapping(value = "/My/BankSellIncome.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String insertBank(HttpServletRequest req, HttpServletResponse res,
			PayMentDTO pdto) {

		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");

		int payment = Integer.parseInt(req.getParameter("payment"));
		String mbId = mbs.getMbId();

		pdto.setPayment(payment);
		pdto.setMbId(mbId);

		hdao.insertBankData(pdto);

		int hsPrice = hdao.hsPriceSum(mbs.getMbId());

		req.setAttribute("hsPrice", hsPrice);

		return "redirect:/My/SellIncome.action";
	}

	@RequestMapping(value = "/My/SellIncome.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String sellIncome(HttpServletRequest req, HttpServletResponse res,
			MemberDTO dto) {

		HttpSession session = req.getSession();
		MemberSession mb = (MemberSession) session.getAttribute("session");
		String mbId = mb.getMbId();

		String sDate = req.getParameter("sDate");
		String eDate = req.getParameter("eDate");
		
		if(eDate != null) {
			int eYear = Integer.parseInt(eDate.substring(0, 4)); //year
			int eMonth = Integer.parseInt(eDate.substring(5, 7)); //month
			int eDay = Integer.parseInt(eDate.substring(8, 10)); //day
			
			Calendar cal = Calendar.getInstance();
			cal.set(eYear, eMonth-1, eDay);
			cal.add(Calendar.DATE, 1);
			
			eDate = "" + cal.get(Calendar.YEAR) + "." + (cal.get(Calendar.MONTH) + 1) + "." + cal.get(Calendar.DATE);
			
			System.out.println(eDate);
		}
		


		if (sDate == null) {
			List<PayMentDTO> lists = hdao.selectBanklistAll(mbId);
			req.setAttribute("paymentlist", lists);
		}else{
			List<PayMentDTO> lists = hdao.selectBanklist(mbId, sDate, eDate);
			req.setAttribute("paymentlist", lists);
		}

		dto = rdao.getReadMember(mb.getMbId());

		int hsPrice = hdao.hsPriceSum(mb.getMbId());
		int payout = hdao.selectPayment(mb.getMbId());

		/*
		 * if(op==null || op.equals("") || op.equals("1")){
		 * System.out.println("옵션1들어왔나?");
		 * 
		 * if(sDate==null){ PayMentDTO pdto = hdao.selectBankDayMax(mbId); sDate
		 * = pdto.getsDate(); eDate = pdto.geteDate(); }
		 * 
		 * System.out.println(sDate+eDate);
		 * 
		 * List<PayMentDTO> lists = hdao.selectBanklist(mbId,sDate,eDate);
		 * req.setAttribute("paymentlist", lists);
		 * 
		 * System.out.println("끝"); }
		 * 
		 * if(op.equals("pay")){ System.out.println("옵션2들어왔나?");
		 * List<PayMentDTO> lists = hdao.selectBankPayUp(mbId);
		 * req.setAttribute("paymentlist", lists); }
		 */
		/* List<PayMentDTO> daylists = hdao.selectBankDay(sDate, eDate); */

		req.setAttribute("payout", payout);
		req.setAttribute("dto", dto);
		req.setAttribute("hsPrice", hsPrice);

		return "My/SellIncome";
	}

	@RequestMapping(value = "/My/SellProdListMy.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String sellProdListMy(HttpServletRequest req, HttpServletResponse res) {

		return "My/SellProdListMy";
	}

	@RequestMapping(value = "/My/SellProdReg.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String sellProdReg(HttpServletRequest req, HttpServletResponse res) {

		return "My/SellProdReg";
	}

	@RequestMapping(value = "/My/SellProdReg_ok.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String sellProdReg_ok(MultipartHttpServletRequest multipartRequest,
			HttpServletRequest req, HttpServletResponse res) {

		BoardDTO dto = new BoardDTO();
		ImageName im = new ImageName();

		String encType = "UTF-8";
		int maxSize = 5 * 1024 * 1024; // 5mb

		String path = multipartRequest.getSession().getServletContext()
				.getRealPath("/WEB-INF/images/Product/");

		String[] photoName = { "brMainPhoto", "brMorePhoto" };
		String[] newPhotoName = new String[2];

		for (int i = 0; i < 2; i++) {
			MultipartFile photoMF = multipartRequest.getFile(photoName[i]);

			if (i == 0)
				newPhotoName[i] = im.mainPhotoName();
			else
				newPhotoName[i] = im.morePhotoName();

			if (photoMF != null && photoMF.getSize() > 0) {
				try {
					String photoPath = path + File.separator + photoMF;

					File photoFile = new File(photoPath);

					if (photoFile.exists()) {
						File newFile = new File(path + File.separator
								+ newPhotoName[i] + ".jpg");
						photoFile.renameTo(newFile); // rename...
					}

					FileOutputStream fos = new FileOutputStream(path
							+ File.separator + newPhotoName[i] + ".jpg");

					InputStream is = photoMF.getInputStream();

					byte[] buffer = new byte[512];

					while (true) {
						int count = is.read(buffer, 0, buffer.length);
						if (count == -1) {
							break;
						}
						fos.write(buffer, 0, count);
					}
					is.close();
					fos.close();
				} catch (Exception e) {
					System.out.println(e.toString());
				}
			}// end of if...
		}// end of for...

		String mainPhotoName = newPhotoName[0] + ".jpg"; // Main
		String morePhotoName = newPhotoName[1] + ".jpg"; // More

		String completedOption = multipartRequest
				.getParameter("completedOption");
		int s2 = Integer.parseInt(multipartRequest.getParameter("s2"));

		dto.setBrNum(dao.brMaxNum() + 1);
		dto.setMbId(multipartRequest.getParameter("mbId"));
		dto.setCgNum(s2);
		dto.setBrSubject(multipartRequest.getParameter("brSubject"));
		dto.setBrMainPhoto(mainPhotoName);
		dto.setBrMorePhoto(morePhotoName);
		dto.setBrContent(multipartRequest.getParameter("brContent"));
		dto.setBrOptions(completedOption);
		dto.setBrPrice(Integer.parseInt(multipartRequest
				.getParameter("brPrice")));

		dao.boardInsert(dto);

		return "redirect:/Goods/Main.action";
	}

}
