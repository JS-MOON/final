package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MsgDTO;

public class MsgDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int hsMaxNum(){
		int result=0;
		
		result = sessionTemplate.selectOne("msg.hsMaxNum");
		
		return result;
	}
	
	public void insertMsg(MsgDTO dto){
		
		sessionTemplate.insert("msg.insertMsg",dto);
		
	}
	
	public List<MsgDTO> selectMsg(String sender){
		List<MsgDTO> lists = sessionTemplate.selectList("msg.selectSender",sender);
		return lists;
	}
	
	public List<MsgDTO> selectReceiver(String receiver){


		List<MsgDTO> lists = sessionTemplate.selectList("msg.selectReceiver",receiver);
		return lists;
	}
	
	public List<MsgDTO> selectAll(String sender, String receiver, int brNum){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("sender", sender);
		params.put("receiver", receiver);
		params.put("brNum", brNum);
		
		List<MsgDTO> lists = sessionTemplate.selectList("msg.selectAll",params);
		
		return lists;
	}
	
	public List<MsgDTO> selectMsgAll(String mbId){

		List<MsgDTO> lists = sessionTemplate.selectList("msg.selectMsgAll",mbId);
		
		return lists;
	}
	
	public MsgDTO selectOne(String mbId, int brNum) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("mbId", mbId);
		params.put("brNum", brNum);
		
		MsgDTO dto = sessionTemplate.selectOne("msg.selectMsgOne", params);
		
		return dto;
	}
	
}
