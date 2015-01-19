<%@page import="com.talent.TalentDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	
	String mb_id = request.getParameter("mb_id");
	String mb_pw = request.getParameter("mb_pw");	
	String result = (String)request.getAttribute("result");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	
	function update(){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/choi/updateMember.do";
		f.submit();
		
	}

</script>

</head>
<body>

 

<form action="" method="post" name="myForm">

<%=result%>

<table>


<tr><td><input type="hidden" name="mb_id" value="<%=mb_id%>"></td>
<td><input type="hidden" name="mb_pw" value="<%=mb_pw%>"></td>
<%if(result.equals("로그인 성공!")) {%>
<tr><td><input type="button" value="회원정보 수정" name="mb_update" onclick="update();"> 
<%} %>
</table>

</form>
	


</body>
</html>

























