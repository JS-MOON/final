package com.exe.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.exe.dto.EmailAuthDTO;

public class EmailAuthDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	@Autowired
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int eaMaxNum(){
		int result = 0;
		
		result = sessionTemplate.selectOne("emailAuth.eaMaxNum");
		return result;
	}
	
	public void eaInsert(EmailAuthDTO dto){
		
		sessionTemplate.insert("emailAuth.eaInsert", dto);
		
	}
	
	public EmailAuthDTO searchAuth(int code) {
		return sessionTemplate.selectOne("emailAuth.searchAuthByCode", code);	
	}
	
	public int selectAuthState(String mbId) {
		return sessionTemplate.selectOne("emailAuth.selectAuthState", mbId);
	}
	
	public void updateEmailAuth(int code) {
		
		sessionTemplate.update("emailAuth.updateMailAuth", code);
		
	}
	

}
