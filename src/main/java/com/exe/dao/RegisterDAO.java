package com.exe.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;


public class RegisterDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//�쉶�썝媛��엯
	public void insertMember(MemberDTO dto){
		
		sessionTemplate.insert("memberMapper.insertMember",dto);
		
	}
	
	//媛��엯�씠�젰�솗�씤
	public MemberDTO registerMemberData(String mbId){
		
		MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectRegisterMember", mbId);
		
		return dto;
	}
	
	//媛쒖씤�젙蹂�
	public MemberDTO getReadMember(String mbId){
		
		MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectReadMember", mbId);
		
		return dto;
		
	}
	
	//�쉶�썝�깉�눜
	public int deleteMember(String mbId){

		int result = sessionTemplate.delete("memberMapper.deleteMember",mbId);
		
		return result;
	}
	
	//�궗吏꾩닔�젙
	public void updatePicture(String mbId,String mbPic){
		
		System.out.println(mbId + mbPic);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mbId", mbId);
		map.put("mbPic", mbPic);
		
		sessionTemplate.update("memberMapper.updatePicMember",map);
	
	}
	
	//�쉶�썝�젙蹂댁닔�젙(�땳�꽕�엫,�냼媛쒓�)
	public void updateMyMember(MemberDTO dto){
		
		sessionTemplate.update("memberMapper.updateMyMember",dto);
	}
	
	//鍮꾨�踰덊샇�닔�젙
	public void updatePwMember(String mbId, String changeMbPw1){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mbId", mbId);
		map.put("mbPw", changeMbPw1);
		
		sessionTemplate.update("memberMapper.updatePwMember",map);
	}
	
	
	//은행계좌
		public void updateBankMember(MemberDTO dto){
		
			Map<String, Object> hMap = new HashMap<String, Object>();
			
			hMap.put("mbId", dto.getMbId());
			hMap.put("bank", dto.getBank());
			hMap.put("bkNum", dto.getBkNum());
			hMap.put("name", dto.getName());
			
			
			sessionTemplate.update("memberMapper.updateBankMember",hMap);
			
		}
		
		
/*		//계좌 보여진다.
		public MemberDTO selectBankData(String mbId){
			
			MemberDTO dto = sessionTemplate.selectOne("memberMapper.selectBankData",mbId);
			
			return dto;
			
		}
	*/
	
	
	
}
