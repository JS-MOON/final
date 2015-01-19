package com.talent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TalentDAO {

	private Connection conn;

	public TalentDAO(Connection conn) {
		this.conn = conn;
	}

	// 회원 가입
	public int insertData(MemberDTO dto) {

		int result = 0;
		String sql;
		PreparedStatement pstmt = null;

		try {

			sql = "insert into member(mb_id,mb_pw,mb_pic) values(?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMbId());
			pstmt.setString(2, dto.getMbPw());
			pstmt.setString(3, dto.getMbPic());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	// 한사람의 데이타 선택
	public MemberDTO selectData(String mbId) {

		MemberDTO dto = null;
		String sql;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			sql = "select mb_id,mb_pw,mb_tel,mb_nickName from member where mb_id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mbId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new MemberDTO();

				dto.setMbId(rs.getString("mb_id"));
				dto.setMbPw(rs.getString("mb_pw"));
				dto.setMbTel(rs.getString("mb_tel"));
				dto.setMbNickName(rs.getString("mb_nickName"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}


	public String login(String mb_id) {

		String mb_pw_r = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select mb_pw from member where mb_id= ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mb_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mb_pw_r = rs.getString("mb_pw");

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mb_pw_r;
	}


	public MemberDTO getReadMember(String mbId) {

		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select mb_id,mb_pw,mb_nickName,mb_tel,mb_pic,mb_about from member ";
			sql += "where mb_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mbId);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new MemberDTO();

				dto.setMbId(rs.getString("mb_id"));
				dto.setMbPw(rs.getString("mb_pw"));
				dto.setMbNickName(rs.getString("mb_nickName"));
				dto.setMbTel(rs.getString("mb_tel"));
				dto.setMbPic(rs.getString("mb_pic"));
				dto.setMbAbout(rs.getString("mb_about"));

			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;


	}

	public int deleteMember(String mbId){

		PreparedStatement pstmt = null;

		String sql;
		int result = 0;

		try {

			sql = "delete member where mb_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mbId);

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	//프로필사진업로드(update)
	public int updateMember(String mbPic,String mbId){

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update member set mb_pic=? where mb_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mbPic);
			pstmt.setString(2, mbId);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;

	}

	public int updateMember(MemberDTO dto){

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update member set mb_nickName=?,mb_about=? where mb_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMbNickName());
			pstmt.setString(2, dto.getMbAbout());
			pstmt.setString(3, dto.getMbId());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}


	public int updateMember(String mbId,String changeMbPw1,String changeMbPw2){

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update member set mb_pw=? where mb_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, changeMbPw1);
			pstmt.setString(2, mbId);


			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}











	public int getMaxNum() {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(max(br_num),0) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.toString();
		}
		return result;

	}

	// board ���̺� insert
	public int BoardInsert(BoardDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into board(br_num,mb_id,cg_num,br_subject, ";
			sql += "br_mainphoto,br_morephoto,br_content,br_options,br_price,br_date,br_count) ";
			sql += "values (?,?,?,?,?,?,?,?,?,sysdate,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBrNum());
			pstmt.setString(2, dto.getMbId());
			pstmt.setInt(3, dto.getCgNum());
			pstmt.setString(4, dto.getBrSubject());
			pstmt.setString(5, dto.getBrMainPhoto());
			pstmt.setString(6, dto.getBrMorePhoto());
			pstmt.setString(7, dto.getBrContent());
			pstmt.setString(8, dto.getBrOptions());
			pstmt.setInt(9, dto.getBrPrice());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;

	}

	// 대분류로 분류해서 br_num 순으로 출력
	public List<BoardDTO> list(int start, int end) {

		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select C.cg_category1,B.mb_nickName,B.mb_pic,A.br_num,A.mb_id,A.cg_num,A.br_subject, ";
			sql += "A.br_mainphoto,A.br_morephoto,A.br_content,A.br_options,A.br_price,A.br_date,A.br_count ";
			sql += "from board A, member B, category C where A.mb_id=B.mb_id and A.cg_num>=? and A.cg_num<=? and A.cg_num=C.cg_num order by A.br_num desc";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new BoardDTO();
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setMbNickName(rs.getString("mb_nickName"));
				dto.setMbPic(rs.getString("mb_pic"));
				dto.setBrNum(rs.getInt("br_num"));
				dto.setMbId(rs.getString("mb_id"));
				dto.setCgNum(rs.getInt("cg_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrMorePhoto(rs.getString("br_morephoto"));
				dto.setBrContent(rs.getString("br_content"));
				dto.setBrOptions(rs.getString("br_options"));
				dto.setBrPrice(rs.getInt("br_price"));
				dto.setBrDate(rs.getString("br_date"));
				dto.setBrCount(rs.getInt("br_count"));
				lists.add(dto);

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}




	//대분류로 분류해서 최고가,최저가,날짜순으로 출력하기
	public List<BoardDTO> list(int start, int end,String column,String order) {

		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select C.cg_category1,B.mb_nickName,B.mb_pic,A.br_num,A.mb_id,A.cg_num,A.br_subject, ";
			sql += "A.br_mainphoto,A.br_morephoto,A.br_content,A.br_options,A.br_price,A.br_date ";
			sql += "from board A, member B, category C where A.mb_id=B.mb_id and A.cg_num>=? and A.cg_num<=? and A.cg_num=C.cg_num ";
			sql += "order by A."+column+" "+order;

			/*sql = "select B.mb_nickName,A.br_num,A.mb_id,A.cg_num,A.br_subject, ";
			sql += "A.br_mainphoto,A.br_morephoto,A.br_content,A.br_options,A.br_price,A.br_date ";
			sql += "from board A,member B where A.mb_id=B.mb_id and cg_num>=? and cg_num<=? order by A.br_num desc";*/
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);


			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new BoardDTO();
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setMbNickName(rs.getString("mb_nickName"));
				dto.setMbPic(rs.getString("mb_pic"));
				dto.setBrNum(rs.getInt("br_num"));
				dto.setMbId(rs.getString("mb_id"));
				dto.setCgNum(rs.getInt("cg_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrMorePhoto(rs.getString("br_morephoto"));
				dto.setBrContent(rs.getString("br_content"));
				dto.setBrOptions(rs.getString("br_options"));
				dto.setBrPrice(rs.getInt("br_price"));
				dto.setBrDate(rs.getString("br_date"));
				dto.setBrCount(rs.getInt("br_count"));

				lists.add(dto);

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}



	// �Խ��� ��� (�Һз��� ���)
	public List<BoardDTO> list(int cgNum) {

		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {


			sql = "select br_num,br_subject,br_mainphoto,br_price from board ";
			sql+= "where cg_num=? order by br_date desc";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cgNum);


			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new BoardDTO();

				dto.setBrNum(rs.getInt("br_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrPrice(rs.getInt("br_price"));

				lists.add(dto);

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}



	// board �Խ��� �Ѱ� select
	public BoardDTO getReadData(int brNum) {

		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select br_num,mb_id,cg_num,br_subject, ";
			sql += "br_mainphoto,br_morephoto,br_content,br_options,br_price,br_date ";
			sql += "from board where br_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				dto = new BoardDTO();
				dto.setBrNum(rs.getInt("br_num"));
				dto.setMbId(rs.getString("mb_id"));
				dto.setCgNum(rs.getInt("cg_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrMorePhoto(rs.getString("br_morephoto"));
				dto.setBrContent(rs.getString("br_content"));
				dto.setBrOptions(rs.getString("br_options"));
				dto.setBrPrice(rs.getInt("br_price"));
				dto.setBrDate(rs.getString("br_date"));

			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;

	}

	// board �Խ��� ������ ����
	public int boardDelete(int brNum) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete from board where br_Num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brNum);
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	// board�Խ��� ����
	public int boardUpdate(BoardDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "update board set br_subject=?, br_mainphoto=?, br_morephoto=?, ";
			sql += "br_content=?, br_options=?, br_price=? ";
			sql += "where br_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBrSubject());
			pstmt.setString(2, dto.getBrMainPhoto());
			pstmt.setString(3, dto.getBrMorePhoto());
			pstmt.setString(4, dto.getBrContent());
			pstmt.setString(5, dto.getBrOptions());
			pstmt.setInt(6, dto.getBrPrice());
			pstmt.setInt(7, dto.getBrNum());
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;

	}

	// cgNum���� ��з� �Һз� select
	public CategoryDTO getReadCategory(int cgNum) {

		CategoryDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select cg_category1,cg_category2 from category where cg_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cgNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new CategoryDTO();
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setCgCategory2(rs.getString("cg_category2"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;

	}





	//ī�װ� �ҷ�����
	public List<CategoryDTO> getReadCategory(int start,int end){

		List<CategoryDTO> lists = new ArrayList<CategoryDTO>();
		CategoryDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select cg_num,cg_category1,cg_category2 from category where cg_num>=? and cg_num<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while(rs.next()){
				dto = new CategoryDTO();
				dto.setCgNum(rs.getInt("cg_num"));
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setCgCategory2(rs.getString("cg_category2"));

				lists.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;

	}

	//////////////////////////////////////////////////////////////////////////
	// maxnum(cm_num)
	public int cmMaxNum() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select nvl(max(cm_num),0) from comments";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			pstmt.close();
			rs.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}

	public int cmInsert(CommentsDTO dto) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into comments(cm_num,br_num,cm_content,cm_nickName,cm_date,cm_rating) ";
			sql += "values(?,?,?,?,sysdate,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getCmNum());
			pstmt.setInt(2, dto.getBrNum());
			pstmt.setString(3, dto.getCmContent());
			pstmt.setString(4, dto.getCmNickName());
			pstmt.setInt(5, dto.getCmRating());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;

	}

	// comments
	public List<CommentsDTO> cmList(int brNum) {

		List<CommentsDTO> lists = new ArrayList<CommentsDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select cm_num,br_num,cm_content,cm_nickName,cm_date,cm_rating ";
			sql += "from comments where br_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, brNum);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				CommentsDTO dto = new CommentsDTO();

				dto.setCmNum(rs.getInt("cm_num"));
				dto.setBrNum(rs.getInt("br_num"));
				dto.setCmContent(rs.getString("cm_content"));
				dto.setCmNickName(rs.getString("cm_nickName"));
				dto.setCmDate(rs.getDate("cm_date"));
				dto.setCmRating(rs.getInt("cm_rating"));

				lists.add(dto);

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;

	}

	//GDetail 관련재능
	public List<BoardDTO> getReadRelation(int start,int end){

		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select br_num,br_subject,br_mainphoto from board ";
			sql+= "where cg_num>=? and cg_num<=? order by br_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new BoardDTO();
				dto.setBrNum(rs.getInt("br_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				lists.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}


	//history
	public int hsMaxNum() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select nvl(max(hs_num),0) from history";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				maxNum = rs.getInt(1);
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}

	public int hsInsert(HistoryDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "insert into history(hs_num,mb_id,br_num,hs_date,hs_price,hs_totalPrice,hs_options) ";
			sql += "values(?,?,?,sysdate,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getHsNum());
			pstmt.setString(2, dto.getMbId());
			pstmt.setInt(3, dto.getBrNum());
			pstmt.setInt(4, dto.getHsPrice());
			pstmt.setInt(5, dto.getHsTotalPrice());
			pstmt.setString(6, dto.getHsOptions());

			result = pstmt.executeUpdate();

			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//메인페이지 new재능순 출력
	public List<BoardDTO> newTalentList(){
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select B.cg_category1,A.br_num,A.br_subject,A.br_mainphoto,A.br_price ";
			sql+= "from board A,category B where A.cg_num=B.cg_num order by A.br_num desc";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()){

				dto = new BoardDTO();

				dto.setBrNum(rs.getInt("br_num"));
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrPrice(rs.getInt("br_price"));
				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}


	//검색해서 찾기
	public List<BoardDTO> selectSubject(String searchValue){
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue ="%" + searchValue + "%";

			sql = "select C.cg_category1,B.mb_nickName,B.mb_pic,A.br_num,A.mb_id,A.cg_num,A.br_subject, ";
			sql += "A.br_mainphoto,A.br_morephoto,A.br_content,A.br_options,A.br_price,A.br_date ";
			sql += "from board A, member B, category C where A.mb_id=B.mb_id and "
					+ "A.cg_num>=1 and A.cg_num<=109 and A.cg_num=C.cg_num and (A.br_subject like ? "
					+ "or B.mb_nickName like ?) order by A.br_num desc";



			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			pstmt.setString(2, searchValue);
			rs = pstmt.executeQuery();

			while(rs.next()){
				dto = new BoardDTO();
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setMbNickName(rs.getString("mb_nickName"));
				dto.setMbPic(rs.getString("mb_pic"));
				dto.setBrNum(rs.getInt("br_num"));
				dto.setMbId(rs.getString("mb_id"));
				dto.setCgNum(rs.getInt("cg_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrMorePhoto(rs.getString("br_morephoto"));
				dto.setBrContent(rs.getString("br_content"));
				dto.setBrOptions(rs.getString("br_options"));
				dto.setBrPrice(rs.getInt("br_price"));
				dto.setBrDate(rs.getString("br_date"));
				lists.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}

	//메인페이지 조회수 순 출력
	public List<BoardDTO> mainCountList(){
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		BoardDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select C.mb_nickName,C.mb_pic,B.cg_category1,A.br_num,A.br_subject,A.br_mainphoto,A.br_price,A.br_count ";
			sql+= "from board A,category B,member C where A.cg_num=B.cg_num and A.mb_id=C.mb_id order by A.br_count desc";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()){

				dto = new BoardDTO();

				dto.setBrNum(rs.getInt("br_num"));
				dto.setCgCategory1(rs.getString("cg_category1"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainPhoto(rs.getString("br_mainphoto"));
				dto.setBrPrice(rs.getInt("br_price"));
				dto.setBrCount(rs.getInt("br_count"));
				dto.setMbNickName(rs.getString("mb_nickName"));
				dto.setMbPic(rs.getString("mb_pic"));

				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}

	//조회수증가
	public int updateBrCount(int brNum){

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update board set br_count = br_count + 1 ";
			sql+= "where br_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, brNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}
	
	//히스토리 select
	public List<HistoryDTO> selectHistory(String Mb_id){
		
		List<HistoryDTO> lists = new ArrayList<HistoryDTO>();
		HistoryDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select hs.hs_date, hs.hs_price, hs.hs_totalprice, hs.hs_options,br.br_num, br.br_subject, br.br_mainphoto ";
			sql+= "from history hs inner join board br on hs.br_num = br.br_num ";
			sql+= "where hs.mb_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Mb_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new HistoryDTO();
				dto.setHsDate(rs.getDate("hs_date"));
				dto.setHsPrice(rs.getInt("hs_price"));
				dto.setHsTotalPrice(rs.getInt("hs_totalprice"));
				dto.setHsOptions(rs.getString("hs_options"));
				dto.setBrNum(rs.getInt("br_num"));
				dto.setBrSubject(rs.getString("br_subject"));
				dto.setBrMainphoto(rs.getString("br_mainphoto"));
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	
	

}