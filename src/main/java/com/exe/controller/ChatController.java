package com.exe.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.exe.dao.GoodsDAO;
import com.exe.dao.MsgDAO;
import com.exe.dto.BoardDTO;
import com.exe.dto.MemberSession;
import com.exe.dto.MsgDTO;

@Controller
public class ChatController {
	
	@Autowired
	MsgDAO MsgDao;
	
	@Autowired
	GoodsDAO GoodsDao;
	
	@RequestMapping(value="/Chat/QAChat.action",method={RequestMethod.GET,RequestMethod.POST})
	public String qaChat(HttpServletRequest req, HttpServletResponse rsp){
		
		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession) session.getAttribute("session");
		int brNum = Integer.parseInt(req.getParameter("brNum")); 
		String sender = req.getParameter("sender");
		String receiver = req.getParameter("receiver");
		String mbId = "";
		
		if(session.getAttribute("session") == null){
		
			String str = "로그인이 필요합니다.";
			req.setAttribute("str", str);
			return "Register/Register";
			
		}else if(session.getAttribute("session")!=null){
			
			mbId = mbs.getMbId();
			BoardDTO dto = GoodsDao.getReadData(brNum);
			sender = mbs.getMbId();
			receiver = dto.getMbId();
			
			if(req.getParameter("id")!=null){
				sender = req.getParameter("id");
				receiver = mbs.getMbId();
			}
			
			List<MsgDTO> lists = MsgDao.selectAll(sender,receiver,brNum);
			
			req.setAttribute("mbId", mbId);
			req.setAttribute("lists", lists);
			req.setAttribute("brNum", brNum);
			
			return "Chat/QAChat";
		}

		return "Chat/QAChat";
	}
	
	
	@RequestMapping(value="/Chat/QAChat_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String qaChat_ok(HttpServletRequest req, HttpServletResponse rsp,String msg){
		
		HttpSession session = req.getSession();
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		String mbId = mbs.getMbId();
		String sender = mbId;
		
		
		int brNum =Integer.parseInt(req.getParameter("brNum"));

		System.out.println("1." + mbId + brNum);

		String receiver = GoodsDao.getReadData(brNum).getMbId();
		
		MsgDTO dto = MsgDao.selectOne(mbId, brNum);
		
		if(dto != null && dto.getReceiver()!=null && dto.getReceiver().equals(sender)){
			receiver = dto.getSender();
		}else if(dto != null && dto.getReceiver()!=null && !dto.getReceiver().equals(sender)){
			receiver = dto.getReceiver();
		}

		MsgDTO msgDTO = new MsgDTO();
		
		msgDTO.setMsgNum(msgNum+1);
		msgDTO.setMsgContent(msg);
		msgDTO.setSender(sender);
		msgDTO.setReceiver(receiver);
		msgDTO.setBrNum(brNum);
		
		MsgDao.insertMsg(msgDTO);
		
		return "redirect:/Chat/QAChat.action?brNum=" + brNum +"&id="+ receiver;
		
	}

}

