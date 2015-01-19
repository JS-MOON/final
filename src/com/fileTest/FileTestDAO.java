package com.fileTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FileTestDAO {
	
	private Connection conn = null;
	
	public FileTestDAO(Connection conn) {
		this.conn = conn;
	}
	
	//num�� �ִ밪
	public int getMaxNum(){
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(max(num),0) from fileTest";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				maxNum = rs.getInt(1);
			}
			
			pstmt.close();
			rs.close();
	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;

	}
	
	//�Է�
	public int insertData(FileTestDTO dto){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into fileTest(num,subject,saveFileName,originalFileName) ";
			sql += "values(?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			pstmt.setString(4, dto.getOriginalFileName());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	
	}
	
	//�ϳ��� ������ �б�
	public FileTestDTO getReadData(int num){
		FileTestDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select num,subject,saveFileName,originalFileName from fileTest where num=? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dto = new FileTestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
			}
			
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	
	}
	
	//��� ������ �б�
	public List<FileTestDTO> getLists(){
		
		List<FileTestDTO> lists = new ArrayList<FileTestDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select num,subject,saveFileName,originalFileName from fileTest order by num desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				FileTestDTO dto = new FileTestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
				lists.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
		
	}
	
	
	//����
	public int deleteData(int num){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete fileTest where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
