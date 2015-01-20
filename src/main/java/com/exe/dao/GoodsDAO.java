package com.exe.dao;

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

	public BoardDTO getReadData(int brNum) {

		BoardDTO dto = sessionTemplate.selectOne("GoodsMapper.getReadData",
				brNum);

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
	
}
