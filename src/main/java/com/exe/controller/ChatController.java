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
		String brNum = req.getParameter("brNum");
		System.out.println(req.getParameter("brNum")+"게시판 번호");
		req.setAttribute("brNum", brNum);
		
		return "Chat/QAChat";
	}
	
	
	@RequestMapping(value="/Chat/QAChat_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String qaChat_ok
	(HttpServletRequest req, HttpServletResponse rsp,String msg){
		System.out.println(1);
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		String sender = mbs.getMbId();
		
		String msgContent = msg;
			
		int brNum =Integer.parseInt(req.getParameter("brNum"));
		System.out.println(brNum+"오나오노");
		int msgNum = MsgDao.hsMaxNum();
		
		BoardDTO dto = GoodsDao.getReadData(brNum);
		
		String receiver = dto.getMbId();
			
		MsgDTO msgDTO = new MsgDTO();
		
		msgDTO.setMsgNum(msgNum+1);
		msgDTO.setMsgContent(msgContent);
		msgDTO.setSender(sender);
		msgDTO.setReceiver(receiver);
		msgDTO.setBrNum(brNum);
		
		MsgDao.insertMsg(msgDTO);
		
		List<MsgDTO> msgAllDTO = MsgDao.selectAll(sender, receiver, brNum);
		
		req.setAttribute("msgAllDTO", msgAllDTO);
		req.setAttribute("brNum", brNum);
			
		return "Chat/QAChat_ok";
		
		
		
	}
	
	@RequestMapping(value="/Chat/QAChat_ok2.action",method={RequestMethod.GET,RequestMethod.POST})
	public String qaChat_ok2
	(HttpServletRequest req, HttpServletResponse rsp,String msg, MsgDTO msgDTO){
		
		int brNum =Integer.parseInt(req.getParameter("brNum"));
		
		HttpSession session = req.getSession();
		
		MemberSession mbs = (MemberSession)session.getAttribute("session");
		
		String sender = mbs.getMbId();
		
		BoardDTO dto = GoodsDao.getReadData(brNum);
		String receiver = dto.getMbId();
		
		List<MsgDTO> msgAllDTO = MsgDao.selectAll(sender, receiver, brNum);
		
		
		req.setAttribute("msgAllDTO", msgAllDTO);
		req.setAttribute("brNum", brNum);
		return  "Chat/QAChat_ok";
	}
	
	@RequestMapping(value="/Chat/QAChat_ok3.action",method={RequestMethod.GET,RequestMethod.POST})
	public String qaChat_ok3
	(HttpServletRequest req, HttpServletResponse rsp,String msg, MsgDTO msgDTO){
		
		int brNum =Integer.parseInt(req.getParameter("brNum"));
		
		System.out.println(msgDTO.getReceiver()+msgDTO.getSender()+msgDTO.getBrNum());
		
		BoardDTO dto = GoodsDao.getReadData(brNum);
		String receiver = dto.getMbId();
		
		List<MsgDTO> mDTO = MsgDao.selectReceiver(receiver);
		
		
		for(int i=0;i<mDTO.size();i++){
			MsgDTO msgDTO1 = mDTO.get(i);
			String sender = msgDTO1.getSender();
			List<MsgDTO> msgReceiver = MsgDao.selectAll(sender, receiver, brNum);
			
			req.setAttribute("msgReceiver", msgReceiver);
			req.setAttribute("brNum", brNum);
			
		}
		
		
		
		/*List<MsgDTO> msgReceiver = MsgDao.selectReceiver(receiver);
		
		
		req.setAttribute("msgReceiver", msgReceiver);*/
		
	/*	List<MsgDTO> msgAllDTO = MsgDao.selectAll(sender, receiver);
		
		req.setAttribute("msgAllDTO", msgAllDTO);
	*/	
		return  "Chat/QAChat_ok";
		
	}

}
