package com.exe.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.RegisterDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.MemberSession;


@Controller
public class RegisterController {

	@Autowired
	@Qualifier("registerDAO")
	RegisterDAO dao;
	
/*	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home(){
		
		return "index";
		
	}
	
	@RequestMapping(value="/Goods/Main.action")
	public ModelAndView main(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Goods/Main");
		
		return mav;
	}*/
	
	
	@RequestMapping(value="/Register/Register.action",method={RequestMethod.GET,RequestMethod.POST})
	public String register(HttpServletRequest request,HttpServletResponse response){

		String mbId = request.getParameter("mbId");
		String mbPw1 = request.getParameter("mbPw1");
		String mbPic = "img_profile_img_blank_120x120.png";

		String str = "";
		
		MemberDTO dto = dao.registerMemberData(mbId);
		
		if (dto!=null) {
			str = "아이디가 존재합니다.";
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

		
	@RequestMapping(value="/Register/Register_ok.action",method={RequestMethod.GET,RequestMethod.POST})	
	public String register_ok(){
		return "redirect:/Goods/Main.action";
	}		

	@RequestMapping(value="/Login/Login.action")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,MemberDTO dto) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		String mbId = request.getParameter("mbId");
		String mbPw = request.getParameter("mbPw");
		String str = "";

		dto = dao.getReadMember(mbId);

		if (dto == null) {

			str = "아이디가 존재하지 않습니다.";

		} else if (!dto.getMbPw().equals(mbPw)) {
			str = "비밀번호가 일치하지 않습니다.";

		} else {
			HttpSession session = request.getSession(true);

			MemberSession mbs = new MemberSession();

			mbs.setMbId(mbId);
			mbs.setMbPw(mbPw);

			session.setAttribute("session", mbs);

/*			String cp = request.getContextPath();
			String url = cp + "/Goods/Main.action";
			
			response.sendRedirect(url);*/
			
			
			mav.setViewName("redirect:/Goods/Main.action");
			return mav;
//			return "redirect:/Goods/Main.action";

		}

		mav.addObject("str",str);
//		request.setAttribute("str", str);
		
		mav.setViewName("/Register/Register");
		return mav;
	}
	
/*	@RequestMapping(value="/Login/Login.action",method={RequestMethod.GET,RequestMethod.POST})
	public String login(MemberDTO dto,HttpServletRequest request){
		
		String mbId = request.getParameter("mbId");
		String mbPw = request.getParameter("mbPw");
		String str = "";

		dto = dao.getReadMember(mbId);

		if (dto == null) {

			str = "아이디가 존재하지 않습니다.";

		} else if (!dto.getMbPw().equals(mbPw)) {
			str = "비밀번호가 일치하지 않습니다.";

		} else {
			HttpSession session = request.getSession(true);

			MemberSession mbs = new MemberSession();

			mbs.setMbId(mbId);
			mbs.setMbPw(mbPw);

			session.setAttribute("session", mbs);

			return "redirect:/Goods/Main.action";
		}

		request.setAttribute("str", str);

		return "/Register/Register";
		
	}*/


	@RequestMapping(value="/My/MyProfile.action",method={RequestMethod.GET,RequestMethod.POST})
	public String MyProfile(HttpServletRequest request){
		
		String cp = request.getContextPath();
		
		String imagePath = cp + "/pds/imageFile";

		HttpSession session = request.getSession();

		MemberSession mbs =
				(MemberSession)session.getAttribute("session");

		MemberDTO dto = dao.getReadMember(mbs.getMbId());

		request.setAttribute("dto", dto);
		request.setAttribute("imagePath", imagePath);
		
		return "/My/MyProfile";
		
	}
	
	
	@RequestMapping(value="/Comm/PhotoUpload_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String photoUpload(HttpServletRequest request){
		
		HttpSession session = request.getSession();

		MemberSession mbs =
				(MemberSession)session.getAttribute("session");


		String encType = "UTF-8";
		int maxSize = 5*1024*1024;
		
/*		MultipartRequest mr =
				new MultipartRequest(request, myPath, maxSize, encType,
						new DefaultFileRenamePolicy());

		if(mr.getFile("mbPic")!=null){

			String mbPic = mr.getFilesystemName("mbPic");

			dao.updatePicture(mbPic,mbs.getMbId());

		}*/

		return "Comm/complete";
	}
	
	
/*	@RequestMapping(value="/Goods/GDetail.action",method={RequestMethod.GET,RequestMethod.POST})
	public String gDetail(HttpServletRequest request){

		int brNum = Integer.parseInt(req.getParameter("brNum"));

		//board꺼
		BoardDTO dto = dao.getReadData(brNum);

		//board꺼
		dao.updateBrCount(brNum);
		
		//board꺼
		List<String> op = dto.getBrOptionsList();


		int cgNum = dto.getCgNum();
		CategoryDTO cgdto = dao.getReadCategory(cgNum);
		String category1 = cgdto.getCgCategory1();
		String category2 = cgdto.getCgCategory2();

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

			if(cdto.getCmContent().contains("\r\n")) {
				String[] a = cdto.getCmContent().split("\r\n");
				subject[i] = a[0];
			} else {
				String a = cdto.getCmContent();
				subject[i] = a;
			}

			cdto.setCmContent(cdto.getCmContent().replaceAll("\n", "<br/>"));
			newLists.add(cdto);
		}
		request.setAttribute("lists", newLists);
		request.setAttribute("subject", subject);

		request.setAttribute("nickName", nickName);
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("op", op);
		request.setAttribute("imagePath", imagePath);
		request.setAttribute("dto", dto);
		request.setAttribute("brNum", brNum);

		return "Goods/GDetail";
	}*/

	@RequestMapping(value="/My/UpdateMyProfile.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updateMyProfile(MemberDTO dto,HttpServletRequest request){
	
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
	
	@RequestMapping(value="/My/ChangePw.action",method={RequestMethod.GET,RequestMethod.POST})
	public String changePw(HttpServletRequest request){

		HttpSession session = request.getSession();

		MemberSession mbs =
				(MemberSession)session.getAttribute("session");

		String mbId = mbs.getMbId();

		String changeMbPw1 = request.getParameter("changeMbPw1");

		dao.updatePwMember(mbId, changeMbPw1);
		
		return "redirect:/My/MyAccount.action";

	}
			
	@RequestMapping(value="/Out.action",method={RequestMethod.GET,RequestMethod.POST})
	public String out(HttpServletRequest request){		

		HttpSession session = request.getSession();
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		String str = "";


		String mbId = mbs.getMbId();

		int result = dao.deleteMember(mbId);

		if(result!=0){
			str = "";
			request.setAttribute("str", str);
			session.invalidate();
		}
		
		return "Registr/Register";
		
	}
}
