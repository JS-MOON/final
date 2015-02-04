<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>

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

        var cnt = '0'; //재능갯수

        if (cnt >= 1) {
            $('#NoData').addClass('hidden');

        } else {
            $('#NoData').removeClass('hidden');
        }
    });
    
	function deletedata() { 
		
		var f = document.sellListForm;
		
		alert("1111");
		
		f.action = "../My/SellProdListMydelete.action";
		f.submit();

	}
    
</script>
<script type="text/javascript">
    //<![CDATA[
    Sys.WebForms.PageRequestManager._initialize('ctl00$ContentPlaceHolder1$WUC_My_AbilityList$ToolkitScriptManager1', 'form1', ['tctl00$ContentPlaceHolder1$WUC_My_AbilityList$UpdatePanel1','ContentPlaceHolder1_WUC_My_AbilityList_UpdatePanel1'], [], [], 90, 'ctl00');
    //]]>
</script>

<div id="ContentPlaceHolder1_WUC_My_AbilityList_UpdatePanel1">

<form action="" method="post" name="sellListForm" >
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
            <div class="dealList">

                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="70px" />
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
                            <div class="th">재능명</div>
                        </th>
                        <th scope="col">
                            <div class="th">수정</div>
                        </th>
                        <th scope="col">
                            <div class="th">삭제</div>
                        </th>
                    </tr>
                    </thead>
        <c:if test="${!empty lists }">
   				<c:forEach var="dto" items="${lists }">
                <tbody>
                <tr>
     	           <td class="num">
                   		<div class="td">
                                 ${dto.brNum }</div>
                        </td>
                        <td class="thumbnail">
                            <div class="td"><a href="../Goods/GDetail.action?brNum=${dto.brNum }">
                                <img src="../Product/${dto.brMainPhoto }" alt=""   Height=160px  Width=160px  /></div>
                        </td>
                        <td class="payResume">
                            <div class="td">
                                ${dto.brSubject }
                            </div>
                        </td>
                        <td class="update">
                            <div class="td">
                            <input type="button" value=" 수정 " class="btn2" 
								onclick="javascript:location.href='<%=cp%>/deleted.action"/>
                            </div>
                            
                        </td>
                        <td class="delete" >
                            <div class="td">
                            <input type="button" value=" 삭제 " onclick="deletedata();"/>
                            <input type="hidden" name="brNum" value="${dto.brNum}">
                            </div>
                        </td>
                        <!-- step1 ~ step4 -->

                    </tr>
                    </tbody>
                    </c:forEach>

        </c:if>
        <c:if test="${empty lists }">
            		<div id="NoData" class="nodata">
                		<p class="nodata_msg">재능이 없습니다.</p>
            		</div>
        </c:if>
   	</table>
        
            <!-- 기본정보 -->

            <!-- //기본정보 -->
        </div>
        <!-- //내용 -->
    </div>
    </form>

</div>



</body>
</html>