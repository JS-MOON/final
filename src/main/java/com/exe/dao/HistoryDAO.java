package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.HistoryDTO;

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
	
	public void hsInsert(HistoryDTO dto){
		sessionTemplate.insert("history.hsInsert", dto);
	}
	
	public int myOrderMngDataCount(String mbId,String searchBuyValue){
		
		int result = 0;
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("mbId", mbId);
		hMap.put("searchValue", searchBuyValue);
		result = sessionTemplate.selectOne("history.myOrderMngDataCount",hMap);
		return result;
		
	}
	
	public List<HistoryDTO> selectHistory(String mbId,int start,int end,String searchBuyValue){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("mbId", mbId);
		hMap.put("start", start);
		hMap.put("end", end);
		hMap.put("searchValue", searchBuyValue);
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectHistory",hMap);
		return lists;
	}
	
	public List<HistoryDTO> selectSellHistory(String mbId,String searchSellValue){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("mbId", mbId);
		hMap.put("searchSellValue", searchSellValue);
		
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectSellHistory",hMap);
		return lists;
	}
	
	public void updateSellerProgress(int hsNum){
		
		sessionTemplate.update("history.updateSellerProgress",hsNum);
	}
	
	public void updateMemberProgress(int hsNum){
		
		sessionTemplate.update("history.updateMemberProgress",hsNum);
	}
	
	public void updateCancelProgress(int hsNum){
		
		sessionTemplate.update("history.updateCancelProgress",hsNum);
	}
	
	public int selectCountBuyOnGoing(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountBuyOnGoing",mbId);
		return result;
	}
	
	public int selectCountBuyChecked(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountBuyChecked",mbId);
		return result;
	}
	
	public int selectCountBuyCompleted(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountBuyCompleted",mbId);
		return result;
	}
	
	public int selectCountBuyCanceled(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountBuyCanceled",mbId);
		return result;
	}
	
	public int selectCountSellOnGoing(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountSellOnGoing",mbId);
		return result;
	}
	
	public int selectCountSellChecked(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountSellChecked",mbId);
		return result;
	}
	
	public int selectCountSellCompleted(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountSellCompleted",mbId);
		return result;
	}
	
	public int selectCountSellCanceled(String mbId){
		int result = sessionTemplate.selectOne("history.selectCountSellCanceled",mbId);
		return result;
	}

}
