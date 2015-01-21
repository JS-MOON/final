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

	<link rel="stylesheet" type="text/css" href="../resources/css/ui.css" />
</head>
<body>

<form action="PhotoUpload_ok.action" name="uploadForm" method="post" enctype="multipart/form-data">

	<br/>
	<div class="settingOption">
		<input type="file" name="mbPic" class="input-file" style="width:498px;width: 100%;" />
	</div>

	<div class="btnArea al_c">
		<a onclick="document.uploadForm.submit()" class="btnType3"><span>등록</span></a>
	</div>

</form>

</body>
</html>

























