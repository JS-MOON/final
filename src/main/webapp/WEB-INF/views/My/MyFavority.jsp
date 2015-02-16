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
     <c:if test="${empty lists}">
        <div id="zzim" class="nodata">
            <p class="nodata_msg">찜한 재능이 없습니다.</p>
        </div>
      </c:if>
        <!-- 제품리스트 -->

                   <div class="pdtListWrap">
                <div class="pdtList">
                	<c:forEach var="dto" begin="0" end="17" items="${lists}" varStatus="status">
                    <div class="pdtWrap">
                        <div class="sellerResume" >
                        <span class="sellingUser">

									<img
                                            src="../pds/imageFile/${dto.mbPic }"
                                            alt="" Height=36px Width=36px /> <span class="user_id">${dto.mbNickName} </span>
                        </span>
                            <div class="sellerCondition">
                                <span class="onOff on">ONLINE</span>
                                <span class="response">평균 응답시간 <span class="num">10</span>분</span>
                            </div>
                        </div>
                        <div >
                            <a href="../Goods/GDetail.action?brNum=${dto.brNum}">
                            <span class="pdtThumb">
                                <img src="../Product/${dto.brMainPhoto}" alt="기업용 홈페이지 제작해드립니다."  Height=228px  Width=228px   />
                                <span class="btnWistList off">
                                    <input type="button" id="wishList_${status.index}" value="${dto.brNum }" style="border-style:None;" onclick="changeWishList(${status.index});return false;"/>
                                </span>
                            </span>
                            </a>
                        </div>
                        <div class="pdt_info">
                            <span class="category">[${dto.cgCategory1}]</span>
                            <span class="pdtTitle" >${dto.brSubject}</span>
                            <div class="counting">
                            <span class="buying">
                                <span class="num">${dto.brCount}</span>
                                <span>View</span>
                            </span>
                            <span class="price">
                                <span class="num">${dto.brPrice}</span> 원
                            </span>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="sessionId" value="${mbId }">
                    </c:forEach>
                </div>
            </div>

    </div>
</div>

</body>
</html>