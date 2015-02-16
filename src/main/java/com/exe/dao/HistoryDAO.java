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
	
	public int myOrderMngDataCount(String mbId,String searchBuyValue){
		
		int result = 0;
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("mbId", mbId);
		hMap.put("searchValue", searchBuyValue);
		result = sessionTemplate.selectOne("history.myOrderMngDataCount",hMap);
		return result;
		
	}

    public int sellMngDataCount(String mbId,String searchSellValue){

        int result = 0;
        HashMap<String, Object> hMap = new HashMap<String, Object>();
        hMap.put("mbId", mbId);
        hMap.put("searchValue", searchSellValue);
        result = sessionTemplate.selectOne("history.sellMngDataCount",hMap);
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
	
	public List<HistoryDTO> selectSellHistory(String mbId,int start,int end,String searchSellValue){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("mbId", mbId);
        hMap.put("start", start);
        hMap.put("end", end);
		hMap.put("searchSellValue", searchSellValue);
		
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectSellHistory",hMap);
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
