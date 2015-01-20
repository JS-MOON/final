<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 6:01
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
	<title></title>

</head>
<body>

<script type="text/javascript">
	function comment() {
		var f = document.rateForm;

		if(f.cm_content.value==="") {
			alert("댓글 내용을 입력하세요.")
		} else {
			f.action = "comments_ok.do";
			f.submit();
		}
	}

	function opplus(){
		var options = "";
		var basicPrice = document.getElementById("basicPrice").value;
		var totalPrice = parseInt(basicPrice);

		var ops = document.getElementsByName("ops");

		for(var i=0; i<ops.length; i++) {
			if(ops[i].checked) {
				if(options!=="") {
					options += "&";
				}
				options += ops[i].value + "/" + ops[i].id;
				totalPrice += parseInt(ops[i].id);
			}
		}

		document.getElementById("completedOption").value = options;
		document.getElementById("totalPrice").value = totalPrice;
	}

</script>

<script language="JavaScript">
	function order() {
		var f = document.opForm;

		f.submit();
	}
</script>

<div id="container">

	<!-- contents -->
	<div id="contents" class="productView">

		<!-- location -->
		<div id="location">
			<span>홈</span> &gt; <span>재능마켓</span> &gt; <span>그래픽 디자인</span> &gt;
			<span>블로그/카페/웹</span>
		</div>
		<!-- //location -->

		<style type="text/css">
			.auto-style2 {
				height: 31px;
			}
		</style>

		<div>
			<form action="./GOrder.do" method="post" name="opForm">
				<!-- 제품정보 -->
				<div class="pdtInfo">
					<!-- 제품개요 -->
					<div class="pdtSummaryWrap">
						<div class="pdtThumb">
							<img src="../Product/${dto.brMainPhoto}"
								 style="height: 452px; width: 452px;" />
						</div>
						<div class="pdtSummary">

							<img
									src="../resources/images/mypage/img_profile_img_blank_60x60.png"
									alt="" Height=51px Width=52px />
							<ul>
								<li><span class="summaryT">평균 응답시간</span> <span
										class="value"><span class="count"> <span></span></span>분</span>
								</li>
								<li><span class="summaryT">현재 작업현황</span> <span
										class="value"><span class="count">0<span
										class="among">/<span>3</span></span></span>개</span>
								</li>
								<li><span class="summaryT">재능 작업일</span> <span
										class="value"><span class="count"> <span>2</span></span>일</span>
								</li>
								<li><span class="summaryT">평균 작업일</span> <span
										class="value"><span class="count"> <span>3</span></span>일</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- 제품개요 -->

					<!-- 제품상세 -->
					<div class="pdtResumeWrap">
						<div class="pdtMark">
							<ul>
								<li><span class="mark markType1">미스터스 인증</span></li>
								<li><span class="mark markType2" style="display: none;">총알 전달 가능</span></li>
							</ul>
							<span class="sellerOnline"> <span>ONLINE</span>
							</span>
						</div>
						<p class="pdtCategory">
							<span>${category1 }</span>- <span>${category2 }</span>
						</p>
						<div>
							<h2 class="pdtTitle">${dto.brSubject }</h2>
						</div>
						<h3 class="pdtPrice">재능가</h3>
						<div class="priceRating">
							<span class="price"> <span class="num"> <span>${dto.brPrice }</span>
							</span> <img class="won"
										 src="../resources/images/product/txt_won_detail.png" />
							</span> <span class="purchase"> <span class="count"> <span>0</span>
							</span>명 구매 <span class="ratingAvg"> <img
								src="../resources/images/product/ico_rating_star.gif" alt="" />
									<img src="../resources/images/product/ico_rating_star.gif"
										 alt="" /> <img
									src="../resources/images/product/ico_rating_star.gif" alt="" />
									<img src="../resources/images/product/ico_rating_star.gif"
										 alt="" /> <img
									src="../resources/images/product/ico_rating_star.gif" alt="" />
							</span>
							</span>
						</div>
						<div style="display:;">
							<div class="pdtOption">
								<h3>옵션선택</h3>
								<ol>
									<c:forEach var="i" begin="0" end="4" step="1">
										<c:if test="${op[i*2]!=null}">
											<li>
											<span class="input-check">
												<input type="checkbox" name="ops" id="${op[i*2+1]}" value="${op[i*2] }" onchange="opplus();"/>
											</span>
												<span class="label">${op[i*2] }</span>
												<span class="optionPrice">${op[i*2+1] }</span>
											</li>
										</c:if>
									</c:forEach>
								</ol>
								<input type="hidden" name="completedOption" id="completedOption" value="" />
								<input type="hidden" name="basicPrice" id="basicPrice" value="${dto.brPrice }"/>
								<input type="hidden" name="mainPhoto" value="${dto.brMainPhoto}" />
								<input type="hidden" name="category1" value="${category1 }" />
								<input type="hidden" name="category2" value="${category2 }" />
								<input type="hidden" name="subject" value="${dto.brSubject }" />
								<input type="hidden" name="brNum" value="${dto.brNum}">
							</div>
						</div>
						<div class="amount">
							총 금액&nbsp; <span class="price"> <input type="text" name="totalPrice" id="totalPrice" value="${dto.brPrice }" class="price" readonly="readonly" style="text-align: right;
border: 0px;"/>
							</span> 원
						</div>
						<div class="btnArea al_r">
							<a class="btnType2"
							   href=""><span>문의하기</span></a>
							<a class="btnType3" href="javascript:order()"><span>구매하기</span></a>
						</div>
					</div>
					<!-- 제품상세 -->
				</div>
				<!-- //제품정보 -->
			</form>
			<!-- 제품상세정보 -->
			<div class="pdt-block">
				<div class="pdtDetailWrap">
					<div class="pdtDetail" style="text-align: center"></div>
					<div class="pdtDetail" style="text-align: center">
						<img class="pdtDetail"
							 src="../Product/${dto.brMorePhoto}" /> <img
							src="../resources/images/product/txt_msg_product.png" /><br />
						<img src="../resources/images/product/btn_msg_product.png" />
					</div>

					<div class="pdtReview">
						<div id="pdtReviewBlock" class="tabMenu">
							<h4 class="tabBtn btn1">
								<a href="#photoReview"
								   onclick="tabMenu(this , 'pdtReviewBlock'); return false;">재능후기</a>
							</h4>
							<div id="photoReview" class="tabContents photoReview boardSection">
								<table cellpadding="0" cellspacing="0" class="tblType1">
									<colgroup>
										<col width="85" />
										<col width="435" />
										<col width="110" />
										<col width="105" />
									</colgroup>
									<thead>
									<tr>
										<th scope="col">
											<div class="th">평가</div>
										</th>
										<th scope="col">
											<div class="th">내용</div>
										</th>
										<th scope="col">
											<div class="th">작성자</div>
										</th>
										<th scope="col">
											<div class="th">작성일</div>
										</th>
									</tr>
									</thead>
									<tbody>

									<c:forEach var="dto" items="${lists}" varStatus="seq">
										<tr>
											<td class="num">
												<div class="td">
													<c:if test="${dto.cmRating==1}">
														★
													</c:if>
													<c:if test="${dto.cmRating==2}">
														★★
													</c:if>
													<c:if test="${dto.cmRating==3}">
														★★★
													</c:if>
													<c:if test="${dto.cmRating==4}">
														★★★★
													</c:if>
													<c:if test="${dto.cmRating==5}">
														★★★★★
													</c:if>
												</div>
											</td>
											<td class="subject important">
												<div class="td">
													<a href="#">${subject[seq.index]}</a>
												</div>
											</td>
											<td scope="col">
												<div class="td">${dto.cmNickName}</div>
											</td>
											<td scope="col">
												<div class="td" style="font-size:12px">${dto.cmDate}</div>
											</td>
										</tr>
										<tr class="boardCont">
											<td colspan="4">
												<div class="td">
													<div class="contents-block">
														${dto.cmContent}
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

									</tbody>
									<!--
                                                                                <tr>
                                                                                    <td colspan="4" class="seeMore">
                                                                                        <div class="td">
                                                                                            <a href="javascript:goNext2();">더보기</a>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr> -->
								</table>
								<span><br/></span>
								<form action="comments_ok.do" method="post" name="rateForm">
									<table>
										<tr>
											<td colspan="2">
												<textarea name="cm_content" class="textarea" title="소개" placeholder="평가를 남겨주세요." style="width: 100%;height: 64px;resize:none;" ></textarea>
											</td>
										</tr>
										<tr>
											<td>
												<select name="cm_rating" class="input-text" style="width: 105px;height: 27px;">
													<option value="1">★</option>
													<option value="2">★★</option>
													<option value="3" selected>★★★</option>
													<option value="4">★★★★</option>
													<option value="5">★★★★★</option>
												</select>
											</td>
											<td>
												<a class="btnType12" href='javascript:comment()' style="float:right ;height: 27px;" ><span>등록</span></a>
											</td>
										</tr>
									</table>
									<input type="hidden" name="cm_nickName" value="${sessionScope.session.mbNickName}">
									<input type="hidden" name="brNum" value="${dto.brNum}">
								</form>
							</div>
						</div>
					</div>

				</div>

				<!-- 관련재능 -->
				<div class="pdtRelated">
					<h3 class="title">관련재능</h3>
					<!-- 관련재능 반복하기 -->
					<c:forEach var="dto" items="${relists }">
					<ul>
						<li><a href="GDetail.do?brNum=${dto.brNum }">
									<span class="thumb"> <img
											src="../Product/${dto.brMainPhoto }"
											alt="7일간 유지되는 당신만의 타투디자인을 만들어 드립니다. " Height=160px Width=160px />
								</span> <span class="name"> ${dto.brSubject } </span> <span
								class="price">${dto.brPrice }</span>
						</a></li>
					</ul>
					</c:forEach>
				</div>
				<!-- //관련재능 -->

			</div>
			<!-- //제품상세정보 -->
		</div>

		<!-- quick link -->
		<div id="quickLinks">

			<!-- 사이드 퀵마이페이지 -->
			<div class="quick-mypage quick-mypage-re">
				<ul class="menuList">
					<li class="wishPdt"><a class="wishPdt" href=""><span>찜한재능</span></a>
					</li>
					<li class="recentPdt"><span class="t"><span>최근본재능</span></span>
						<ul>
							<li><a
									href="../Goods/GDetail.jsp?&cd=G00141027915739W&ct=1301004">
								<img
										src="../Product/M00141027494883W/Product/P141113123054.jpg"
										alt="혹시 취업하고 싶니? 자소서..." Height=78px Width=78px />
							</a></li>
							<li><a
									href="../Goods/GDetail.jsp?&cd=G00141114429841W&ct=1801007">
								<img
										src="../Product/M00141114120734W/Product/P141119123948.jpg"
										alt="중고차 거래 도와드립니다." Height=78px Width=78px />
							</a></li>
							<li><a
									href="../Goods/GDetail.jsp?&cd=G00141121760220W&ct=1801011">
								<img
										src="../Product/M00141106553600W/Product/P141121102007.jpg"
										alt="이 멘트 하나면 열 썸녀!!..." Height=78px Width=78px />
							</a></li>
							<li><a
									href="../Goods/GDetail.jsp?&cd=G00141111234780W&ct=1801011">
								<img
										src="../Product/M00141023346855W/Product/P141113125134.jpg"
										alt="[연애경력5년차] 연애상담,..." Height=78px Width=78px />
							</a></li>
							<li><a
									href="../Goods/GDetail.jsp?&cd=G00141116522190W&ct=1101002">
								<img
										src="../Product/M00141114627107W/Product/P141124170623.jpg"
										alt="동글동글 귀여운 캘리그라피 ..." Height=78px Width=78px />
							</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- //사이드 퀵마이페이지 -->

		</div>
		<!--//quick link-->

	</div>
	<!-- //contents -->

</div>

</body>
</html>
