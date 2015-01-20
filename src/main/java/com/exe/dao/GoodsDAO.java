package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.BoardDTO;
import com.exe.dto.CategoryDTO;
import com.exe.dto.CommentsDTO;
import com.exe.dto.MemberDTO;

public class GoodsDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate)
			throws Exception {
		this.sessionTemplate = sessionTemplate;
	}

	
	//mainaction start
	public List<BoardDTO> newTalentList() {

		List<BoardDTO> lists = sessionTemplate
				.selectList("GoodsMapper.newTalentList");

		return lists;

	}

	public List<BoardDTO> mainCountList() {

		List<BoardDTO> lists = sessionTemplate
				.selectList("GoodsMapper.mainCountList");

		return lists;

	}
	
	//mainaction end

	//gDetail start
	public BoardDTO getReadData(int brNum) {

		BoardDTO dto = sessionTemplate.selectOne("GoodsMapper.getReadData",brNum);

		return dto;

	}

	public void updateBrCount(int brNum) {

		sessionTemplate.update("GoodsMapper.updateBrCount", brNum);

	}

	public CategoryDTO getReadCategory(int cgNum) {

		CategoryDTO dto = sessionTemplate.selectOne("GoodsMapper.getReadCategory", cgNum);
		
		return dto;

	}
	
	public List<BoardDTO> list(int cgNum){
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.list", cgNum);
		
		return lists;
		
	}
	
	public MemberDTO getReadMember(String mbId) {
		
		MemberDTO dto = sessionTemplate.selectOne("GoodsMapper.getReadMember", mbId);
		
		return dto;

	}
	
	public List<CommentsDTO> cmList(int brNum) {
	 List<CommentsDTO> lists = sessionTemplate.selectList("GoodsMapper.cmList", brNum);
	 
	 return lists;
	}
	//gDetail end
	
	//gList start
	public List<BoardDTO> list(int start, int end) {//카테고리 정렬방식 없는 경우
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.firstGlist",params);
	
		return lists;
	}

	public List<BoardDTO> list(int start, int end,String column,String order) {//카테고리 정렬방식 있는 경우
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("column", column);
		params.put("order", order);
		
		System.out.println(start);
		System.out.println(end);
		System.out.println(column);
		System.out.println(order);
		
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.gList",params);
		
		return lists; 
	}
	
	public List<CategoryDTO> getReadCategory(int start,int end){//카테고리 검색
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		
		
		List<CategoryDTO> lists = sessionTemplate.selectList("GoodsMapper.gListgetReadCategory",params);
	
		return lists;
		
	}
	//gList end
	
	//GSearchList start
	
	public List<BoardDTO> selectSubject(String searchValue){
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.selectSubject", searchValue);
		
		return lists;
		
	}


	
}
