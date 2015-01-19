<%@page import="java.util.List"%>
<%@page import="com.talent.TalentDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="<%=cp%>/talent/newMember.jsp" name="myForm">

<table>
<tr>
	<td width="100">mb_id</td>	
	<td width="100">mb_pw</td>	
	<td width="100">mb_nickName</td>
	<td width="100">mb_tel</td>
</tr>

<c:forEach var="dto" items="${lists}">
<tr>
	<td width="100">${dto.mb_id}</td>	
	<td width="100">${dto.mb_pw}</td>	
	<td width="100">${dto.mb_nickName}</td> 
	<td width="100">${dto.mb_tel}</td> 

</tr>
</c:forEach>


</table>



</form>



</body>
</html>

























