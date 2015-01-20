<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<style type="text/css">
    .hidden {
        display: none;
    }
</style>

<script>
    $(document).ready(function () {

        $('#NoData').addClass('hidden');

        var cnt = '0'; //재능갯수

        if (cnt >= 1) {
            $('#NoData').addClass('hidden');

        } else {
            $('#NoData').removeClass('hidden');
        }
    });
</script>
<script type="text/javascript">
    //<![CDATA[
    Sys.WebForms.PageRequestManager._initialize('ctl00$ContentPlaceHolder1$WUC_My_AbilityList$ToolkitScriptManager1', 'form1', ['tctl00$ContentPlaceHolder1$WUC_My_AbilityList$UpdatePanel1','ContentPlaceHolder1_WUC_My_AbilityList_UpdatePanel1'], [], [], 90, 'ctl00');
    //]]>
</script>

<div id="ContentPlaceHolder1_WUC_My_AbilityList_UpdatePanel1">

    <div class="primaryContents myTalent">
        <!-- 마이페이지lnb -->
        <div class="mypage_lnb">
            <h3>내 재능 목록</h3>
            <div class="location">
                <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>내재능목록</span>
            </div>
        </div>
        <!-- //마이페이지lnb -->
        <!-- 내용 -->
        <div class="contBlock">
            <div id="NoData" class="nodata">
                <p class="nodata_msg">나의 재능이 없습니다.</p>
            </div>
            <!-- 기본정보 -->

            <!-- //기본정보 -->
        </div>
        <!-- //내용 -->
    </div>

</div>



</body>
</html>