<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<meta http-equiv="Page-Enter" content="BlendTrans(Duration=0.1)">
<meta http-equiv="Page-exit" content="BlendTrans(Duration=0.1)">

<style type="text/css">
    .hidden {
        display: none;
    }
    .dealList table tbody tr td.process .td {padding:10px 10px 0 10px; text-align:center; font-weight:bold; font-size:11px;}
    .dealList table tbody tr td.process.step9 .td { no-repeat 50% 0;}

</style>

<script>

    $(document).ready(function () {

        $('#NoData').addClass('hidden');
        $('#hasData').addClass('hidden');

        var cnt = '3'; //구매한 상품갯수

        if (cnt >= 1) {
            $('#NoData').addClass('hidden');
            $('#hasData').removeClass('hidden');
        } else {
            $('#NoData').removeClass('hidden');
            $('#hasData').addClass('hidden');
        }

    });
</script>

<!-- 마이페이지컨텐츠 시작 -->
<div class="primaryContents myPayment">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>구매관리</h3>

        <div class="location">
            <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>구매관리</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div class="contBlock">
        <div id="NoData" class="nodata">
            <p class="nodata_msg">구매한 재능이 없습니다.</p>
        </div>



        <div id="hasData">


            <div class="sortArea">
                <br />
                

                <div class="listSearch">
                    <input name="ctl00$ContentPlaceHolder1$WUC_My_PurchaseList$txt_searchValue" type="text" id="ContentPlaceHolder1_WUC_My_PurchaseList_txt_searchValue" class="input-text" style="width: 210px;" />
                    <input type="image" name="ctl00$ContentPlaceHolder1$WUC_My_PurchaseList$ibtn_search" id="ContentPlaceHolder1_WUC_My_PurchaseList_ibtn_search" class="btnSearch" src="" />
                </div>
            </div>

            <!-- 게시판영역 -->
            <div class="dealList">

                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="70px" />
                        <col/>
                        <col width="300px" />
                        <col width="100px" />
                        <col width="80px" />
                    </colgroup>

                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="th">재능번호</div>
                        </th>
                        <th scope="col">
                            <div class="th">재능상품</div>
                        </th>
                        <th scope="col">
                            <div class="th">재능수정</div>
                        </th>
                        <th scope="col">
                            <div class="th">구매/마감일</div>
                        </th>
                        <th scope="col">
                            <div class="th">상태</div>
                        </th>
                    </tr>
                    </thead>

					<c:forEach var="dto" items="${lists }" varStatus="seq">
                    <tbody>
                    <tr>
                        <td class="num">
                            <div class="td">
                                 ${seq.count }</div>
                        </td>
                        <td class="thumbnail">
                            <div class="td"><a href="../Goods/GDetail.action?brNum=${dto.brNum }">
                                <img src="../Product/${dto.brMainPhoto}" alt=""   Height=160px  Width=160px /></a></div>
                        </td>
                        <td class="payResume">
                            <div class="td">
                                ${dto.brSubject }
                                <dl class="option">
                                    <dt>옵션내역 : ${dto.hsOptions }</dt>
                                    <dd>
                                    </dd>
                                </dl>
                                            <span class="price"><span class="count">
                                                ${dto.hsPrice }</span> 원</span>
                                <p class="dialogue mine">
                                </p>
                            </div>
                        </td>
                        <td class="date">
                            <div class="td">
                                            <span class="payDate">
                                                ${dto.hsDate }/</span>
                                            <span class="finishDate">
                                                </span>
                                []




                            </div>
                        </td>
                        <c:if test="${dto.progress==0}">
                        <td style="cursor: pointer;" align="center" class="process step9" >
                            <img id="" src="../resources/images/mypage/ing.png"
                            onclick="location.href='../My/BuyComplete.action?hsNum=${dto.hsNum}';" /><div class="td">
                            진행중 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <img id="" src="../resources/images/mypage/cancel.png" 
                            onclick="location.href='../My/BuyCancel.action?hsNum=${dto.hsNum}';" /><div class="td">
                            취소
                            </div>
                        </td>
                        </c:if>
                        
                        <c:if test="${dto.progress==1}">
                        <td style="cursor: pointer;" align="center" class="process step9" >
                            <img id="" src="../resources/images/mypage/check.png" 
                            onclick="location.href='../My/BuyComplete.action?hsNum=${dto.hsNum}';"/><div class="td">
                            구매확정 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <img id="" src="../resources/images/mypage/cancel.png" 
                            onclick="location.href='../My/BuyCancel.action?hsNum=${dto.hsNum}';"/><div class="td">
                            반품
                            </div>
                        </td>
                        </c:if>
                        
                        <c:if test="${dto.progress==2}">
                        <td style="cursor: pointer;" align="center" class="process step9" >
                        <img id="" src="../resources/images/mypage/ico_correct.png"/>
                        <div class="td">완료</div>
                        </td>
                        </c:if>
                        
                        <c:if test="${dto.progress==3}">
                        <td style="cursor: pointer;" align="center" class="process step9" >
                        <img id="" src="../resources/images/mypage/cancel.png"/>
                        <div class="td">취소</div>
                        </td>
                        </c:if>
                      
                        <!-- step1 ~ step4 -->

                    </tr>
                    </tbody>
                    </c:forEach>

                </table>
                <div class="tblLine2"></div>

                <div class="paging">

                    <b>2 </b>

                </div>
            </div>
            <!-- //게시판영역 -->

        </div>
    </div>
    <!-- //내용 -->
</div>
<!-- //마이페이지컨텐츠 시작 -->


</body>
</html>