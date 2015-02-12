package com.exe.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.exe.dto.CommentsDTO;

import java.util.List;

public class CommentsDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	
	public int cmMaxNum(){
		int result = 0;
		
		result = sessionTemplate.selectOne("comments.cmMaxNum");
		return result;
	}
	
	public void cmInsert(CommentsDTO dto){
		
		sessionTemplate.insert("comments.cmInsert", dto);
		
	}
	
	public List<CommentsDTO> cmList(int brNum) {
		List<CommentsDTO> lists = sessionTemplate.selectList("comments.cmList", brNum);
		return lists;
	}


}
