<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-12-01
  Time: 오후 8:18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
    <title></title>
</head>
<body>

<form method="post" action="../project/Register_ok.action" name="goForm">
</form>

<%
    out.print("<script language=\"javascript\">\n" +
            "     window.onload = function() {\n" +
            "         alert(\"" + request.getAttribute("str") +  "\");\n" +
            "         document.goForm.submit();\n" +
            "    }\n" +
            "</script>\n");
%>

</body>
</html>
