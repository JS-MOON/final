<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
		type="text/css" media="all" />

	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
		type="text/javascript"></script>


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
				if (str != "")
					str += ",";
				str += num.substring(point, point + 3);
				point += 3;
			}
			txtVal.value = str;
		}

		//수익관리 출금액
		function hsInsertPay() {

			var f = document.BankForm;

			var pay = document.BankForm.payment.value;

			/*     	alert(pay);
			 alert("${hsPrice}"); */

			var hsPrice = parseInt("${hsPrice-payout}");
			 
			 if(!pay){
					alert("값을 입력하세요!.");

					pay.focus();
					return;
			 } 
			 
			 else if (pay > hsPrice) {	
				alert("보유하신 금액보다 큽니다.");

				f.payment.focus();
				return;
			}
			
			
			else if(hsPrice==false){
				alert("보유하신 금액이없습니다.");
				
				f.payment.focus();
				return; 		
			} 
			
			else if (pay <= hsPrice) {
				alert(pay+"원이 지급되었습니다.");

				f.action = "../My/BankSellIncome.action";
				f.submit();
			}
			

			//출금액이 수익금보다 많이 출력할때 안된다 라고 메시지가뜬다..
			/* 	if(${hsPrice})
			 */

		}
		
		
		//날짜 사이 데이터 검색
		function DaySearch(){
			var f = document.BankForm

			f.action = "../My/SellIncome.action";
			f.submit();
		}

		function isNumeric(keyCode) {
			if (keyCode == 16)
				isShift = true;

			return ((keyCode >= 48 && keyCode <= 57) || keyCode == 8 || (keyCode >= 96 && keyCode <= 105))
					&& isShift == false;
		}

		$(function() {
			$("#txt_sDate, #txt_eDate").datepicker({
				dateFormat : 'yy.mm.dd',
				changeMonth : true,
				changeYear : true
			});
		});
	</script>
	
	<form action="" name="BankForm" method="post">
		<div>

			<div class="primaryContents myReturn">
				<!-- 마이페이지lnb -->
				<div class="mypage_lnb">
					<h3>수익 관리</h3>
					<div class="location">
						<span>홈</span> &gt; <span>판매 Sell</span> &gt; <span>수익 관리</span>
					</div>
				</div>
				<!-- //마이페이지lnb -->

				<!-- 내용 수익관리 -->
				<div class="contBlock">
					<div class="topSection">
						<dl class="dl1">
							<dt>판매 수익금</dt>
							<dd>
								<span class="count">${totalIncome}</span> 원
							</dd>
						</dl>
						<dl class="dl2">
							<dt>총 계좌 출금액</dt>
							<dd>
								<span class="count">${withdrawal}</span> 원
							</dd>
						</dl>
					</div>
					
					<h4 class="itemTitle">수익금 출금신청</h4>
					<div class="withdraw">
						<div class="amount">
							<input name="payment" type="text" id="pay" class="input-text"
								onkeydown="return isNumeric(event.keyCode);"
								onpaste="return false" onkeyup="keyUP(event.keyCode)" />
								<span>원</span>
						</div>
						<div class="bankAcc">
							<dl class="dl1">
								<dt>예금주</dt>
								<dd>${dto.name }</dd>
							</dl>
							<dl class="dl2">
								<dt>출금은행</dt>
								<dd>${dto.bank }</dd>
							</dl>
							<dl class="dl3">
								<dt>출금계좌</dt>
								<dd>${dto.bkNum }</dd>
							</dl>
						</div>
					</div>
					<div class="btnArea">
						<p class="p">* 출금신청은 평일 09:00~16:00 사이에 가능합니다</p>
						<a id="ContentPlaceHolder1_WUC_MyProfit_lbtn_goRequest"
							class="btnType12" onclick="hsInsertPay();"> <span>신청</span>
						</a>
					</div>

					<div class="withdrawHistory">
						<h4 class="itemTitle">출금내역조회</h4>
						<div class="selDate">
							<input name="sDate"
								type="text" value="" id="txt_sDate" class="input-text"
								style="width: 100px;" /> 
								
								<span class="term">부터</span>
								<input name="eDate"type="text" value="" id="txt_eDate" class="input-text" style="width: 100px;" /> 
								
								<span class="term">까지</span> 
								
								<select name="" id="" class="select" style="width: 105px; margin-left: 5px">
									<option selected="selected" value="1">날짜순</option>
<!-- 									<option value="2">출금액순</option> -->
								</select> 
							<a id="" class="btnType12" href="javascript:DaySearch();"><span>검색</span></a>
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
											<div class="th">날 짜</div>
										</th>
										<th>
											<div class="th">출금 금액</div>
										</th>
										<th>
											<div class="th">아이디</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pdto" items="${paymentlist }">
										<tr>
											<th>
												<div class="td">${pdto.bkDay}</div>
											</th>
											<th>
												<div class="td">${pdto.payment }</div>
											</th>
											<th>
												<div class="td">${pdto.mbId }</div>
											</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tblLine2"></div>
					</div>
				</div>
				<!-- //내용 -->
			</div>

		</div>
	</form>

</body>
</html>