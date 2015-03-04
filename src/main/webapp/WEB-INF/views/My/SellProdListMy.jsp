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

        var cnt = '0'; //재능갯수

        if (cnt >= 1) {
            $('#NoData').addClass('hidden');

        } else {
            $('#NoData').removeClass('hidden');
        }
    });
    
	function deletedata(brNum) { 
		
		var f = document.sellListForm;
		
		if(confirm("재능을삭제하시겠습니까?")===true){
			
			document.getElementById("brNum").value = brNum;
			
			f.action = "../My/SellProdListMydelete.action";
			f.submit();
		}

	}
    
</script>

<form action="" method="post" name="sellListForm" >
    <div class="primaryContents myTalent">
        <!-- 마이페이지lnb -->
        <div class="mypage_lnb">
            <h3>내 재능 목록</h3>
            <div class="location">
                <span>홈</span> &gt; <span>판매 Sell</span> &gt; <span>내 재능 목록</span>
            </div>
        </div>
        <!-- //마이페이지lnb -->
        <!-- 내용 -->
            <div class="dealList">

                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="70px" />
                        <col width="160px" />
                        <col width="280px" />
                        <col width="100px" />
                        <col width="80px" />
                    </colgroup>
 				<c:if test="${!empty lists }">
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
                            <div class="th">삭제</div>
                        </th>
                        <th scope="col">
                            <div class="th">상태</div>
                        </th>
                    </tr>
                    </thead>

   				<c:forEach var="dto" items="${lists }">
<%--                 <tbody>
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
                        
                        <td class="delete" >
                            <div class="td">
                            <input type="button" value=" 삭제 " onclick="deletedata();"/>
                            <input type="hidden" name="brNum" value="${dto.brNum}">
                            </div>
                        </td>
                        <!-- step1 ~ step4 -->

                    </tr>
                    </tbody> --%>
                    
                    <tbody>
                    <tr>
                        <td class="num">
                            <div class="td">
                                 ${dto.brNum}</div>
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
                        
                        <td class="delete" >
                            <div class="td" align="center">
                            
                            <img src="../resources/images/mypage/delete.png" 
                            onclick="deletedata(${dto.brNum});"/>
                            </div>
                        </td>
                        
                        <td onclick="location.href='/Chat/SChat.aspx?ccd=Mf00T2RIlJ7OvWuOTPk7De1Awb5gx5Pr64FJrPfPN3aQKE98vs2V2QMUdzZ4dvpj&ocd=VsnoRy5RJiDdXemxeYZs8wKdT79qwsTe40eLfklN/e8zPf15kmRFore4MU^62M6^';" style="cursor: pointer;" align="center" class="process step9" >
                            <img id="ContentPlaceHolder1_WUC_My_PurchaseList_rptList_Image2_0" src="../resources/images/mypage/BG_sellingProcess_ongoing.gif" /><div class="td">
                            진행중</div>
                        </td>
                        <!-- step1 ~ step4 -->

                    </tr>
                    </tbody>
                    </c:forEach>

        </c:if>
        <c:if test="${empty lists }">
            		<div id="NoData" class="nodata">
                		<p class="nodata_msg">등록된 재능이 없습니다.</p>
            		</div>
        </c:if>
   	</table>
        
            <!-- 기본정보 -->

            <!-- //기본정보 -->
        </div>
        <!-- //내용 -->
    </div>
    
    <input type="hidden" name="brNum" id="brNum" value="" />
    
    </form>

</div>



</body>
</html>