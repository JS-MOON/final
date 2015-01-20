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
    .dealList table tbody tr td.process .td {padding:10px 10px 0 10px; text-align:center; font-weight:bold; font-size:11px;}
    .dealList table tbody tr td.process.step9 .td { no-repeat 50% 0;}
</style>

<script>
    $(document).ready(function () {
        $('#NoData').addClass('hidden');
        $('#hasData').addClass('hidden');

        var cnt = '0'; //
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
<div class="primaryContents mySell">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>판매관리</h3>
        <div class="location">
            <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>판매관리</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div class="contBlock">
        <div id="NoData" class="nodata">
            <p class="nodata_msg">판매한 재능이 없습니다.</p>
        </div>
        <div id="hasData">

            <div class="sortArea">
                <br />
                <select name="ctl00$ContentPlaceHolder1$WUC_My_SellingList$ddl_searchField" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$WUC_My_SellingList$ddl_searchField\&#39;,\&#39;\&#39;)&#39;, 0)" id="ContentPlaceHolder1_WUC_My_SellingList_ddl_searchField" class="select" style="width: 115px;">
                    <option selected="selected" value="1">주문일자</option>
                    <option value="2">주문상태</option>
                    <option value="3">완료일자</option>

                </select>

                <div class="listSearch">
                    <input name="ctl00$ContentPlaceHolder1$WUC_My_SellingList$txt_searchValue" type="text" id="ContentPlaceHolder1_WUC_My_SellingList_txt_searchValue" class="input-text" style="width: 210px;" />
                    <input type="image" name="ctl00$ContentPlaceHolder1$WUC_My_SellingList$ibtn_search" id="ContentPlaceHolder1_WUC_My_SellingList_ibtn_search" class="btnSearch" src="" />
                </div>
            </div>
            <!-- 게시판영역 -->
            <div class="dealList">
                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="70px" />
                        <col width="160px" />
                        <col width="300px" />
                        <col width="100px" />
                        <col width="80px" />
                    </colgroup>

                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="th">주문번호</div>
                        </th>
                        <th scope="col">
                            <div class="th">구매자프로필</div>
                        </th>
                        <th scope="col">
                            <div class="th">구매정보</div>
                        </th>
                        <th scope="col">
                            <div class="th">구매/마감일</div>
                        </th>
                        <th scope="col">
                            <div class="th">상태</div>
                        </th>
                    </tr>
                    </thead>

                </table>
                <div class="tblLine2"></div>

                <div class="paging">

                </div>
            </div>
            <!-- //게시판영역 -->
        </div>
    </div>
    <!-- //내용 -->
</div>

</body>
</html>