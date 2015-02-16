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
        $('#zzim').addClass('hidden');


        var cnt = '0'; //찜한상품갯수

        if (cnt >= 1) {
            $('#zzim').addClass('hidden');

        } else {
            $('#zzim').removeClass('hidden');
        }

    });
</script>

<div class="primaryContents wishList">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>찜목록</h3>
        <div class="location">
            <span>홈</span> &gt; <span>개인 Personal</span> &gt; <span>찜목록</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div class="contBlock">
        <div id="zzim" class="nodata">
            <p class="nodata_msg">찜한 재능이 없습니다.</p>
        </div>
        <!-- 제품리스트 -->

        <div class="pdtListWrap">
            <div class="pdtList">
                <div id="ContentPlaceHolder1_WUC_My_FavoriteList_UpdatePanel1">
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>