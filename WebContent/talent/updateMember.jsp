<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	
	String mb_id = request.getParameter("mb_id");
	String mb_pw = request.getParameter("mb_pw");
	
	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="<%=cp%>/choi/updateMember_ok.do">

<table>
<tr><td align="right">아이디</td><td><input type="text" value="${sessionScope.session.mb_id}" name="mb_id" readonly="readonly"></td></tr>
<tr><td align="right">현재 pw</td><td><input type="password" name="mb_pw"></td></tr>
<tr><td align="right">수정할 pw</td><td><input type="password" name="mb_pw1"></td></tr>
<tr><td align="right">  pw 확인</td><td><input type="password" name="mb_pw2"></td></tr>
<tr><td align="right"> 전화번호</td><td><input type="text" name="mb_tel"></td></tr>
<tr><td align="right">   닉네임</td><td><input type="text" name="mb_nickName"></td></tr>
<tr><td align="right">     사진</td><td><input type="file" name="mb_pic"></td></tr>
<tr><td align="right"> 	  about</td>
	<td><textarea rows="10" cols="16" name="mb_about"></textarea></td>
<tr><td align="right" colspan="2"><input type="submit" value="확인">
<tr><td colspan="2">${str}</td></tr>





</table>

</form>

</body>
</html>

























