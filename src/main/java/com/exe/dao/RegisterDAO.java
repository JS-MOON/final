package com.exe.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;

public class RegisterDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//회원가입 정보
	public void insertMember(MemberDTO dto){
		
		sessionTemplate.insert("memberMapper.insertMember",dto);
		
	}
	
	//가입된정보있는지 확인(가입할때)
	public MemberDTO registerMemberData(String mbId){
		
		MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectRegisterMember", mbId);
		
		return dto;
	}
	
	//회원개인정보
	public MemberDTO getReadMember(String mbId){
		
		MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectReadMember", mbId);
		
		return dto;
		
	}
	
	//회원탈퇴
	public int deleteMember(String mbId){

		int result = sessionTemplate.delete("memberMapper.deleteMember",mbId);
		
		return result;
	}
	
	//개인정보 사진수정
	public void updatePicture(String mbId,String mbPic){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mbId", mbId);
		map.put("mbPic", mbPic);
		
		sessionTemplate.update("memberMapper.updatePicMember",map);
	
	}
	
	//개인정보수정(닉네임,자기소개)
	public void updateMyMember(MemberDTO dto){
		
		sessionTemplate.update("memberMapper.updateMyMember",dto);
	}
	
	//비밀번호수정
	public void updatePwMember(String mbId, String changeMbPw1){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mbId", mbId);
		map.put("mbPw", changeMbPw1);
		
		sessionTemplate.update("memberMapper.updatePwMember",map);
	}
	
	
}
