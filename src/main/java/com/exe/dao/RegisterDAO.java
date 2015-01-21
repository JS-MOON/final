package com.exe.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;

public class RegisterDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//ȸ������ ����
	public void insertMember(MemberDTO dto){
		
		sessionTemplate.insert("memberMapper.insertMember",dto);
		
	}
	
	//���Ե������ִ��� Ȯ��(�����Ҷ�)
	public MemberDTO registerMemberData(String mbId){
		
		MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectRegisterMember", mbId);
		
		return dto;
	}
	
	//ȸ����������
	public MemberDTO getReadMember(String mbId){
		
		MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectReadMember", mbId);
		
		return dto;
		
	}
	
	//ȸ��Ż��
	public int deleteMember(String mbId){

		int result = sessionTemplate.delete("memberMapper.deleteMember",mbId);
		
		return result;
	}
	
	//�������� ��������
	public void updatePicture(String mbId,String mbPic){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mbId", mbId);
		map.put("mbPic", mbPic);
		
		sessionTemplate.update("memberMapper.updatePicMember",map);
	
	}
	
	//������������(�г���,�ڱ�Ұ�)
	public void updateMyMember(MemberDTO dto){
		
		sessionTemplate.update("memberMapper.updateMyMember",dto);
	}
	
	//��й�ȣ����
	public void updatePwMember(String mbId, String changeMbPw1){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mbId", mbId);
		map.put("mbPw", changeMbPw1);
		
		sessionTemplate.update("memberMapper.updatePwMember",map);
	}
	
	
}
