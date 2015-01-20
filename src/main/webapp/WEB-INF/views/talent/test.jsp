<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
	
	String mb_id = request.getParameter("mb_id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>

<tr><td><a href="<%=cp%>/choi/member.do">전체회원보기</a></td></tr>
<tr><td><a href="<%=cp%>/choi/newMember.do">회원가입</a></td></tr>
<tr><td><a href="<%=cp%>/choi/searchMember.do">회원검색</a></td></tr>
<tr><td><a href="<%=cp%>/choi/updateMember.do">회원 정보 수정</a></td></tr>

<c:if test="${empty sessionScope.session}">
<tr><td><a href="<%=cp%>/choi/login.do">로그인</a></td></tr>

</c:if>
<c:if test="${!empty sessionScope.session}">
<tr><td><a href="<%=cp%>/choi/logout.do">로그아웃</a></td></tr>
<tr><td><a href="<%=cp%>/choi/deleteMember.do">회원탈퇴</a></td></tr>

<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td> ${sessionScope.session.mb_id}님 환영합니다.</td></tr>
</c:if>






</table>






</body>
</html>

























