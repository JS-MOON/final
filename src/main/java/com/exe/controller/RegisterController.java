package com.exe.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exe.dao.PointDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.EmailAuthDAO;
import com.exe.dao.RegisterDAO;
import com.exe.dto.EmailAuthDTO;
import com.exe.dto.MemberDTO;
import com.exe.dto.MemberSession;

@Controller
public class RegisterController {

    @Autowired
    @Qualifier("registerDAO")
    RegisterDAO dao;

    @Autowired
    @Qualifier("emailAuthDAO")
    EmailAuthDAO eadao;

    @Autowired
    @Qualifier("pointDAO")
    PointDAO pdao;

    @Autowired
    private JavaMailSender mailSender;

    //회원가입
    @RequestMapping(value = "/Register/Register.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String register(HttpServletRequest request,HttpServletResponse response) {

        String mbId = request.getParameter("mbId");
        String mbPw1 = request.getParameter("mbPw1");
        String mbPic = "img_profile_img_blank_120x120.png";
        String str = "";

        MemberDTO dto = dao.registerMemberData(mbId);

        if (dto != null) {
            str = "아이디가 존재합니다.";
        } else {
            dto = new MemberDTO();
            dto.setMbId(mbId);
            dto.setMbPw(mbPw1);
            dto.setMbPic(mbPic);
            dto.setMbNickName("닉네임미지정");
            dao.insertMember(dto);

            EmailAuthDTO eadto = new EmailAuthDTO();
            int maxNum = eadao.eaMaxNum();
            int authCode = mbId.hashCode();

            eadto.setAuthNum(maxNum+1);
            eadto.setMbId(mbId);
            eadto.setEmailAuth(0);
            eadto.setAuthCode(authCode);
            eadao.eaInsert(eadto);

            HttpSession session = request.getSession(true);

            MemberSession mbs = new MemberSession();
            mbs.setMbId(mbId);
            mbs.setMbPw(mbPw1);

            try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
                messageHelper.setTo(mbId);
                messageHelper.setSubject("[TALENT]가입을 축하드립니다.");
                messageHelper.setText("안녕하세요. 'TALENT'입니다.\n"+"["+mbId+"]고객님의 가입을 축하드립니다.\n"
                        +"email인증을 하려면 다음 링크를 클릭하세요.\n"+"http://192.168.16.9:8080/final/Register/EmailAuth.action?code="+ authCode);
                mailSender.send(message);
            } catch(Exception e){
                System.out.println(e);
            }

            session.setAttribute("session", mbs);

            return "redirect:/Goods/Main.action";
        }
        request.setAttribute("str", str);

        return "/Register/Register";

    }

    //회원가입 후
    @RequestMapping(value = "/Register/Register_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String register_ok() {

        return "redirect:/Goods/Main.action";
    }

    //로그인
    @RequestMapping(value = "/Login/Login.action")
    public ModelAndView login(HttpServletRequest request,
                              HttpServletResponse response, MemberDTO dto) throws Exception {

        ModelAndView mav = new ModelAndView();

        String previousURL = request.getParameter("currentURL");

        String mbId = request.getParameter("mbId");
        String mbPw = request.getParameter("mbPw");
        String str = "";

        dto = dao.getReadMember(mbId);

        if (dto == null) {
            str = "아이디가 없습니다.";
        } else if (!dto.getMbPw().equals(mbPw)) {
            str = "비밀번호가 틀렸습니다.";
        } else {
            HttpSession session = request.getSession(true);

            MemberSession mbs = new MemberSession();
            mbs.setMbId(mbId);
            mbs.setMbPw(mbPw);
            mbs.setPtPoint(pdao.ptGetSum(mbId));

            session.setAttribute("session", mbs);
			/*
			 * String cp = request.getContextPath(); String url = cp +
			 * "/Goods/Main.action";
			 * 
			 * response.sendRedirect(url);
			 */
            if(previousURL==null)
                mav.setViewName("redirect:/Goods/Main.action");
            else
                mav.setViewName("redirect:" + previousURL);
            return mav;

        }

        mav.addObject("str", str);
        mav.setViewName("/Register/Register");

        return mav;

    }

    @RequestMapping(value = "/Register/Login.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(HttpServletRequest request) {

        return "/Register/Login";
    }

    //프로필 관리
    @RequestMapping(value = "/My/MyProfile.action", method = {RequestMethod.GET, RequestMethod.POST})
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

    //사진 업로드 창 띄우기
    @RequestMapping(value = "/Comm/PhotoUpload.aciton", method = {RequestMethod.GET, RequestMethod.POST})
    public String photoUpload(HttpServletRequest request) {

        HttpSession session = request.getSession();

        MemberSession mbs = (MemberSession) session.getAttribute("session");

        return "Comm/PhotoUpload";
    }

    //사진 업로드 실행
    @RequestMapping(value = "/Comm/PhotoUpload_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String photoUpload_ok(MultipartHttpServletRequest multipartrRequest,HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();

        MemberSession mbs = (MemberSession) session.getAttribute("session");

        String path = multipartrRequest.getSession().getServletContext().getRealPath("/WEB-INF/images/Profile/");

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

                FileOutputStream fos = new FileOutputStream(path + "/"+ mbId + originalFileName);
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

                dao.updatePicture(mbs.getMbId(),mbPicData );

                is.close();
                fos.close();

            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        return "Comm/complete";

    }

    //프로필 업데이트
    @RequestMapping(value = "/My/UpdateMyprofile.action", method = {RequestMethod.GET, RequestMethod.POST})
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

    //비밀번호 변경
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

    //계좌번호 변경
    @RequestMapping(value = "/My/ChangeBankMember.action", method = {
            RequestMethod.GET, RequestMethod.POST })
    public String changeBk(HttpServletRequest request,MemberDTO dto) {

        HttpSession session = request.getSession();
        MemberSession mb = (MemberSession)session.getAttribute("session");

        dto.setMbId(mb.getMbId());

        dao.updateBankMember(dto);

        return "redirect:/My/MyAccount.action";

    }

    @RequestMapping(value = "/My/Out.action", method={RequestMethod.GET,RequestMethod.POST})

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

    //회원 가입시 메일 발송
    @RequestMapping(value = "/Register/EmailAuth.action", method = {RequestMethod.GET,RequestMethod.POST})
    public String emailAuth(HttpServletRequest request) {

        String str = "";
        int code = Integer.parseInt(request.getParameter("code"));

        EmailAuthDTO dto = eadao.searchAuth(code);

        if(dto!=null){

            if(dto.getEmailAuth()==1){
                str = "이미 인증 된 이메일 입니다.";
                request.setAttribute("str", str);
                return "Register/Register";
            }
            eadao.updateEmailAuth(code);
            str = dto.getMbId() + "님 인증이 성공하였습니다.";
        }else{
            str = "인증 실패!! 관리자에게 문의하시기 바랍니다.";
        }

        request.setAttribute("str", str);

        return "Register/Register";

    }

}

