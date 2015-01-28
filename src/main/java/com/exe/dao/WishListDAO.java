package com.exe.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.BoardDTO;
import com.exe.dto.WishListDTO;

public class WishListDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate)
			throws Exception {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int wiMaxNum(){
		
		int result=0;
		
		result = sessionTemplate.selectOne("wishList.wiMaxNum");
		
		return result;
	}
	
	public void wiInsert(WishListDTO dto){
		
		sessionTemplate.insert("wishList.wiInsert", dto);
		
	}
	
	public List<BoardDTO> selectWishList(){
		
		List<BoardDTO> lists = sessionTemplate.selectList("wishList.selectWishList");
		
		return lists;
	}
	
	public void delWishList(int brNum,String mbId){
		
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("brNum", brNum);
		params.put("mbId", mbId);
		
		sessionTemplate.delete("wishList.delWishList", params);
	}
	
	public List<WishListDTO> searchWishList(String mbId){
		
		List<WishListDTO> lists = sessionTemplate.selectList("wishList.searchWishList", mbId);
		
		return lists;
	}

}
