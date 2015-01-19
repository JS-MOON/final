<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">

    var isShift = false;
    function keyUP(keyCode) {
        if (keyCode == 16)
            isShift = false;

        var txtVal = document.getElementById('txt_withDraw');
        var len, point, str;

        num = txtVal.value.replace(/,/g, "") + "";
        point = num.length % 3
        len = num.length;

        str = num.substring(0, point);
        while (point < len) {
            if (str != "") str += ",";
            str += num.substring(point, point + 3);
            point += 3;
        }
        txtVal.value = str;
    }

    function isNumeric(keyCode) {
        if (keyCode == 16)
            isShift = true;

        return ((keyCode >= 48 && keyCode <= 57 || keyCode == 8 ||
        (keyCode >= 96 && keyCode <= 105)) && isShift == false);
    }

    $(function () {
        $("#txt_sDate, #txt_eDate").datepicker({
            dateFormat: 'yy.mm.dd',
            changeMonth: true,
            changeYear: true
        });
    });

</script>
<script type="text/javascript">
    //<![CDATA[
    Sys.WebForms.PageRequestManager._initialize('ctl00$ContentPlaceHolder1$WUC_MyProfit$ScriptManager1', 'form1', ['tctl00$ContentPlaceHolder1$WUC_MyProfit$UpdatePanel1','ContentPlaceHolder1_WUC_MyProfit_UpdatePanel1'], [], [], 90, 'ctl00');
    //]]>
</script>

<div id="ContentPlaceHolder1_WUC_MyProfit_UpdatePanel1">

    <div class="primaryContents myReturn">
        <!-- 마이페이지lnb -->
        <div class="mypage_lnb">
            <h3>수익 관리</h3>
            <div class="location">
                <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>수익관리</span>
            </div>
        </div>
        <!-- //마이페이지lnb -->

        <!-- 내용 -->
        <div class="contBlock">
            <div class="topSection">
                <dl class="dl1">
                    <dt>판매 수익금</dt>
                    <dd><span class="count">
                            0</span> 원</dd>
                </dl>
                <dl class="dl2">
                    <dt>총 계좌 출금액</dt>
                    <dd><span class="count">
                            0</span> 원</dd>
                </dl>
            </div>

            <h4 class="itemTitle">수익금 출금신청</h4>
            <div class="withdraw">
                <div class="amount">
                    <input name="ctl00$ContentPlaceHolder1$WUC_MyProfit$txt_withDraw" type="text" value="0" id="txt_withDraw" class="input-text" onkeydown="return isNumeric(event.keyCode);" onpaste="return false" onkeyup="keyUP(event.keyCode)" />
                    <span>원</span>
                </div>
                <div class="bankAcc">
                    <dl class="dl1">
                        <dt>예금주</dt>
                        <dd>
                        </dd>
                    </dl>
                    <dl class="dl2">
                        <dt>출금은행</dt>
                        <dd>
                        </dd>
                    </dl>
                    <dl class="dl3">
                        <dt>출금계좌</dt>
                        <dd>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="btnArea">
                <p class="p">* 출금신청은 평일 09:00~16:00 사이에 가능합니다</p>
                <a id="ContentPlaceHolder1_WUC_MyProfit_lbtn_goRequest" class="btnType12" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_MyProfit$lbtn_goRequest&#39;,&#39;&#39;)"><span>신청</span></a>
            </div>

            <div class="withdrawHistory">
                <h4 class="itemTitle">출금내역조회</h4>
                <div class="selDate">
                    <input name="ctl00$ContentPlaceHolder1$WUC_MyProfit$txt_sDate" type="text" value="2014.11.21" id="txt_sDate" class="input-text" style="width: 100px;" />
                    <span class="term">부터</span><input name="ctl00$ContentPlaceHolder1$WUC_MyProfit$txt_eDate" type="text" value="2014.11.28" id="txt_eDate" class="input-text" style="width: 100px;" />
                    <span class="term">까지</span>
                    <select name="ctl00$ContentPlaceHolder1$WUC_MyProfit$ddl_searchField" id="ContentPlaceHolder1_WUC_MyProfit_ddl_searchField" class="select" style="width: 105px; margin-left: 5px">
                        <option selected="selected" value="1">날짜순</option>

                    </select>
                    <a id="ContentPlaceHolder1_WUC_MyProfit_lbtn_Search" class="btnType12" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_MyProfit$lbtn_Search&#39;,&#39;&#39;)"><span>검색</span></a>
                </div>

                <div class="tblType1">
                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="100" />
                            <col />
                            <col width="80" />
                            <col width="130" />
                        </colgroup>
                        <thead>
                        <tr>
                            <th>
                                <div class="th">날짜</div>
                            </th>
                            <th>
                                <div class="th">내용</div>
                            </th>
                            <th>
                                <div class="th">상태</div>
                            </th>
                            <th>
                                <div class="th">금액</div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="tblLine2"></div>
            </div>
        </div>
        <!-- //내용 -->
    </div>

</div>


</body>
</html>