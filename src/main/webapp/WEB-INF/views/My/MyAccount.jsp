<%@page import="com.exe.dto.MemberSession"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();

	MemberSession mbs = (MemberSession) session.getAttribute("session");

	String mbPw_r = mbs.getMbPw();
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
</head>

<body>

	<script>
		function changePw() {
			var f = document.changePwForm;

			if (f.mbPw.value !=<%=mbPw_r%>) {

				alert("현재비밀번호를 확인해 주세요");
				f.mbPw.focus();
				return;

			} else if (f.changeMbPw1.value != f.changeMbPw2.value) {
				alert("비밀번호가 틀립니다");
				f.changeMbPw1.focus();
				return;
			}

			alert("비밀번호가 수정되었습니다.");
			f.action = "ChangePw.action";
			f.submit();

		}

		function outMember() {

			var f = document.outMemberForm;
			
			if(f.mbPw.value !=<%=mbPw_r%>) {
				
				alert("비밀번호가 틀렸습니다.");
				f.mbpw.focus();
				return;				
			} 
		
			f.submit();

		}

		$('input:radio[name="rbtnCause"]').change();

		$('#radioBtn label').live(
				'click',
				function(event) {
					var rbtn = $(this).parent().children(
							$('input:radio[name="rbtnCause"]'));//.attr('checked');
					if (!rbtn.is(":checked")) {
						rbtn.attr('checked', true);
					}
				});
	</script>
	<div class="primaryContents accountManage">
		<!-- 마이페이지lnb -->
		<div class="mypage_lnb">
			<h3>계정 관리</h3>
			<div class="location">
				<span>홈</span> &gt; <span>마이페이지</span> &gt; <span>프로필 관리</span>
			</div>
		</div>
		<!-- //마이페이지lnb -->

		<!-- 내용 -->
		<form action="./changePw.action" method="post" name="changePwForm">

			<div class="contBlock">
				<h4>비밀번호 변경</h4>
				<div class="tblType">
					<table cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="120px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<div class="th">현재 비밀번호</div>
								</th>
								<td>
									<div class="td">
										<!--mbPw=>사용자 입력 pw   -->
										<input name="mbPw" type="password" maxlength="20"
											class="input-text" style="width: 100%;" />
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<div class="th">변경할 비밀번호</div>
								</th>
								<td>
									<div class="td">
										<input name="changeMbPw1" type="password" maxlength="20"
											class="input-text" style="width: 100%;" />
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<div class="th">비밀번호 확인</div>
								</th>
								<td>
									<div class="td">
										<input name="changeMbPw2" type="password" maxlength="20"
											class="input-text" style="width: 100%;" />
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnType">
					<a class="btnType12" onclick="changePw();"><span>수정하기</span></a>
				</div>
		</form>

		<form action="./Out.action" method="post" name="outMemberForm">
			<h4>회원 탈퇴하기</h4>
			<div class="tblType">
				<table cellpadding="0" cellspacing="0">
					<colgroup>
						<col width="120px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="vertical-align: top;">
								<div class="th" style="margin-top: 10px;">탈퇴 사유</div>
							</th>
							<td>
								<div class="td" id="radioBtn">
									<ul>
										<li><input value="causeBy1" name="causeBy" type="radio"
											class="input-radio" checked="checked" /> <label
											class="label">다른 사용자명으로 사용하기 위해서</label></li>
										<li><input value="causeBy2" name="causeBy" type="radio"
											class="input-radio" /> <label class="label">사용빈도가
												낮고, 개인정보 유출이 우려되어</label></li>
										<li><input value="causeBy3" name="causeBy" type="radio"
											class="input-radio" /> <label class="label">사이트 이용시
												장애가 많아서</label></li>
										<li><input value="causeBy4" name="causeBy" type="radio"
											class="input-radio" /> <label class="label">서비스의 질에
												대한 불만이 있어서</label></li>
										<li><input value="causeBy5" name="causeBy" type="radio"
											class="input-radio" /> <label class="label">사이트 이용시
												고객응대가 나빠서</label></li>
										<li><input value="causeBy6" name="causeBy" type="radio"
											class="input-radio" /> <input name="causeByManual"
											type="text" maxlength="100" class="input-text"
											style="width: 240px;" /></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<div class="th">비밀번호 확인</div>
							</th>
							<td>
								<div class="td">
									<input name="mbPw" type="password" maxlength="20"
										class="input-text" style="width: 100%;" />
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="leaveNote">
				<strong>회원 탈퇴 전 확인하세요</strong>
				<p>
					사용하지 않은 잔고가 있으신 경우 고객센터 > 문의하기를 통해 잔고를 환불받으실 수 있습니다.<br /> 수익금이 인출
					최소금액보다 낮아 인출을 못한 경우 고객센터 > 문의하기를 통해 수익금을 환불받으실 수 있습니다.
				</p>
				<a class="btnType12" onclick="outMember();"><span>탈퇴하기</span></a>
			</div>

		</form>
	</div>

	<!-- //내용 -->
	</div>

</body>
</html>














