<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 4:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title></title>
</head>
<body>
	<div id="container">
		<!-- contents -->
		<div id="contents" class="productMain">

			<!-- 본문 -->
			
			<div>
				<div class="pdtSort">
					
				</div>

				<!-- 제품리스트 -->
				<div class="pdtListWrap">
					<div class="pdtList">
					
					<!-- for문 -->
					<c:forEach var="dto" items="${lists}" varStatus="status">
					 <div class="pdtWrap">
                        <div class="sellerResume" >
                        <span class="sellingUser">
							<img src="../pds/imageFile/${dto.mbPic }" alt="" Height=36px Width=36px /> 
							<span class="user_id">${dto.mbNickName}</span>
                        </span>
                            <div class="sellerCondition">
                                <span class="onOff on">ONLINE</span>
                                <span class="response">평균 응답시간<span class="num">10</span>분</span>
                            </div>
                        </div>
                        <div >
                            <a href="../Goods/GDetail.action?brNum=${dto.brNum}">
                            <span class="pdtThumb">
                                <img src="../Product/${dto.brMainPhoto}" alt="기업용 홈페이지 제작해드립니다."  Height=308px  Width=308px   />
                                <c:if test="${dto.mbId.equals(mbId) }">
                                 <span class="btnWistList">
                                    <input type="button" id="wishList_${status.index}" value="${dto.brNum }" style="border-style:None;" onclick="changeWishList(${status.index});return false;"/>
                                </span>
                                </c:if>
                                <c:if test="${!dto.mbId.equals(mbId)}">
                                 <span class="btnWistList on">
                                    <input type="button" id="wishList_${status.index}" value="${dto.brNum }" style="border-style:None;" onclick="changeWishList(${status.index});return false;"/>
                                </span>
                                </c:if>
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
						<li class="wishPdt"><a class="wishPdt" href="../My/MyFavority.action"><span>찜한재능</span></a>
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
				<div id="quick-best" class="quick-best" style="display: none;">
					<h3>BEST</h3>
					<ul>
						<li><a href="../Goods/GList.jsp?cy=110">그래픽 · 디자인</a></li>
						<li><a href="../Goods/GList.jsp?cy=120">사업 · 전문가</a></li>
						<li><a href="../Goods/GList.jsp?cy=130">문서 · 레포트</a></li>
						<li><a href="../Goods/GList.jsp?cy=140">컴퓨터 · IT</a></li>
						<li><a href="../Goods/GList.jsp?cy=150">번역 · 외국어</a></li>
						<li><a href="../Goods/GList.jsp?cy=160">음악 · 동영상</a></li>
						<li><a href="../Goods/GList.jsp?cy=170">행사 · 공연</a></li>
						<li><a href="../Goods/GList.jsp?cy=180">노하우 · 상담</a></li>
						<li><a href="../Goods/GList.jsp?cy=190">생활서비스</a></li>
						<li><a href="../Goods/GList.jsp?cy=200">여행 · 가이드</a></li>
						<li><a href="../Goods/GList.jsp?cy=210">핸드메이드</a></li>
						<li><a href="javascript:alert('서비스 준비중 입니다');">프리미엄 재능관</a></li>
					</ul>
				</div>
			</div>
			<!-- //사이드 베스트 -->

		</div>
	</div>

</body>
</html>
