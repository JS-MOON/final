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
	
	public List<HistoryDTO> selectHistory(String mbId){
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectHistory",mbId);
		return lists;
	}
	
	public List<HistoryDTO> selectSellHistory(String mbId,String searchSellValue){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("mbId", mbId);
		hMap.put("searchSellValue", searchSellValue);
		
		List<HistoryDTO> lists = sessionTemplate.selectList("history.selectSellHistory",hMap);
		return lists;
	}

}
