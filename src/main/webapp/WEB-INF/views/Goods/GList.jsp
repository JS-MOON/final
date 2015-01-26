<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 4:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<html>
<head>
	<title></title>


</head>
<body>
<script type="text/javascript">

	function sortIt() {

		var f = document.rangeForm;
		var range = f.range.value;

		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;

		f.action = "GList.action?start=" + start + "&end=" + end + "&range="+ range;
		f.submit();

	}


</script>


<div id="container">
	<!-- contents -->
	<div id="contents" class="productMain">

		<!-- 본문 -->
		<div>
			<div class="subCategory">
				<ul>

					<li><a href="GList.jsp?pg%3d1%26sr%3d1%26cy%3d140&ct=140">
						<input type="submit" name=""
							   value="전체"
							   style="background-color: #EDEDED; border-style: None; height: 26px;" />
					</a></li>


					<!-- 반복문으로 카테고리2 표현하기 -->
					<c:forEach var="dto" items="${cglists }">
						<li><a href="GList_ok.action?cgNum=${dto.cgNum}"> <input
								type="submit" name="cgCategory2" value="${dto.cgCategory2}"
								style="background-color: #EDEDED; border-style: None; height: 26px;" />
						</a></li>
					</c:forEach>
					<!-- 반복문으로 카테고리2 표현하기 -->

				</ul>
			</div>
		</div>

		<div>
			<form action="" method="post" name="rangeForm">
				<div class="pdtSort">
					<select name="range" onchange="sortIt();" style="width: 110px;">
						<option value="0">정렬선택</option>
						<option value="1">최고가순</option>
						<option value="2">최저가순</option>
						<option value="3">최신상품순</option>

					</select>
				</div>
				<input type="hidden" value="${start }" name="start" id="start" />
				<input type="hidden" value="${end }" name="end" id="end" />
			</form>
			<!-- 제품리스트 -->
			<div class="pdtListWrap">
				<div class="pdtList">

					<!-- for문 -->
					<c:forEach var="dto" items="${lists}" varStatus="status">
						<div class="pdtWrap">
							<div class="sellerResume">
								<span class="sellingUser"> 
								<!-- a링크 삭제 이미지만 남겨둬 -->
								
									<img
											src="../pds/imageFile/${dto.mbPic }"
											alt="" Height=36px Width=36px /> <span class="user_id">${dto.mbNickName} </span>
		
								</span>
								<div class="sellerCondition">
									<span class="onOff on">ONLINE</span> <span class="response">평균
										응답시간 <span class="num">10</span>분
									</span>
								</div>
							</div>

							<a href="GDetail.action?brNum=${dto.brNum }">
								<div>
								
									<span class="pdtThumb">
										<img src="${imagePath }/${dto.brMainPhoto}" alt="기업용 홈페이지 제작해드립니다." Height=308px Width=308px />
										<span class="btnWistList on">
											<input type="button" id="wishList_${status.index}" style="border-style:None;" onclick="changeWishList(${status.index});return false;"/>
										</span>
									</span>
								</div>
								<div class="pdt_info">
								<span class="category">[${dto.cgCategory1}]
								</span> <span class="pdtTitle">${dto.brSubject }</span>
									<div class="counting">
									<span class="buying"> <span class="num">${dto.brCount}</span> <span>View</span>
									</span> <span class="price"> <span class="num">${dto.brPrice }</span> 원
									</span>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
					<!-- //for문 -->

				</div>
			</div>

			<!-- 제품리스트 -->

		</div>
		<!-- //본문 -->

		<!-- quick link -->
		<div id="quickLinks">

			<!-- 사이드 퀵마이페이지 -->
			<div class="quick-mypage quick-mypage-re">
				<ul class="menuList">
					<li class="wishPdt"><a class="wishPdt" href=""><span>찜한재능</span></a>
					</li>
					<li class="recentPdt"><span class="t"><span>최근본재능</span></span>
						<ul>
							<c:if test="${cookies[0] != null}">
								<c:forEach var="i" begin="0" end="3" step="1">
									<c:if test="${cookies[i] != null }">
										<li>
											<a href="GDetail.action?brNum=${cookies[i]}" style="border: none;">
												<img src="../Product/${cookiesPhoto[i]}" width="80%" style="border: none;">
											</a>
										</li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${cookies[0] == null}">
								내역이 없습니다.
							</c:if>
						</ul></li>
				</ul>
			</div>
			<!-- //사이드 퀵마이페이지 -->

		</div>
		<!--//quick link-->

		<!--사이드 베스트 -->
		<div class="quick-mypage-re">
			<div id="quick-best2" class="quick-best2" style="display: none;">
				<h3>BEST</h3>
				<ul>
					<li><a href="../Goods/GList.action?start=1&end=14&range=0">그래픽 · 디자인</a></li>
					<li><a href="../Goods/GList.action?start=15&end=22&range=0">사업 · 전문가</a></li>
					<li><a href="../Goods/GList.action?start=23&end=30&range=0">문서 · 레포트</a></li>
					<li><a href="../Goods/GList.action?start=31&end=41&range=0">컴퓨터 · IT</a></li>
					<li><a href="../Goods/GList.action?start=42&end=50&range=0">번역 · 외국어</a></li>
					<li><a href="../Goods/GList.action?start=51&end=58&range=0">음악 · 동영상</a></li>
					<li><a href="../Goods/GList.action?start=59&end=68&range=0">행사 · 공연</a></li>
					<li><a href="../Goods/GList.action?start=69&end=79&range=0">노하우 · 상담</a></li>
					<li><a href="../Goods/GList.action?start=80&end=90&range=0">생활서비스</a></li>
					<li><a href="../Goods/GList.action?start=91&end=96&range=0">여행 · 가이드</a></li>
					<li><a href="../Goods/GList.action?start=97&end=109&range=0">핸드메이드</a></li>
					<li><a href="javascript:alert('서비스 준비중 입니다');">프리미엄 재능관</a></li>
				</ul>
			</div>
		</div>
		<!-- //사이드 베스트 -->

	</div>
</div>

</body>
</html>
