<%@page import="com.talent.TalentDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>

<jsp:useBean id="dto" class="com.talent.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result!=0}">
회원가입 성공!
</c:if>
<c:if test="${result==0}">
회원가입 실패..
</c:if>


</body>
</html>

























