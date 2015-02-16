package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.HistoryDTO;
import com.exe.dto.PayMentDTO;

public class HistoryDAO {
	
	private SqlSessionTemplate sessionTemplate;


	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int hsMaxNum(){
		int result=0;
		
		result = sessionTemplate.selectOne("history.hsMaxNum");
		
		return result;
	}
	
	public void hsInsert(HistoryDTO hdto){
		sessionTemplate.insert("history.hsInsert", hdto);
		
	}
	
	public List<HistoryDTO> selectHistory(String mbId){
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectHistory",mbId);
		return lists;
	}
	
	public List<HistoryDTO> selectSellHistory(String mbId){
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectSellHistory",mbId);
		return lists;
	}
	
	public int hsPriceSum(String mbId){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("history.hsPriceSum", mbId);
		
		return result;
	}
	
	public void hsInsertPay(PayMentDTO pdto){
		
		sessionTemplate.insert("history.hsInsertPay",pdto);
	}
	
	public void insertBankData(PayMentDTO pdto){
		
		sessionTemplate.insert("history.insertBankData",pdto);
		
	}
	
	public int selectPayment(String mbId){
		


		int result = 0;
		
		result = sessionTemplate.selectOne("history.selectBankData",mbId);
		
		return result;
				
	}
	
	public List<PayMentDTO> selectBanklistAll(String mbId){
		
		List<PayMentDTO> lists = sessionTemplate.selectList("history.selectBanklistAll",mbId);
		
		return lists;
		
	}
	
	
	//출금액 리스트 출력
	public List<PayMentDTO> selectBanklist(String mbId,String sDate,String eDate){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mbId", mbId);
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		
		List<PayMentDTO> lists = sessionTemplate.selectList("history.selectBanklist",map);
		
		return lists;
	}
	
	//출금 날짜 몇년 몇월 ~ 몇년 몇월까지!
	public PayMentDTO selectBankDayMax(String mbId){
		
		PayMentDTO pdto = sessionTemplate.selectOne("history.selectBankDayMax",mbId);
		
		return pdto;
		
		
	}
	
	//오름차순
	public List<PayMentDTO> selectBankPayUp(String mbId){
		
		List<PayMentDTO> lists = sessionTemplate.selectList("history.selectBankPayUp",mbId);
		
		return lists;

	}
	
	
	
	
/*	//출금액 날짜 사이 출력하기
	public List<PayMentDTO> selectBankDay(String sDate, String eDate ){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		
		List<PayMentDTO> lists = sessionTemplate.selectList("history.selectBankDay",map);
		
		return lists;
		
	}*/
	
	

}
