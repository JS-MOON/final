package com.exe.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

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
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.RegisterDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.MemberSession;

@Controller
public class RegisterController {

	@Autowired
	@Qualifier("registerDAO")
	RegisterDAO dao;

	@RequestMapping(value = "/Register/Register.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String register(HttpServletRequest request,
			HttpServletResponse response) {

		String mbId = request.getParameter("mbId");
		String mbPw1 = request.getParameter("mbPw1");
		String mbPic = "img_profile_img_blank_120x120.png";

		String str = "";

		MemberDTO dto = dao.registerMemberData(mbId);

		if (dto != null) {
			str = "���̵� �����մϴ�.";
		} else {

			dto = new MemberDTO();

			dto.setMbId(mbId);
			dto.setMbPw(mbPw1);
			dto.setMbPic(mbPic);
			dao.insertMember(dto);

			HttpSession session = request.getSession(true);

			MemberSession mbs = new MemberSession();

			mbs.setMbId(mbId);
			mbs.setMbPw(mbPw1);

			session.setAttribute("session", mbs);

			return "redirect:/Goods/Main.action";
		}

		request.setAttribute("str", str);

		return "/Register/Register";
	}

	@RequestMapping(value = "/Register/Register_ok.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String register_ok() {
		return "redirect:/Goods/Main.action";
	}

	@RequestMapping(value = "/Login/Login.action")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, MemberDTO dto) throws Exception {

		ModelAndView mav = new ModelAndView();

		String mbId = request.getParameter("mbId");
		String mbPw = request.getParameter("mbPw");
		String str = "";

		dto = dao.getReadMember(mbId);

		if (dto == null) {

			str = "���̵� �������� �ʽ��ϴ�.";

		} else if (!dto.getMbPw().equals(mbPw)) {
			str = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";

		} else {
			HttpSession session = request.getSession(true);

			MemberSession mbs = new MemberSession();

			mbs.setMbId(mbId);
			mbs.setMbPw(mbPw);

			session.setAttribute("session", mbs);

			/*
			 * String cp = request.getContextPath(); String url = cp +
			 * "/Goods/Main.action";
			 * 
			 * response.sendRedirect(url);
			 */

			mav.setViewName("redirect:/Goods/Main.action");
			return mav;
			// return "redirect:/Goods/Main.action";

		}

		mav.addObject("str", str);
		// request.setAttribute("str", str);

		mav.setViewName("/Register/Register");
		return mav;
	}

	/*
	 * @RequestMapping(value="/Login/Login.action",method={RequestMethod.GET,
	 * RequestMethod.POST}) public String login(MemberDTO dto,HttpServletRequest
	 * request){
	 * 
	 * String mbId = request.getParameter("mbId"); String mbPw =
	 * request.getParameter("mbPw"); String str = "";
	 * 
	 * dto = dao.getReadMember(mbId);
	 * 
	 * if (dto == null) {
	 * 
	 * str = "���̵� �������� �ʽ��ϴ�.";
	 * 
	 * } else if (!dto.getMbPw().equals(mbPw)) { str = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
	 * 
	 * } else { HttpSession session = request.getSession(true);
	 * 
	 * MemberSession mbs = new MemberSession();
	 * 
	 * mbs.setMbId(mbId); mbs.setMbPw(mbPw);
	 * 
	 * session.setAttribute("session", mbs);
	 * 
	 * return "redirect:/Goods/Main.action"; }
	 * 
	 * request.setAttribute("str", str);
	 * 
	 * return "/Register/Register";
	 * 
	 * }
	 */

	@RequestMapping(value = "/My/MyProfile.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String MyProfile(HttpServletRequest request) {

		String cp = request.getContextPath();

		String imagePath = cp + "/pds/imageFile";

		HttpSession session = request.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		MemberDTO dto = dao.getReadMember(mbs.getMbId());

		request.setAttribute("dto", dto);
		request.setAttribute("imagePath", imagePath);

		return "/My/MyProfile";

	}

	@RequestMapping(value = "/Comm/PhotoUpload.aciton", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String photoUpload(HttpServletRequest request) {

		HttpSession session = request.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		return "Comm/PhotoUpload";
	}

	@RequestMapping(value = "/Comm/PhotoUpload_ok.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String photoUpload_ok(MultipartHttpServletRequest multipartrRequest,
			HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		String path = multipartrRequest.getSession().getServletContext()
				.getRealPath("/WEB-INF/images/Profile/");

		MultipartFile file = multipartrRequest.getFile("mbPic");

		if (file != null && file.getSize() > 0) {
			try {
				
				MemberDTO dto = dao.getReadMember(mbs.getMbId());
				
				String filepath = path + File.separator + dto.getMbPic() ;
				
				File f = new File(filepath);
				
				if(f.exists())
					f.delete();
				
				String originalFileName = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
				String mbId = mbs.getMbId().substring(0, mbs.getMbId().indexOf("."));
				
				FileOutputStream fos = new FileOutputStream(path + "/"
						+ mbId + originalFileName);

				InputStream is = file.getInputStream();

				byte[] buffer = new byte[512];

				while (true) {
					int count = is.read(buffer, 0, buffer.length);
					if (count == -1) {
						break;
					}
					fos.write(buffer, 0, count);
				}

				String mbPicData = mbId + originalFileName;

				dao.updatePicture(mbPicData, mbs.getMbId());

				is.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return "Comm/complete";
	}

	@RequestMapping(value = "/My/UpdateMyprofile.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String updateMyProfile(MemberDTO dto, HttpServletRequest request) {

		dto = new MemberDTO();

		String mbId = request.getParameter("mbId");
		String mbNickName = request.getParameter("mbNickName");
		String mbAbout = request.getParameter("mbAbout");

		dto.setMbId(mbId);
		dto.setMbNickName(mbNickName);
		dto.setMbAbout(mbAbout);

		dao.updateMyMember(dto);

		return "redirect:/My/MyProfile.action";
	}

	@RequestMapping(value = "/My/ChangePw.action", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String changePw(HttpServletRequest request) {

		HttpSession session = request.getSession();

		MemberSession mbs = (MemberSession) session.getAttribute("session");

		String mbId = mbs.getMbId();

		String changeMbPw1 = request.getParameter("changeMbPw1");

		dao.updatePwMember(mbId, changeMbPw1);

		return "redirect:/My/MyAccount.action";

	}

	@RequestMapping(value = "/My/Out.action", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String out(HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		String str = "";

		String mbId = mbs.getMbId();

		int result = dao.deleteMember(mbId);

		if (result != 0) {
			str = "";
			request.setAttribute("str", str);
			session.invalidate();
		}

		return "Register/Register";

	}
}
