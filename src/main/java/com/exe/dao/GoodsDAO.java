package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<BoardDTO> mainWishList(String mbId) {

		List<BoardDTO> lists = sessionTemplate
				.selectList("GoodsMapper.mainWishList",mbId);

		return lists;

	}
	
	public List<BoardDTO> mainCountList(){
		
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
	
	public String onePhoto(int brNum) {
		
		String mainPhoto = sessionTemplate.selectOne("GoodsMapper.onePhoto", brNum);
		
		return mainPhoto;
		
	}
	//gDetail end
	
	//gList start
	public List<BoardDTO> list(int start, int end) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.firstGlist",params);
	
		return lists;
	}
	
	public List<BoardDTO> wishlist(int start, int end,String mbId) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("mbId", mbId);
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.firstGWishlist",params);
	
		return lists;
	}

	public List<BoardDTO> list(int start, int end,String column,String order) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("column", column);
		params.put("order", order);

		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.gList",params);
		
		System.out.println("lists : " + sessionTemplate.selectList("GoodsMapper.gList",params));
		
		return lists; 
	}
	
	public List<BoardDTO> wishlist(int start, int end,String column,String order,String mbId) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("column", column);
		params.put("order", order);
		params.put("mbId", mbId);

		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.gWishList",params);
		
		System.out.println("wishlists : " + sessionTemplate.selectList("GoodsMapper.gWishList",params));
		
		return lists; 
	}
	
	public List<CategoryDTO> getReadCategory(int start,int end){
		
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
	
	public List<BoardDTO> selectWishSubject(String searchValue,String mbId){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("searchValue", searchValue);
		params.put("mbId", mbId);
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.selectWishSubject", params);
		
		return lists;
		
	}
	public void boardInsert(BoardDTO dto){
		
		sessionTemplate.insert("GoodsMapper.boardInsert",dto);
	}

	public int brMaxNum(){
		int result = 0;
		result = sessionTemplate.selectOne("GoodsMapper.brMaxNum");
		
		return result;
	}
	

	public List<BoardDTO> myBoardList(String mbId){
		
		List<BoardDTO> lists = sessionTemplate.selectList("GoodsMapper.myBoardList",mbId);
		
		return lists;
		
	}
	
	public void myBoardDelete(int brNum){
		
		sessionTemplate.delete("GoodsMapper.brDeleteData", brNum);
		
	}

	
}
