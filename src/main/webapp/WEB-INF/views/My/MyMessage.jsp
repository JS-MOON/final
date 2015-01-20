<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<div class="primaryContents messageManage">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>메세지 관리</h3>
        <div class="location">
            <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>메세지 관리</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div id="ContentPlaceHolder1_WUC_MyMessage1_divNoData" class="nodata" style="display:none;">
        <p class="nodata_msg">새로운 메세지가 없습니다.</p>
    </div>

    <div id="ContentPlaceHolder1_WUC_MyMessage1_divHasData" class="contBlock" style="display:;">
        <h4>새로운 메세지<span class="newMsg"><span>0</span></span></h4>

        <div class="tblLine lineTop"></div>


        <div class="tblLine"></div>
    </div>
    <!-- //내용 -->
</div>

</body>
</html>