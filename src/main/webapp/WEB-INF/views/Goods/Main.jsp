<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 4:10
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>

<div id="container">
    <div id="mainPromotion" class="mainPromotion">
        <div class="innerWrap">
            <div class="rollingWrap">
                <div class="controller">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="next">다음</a>
                    <a href="#" class="prev bg">이전</a>
                    <a href="#" class="next bg">다음</a>
                </div>
               
                <div class="rollingArea">
					 <c:forEach var="dto" begin="0" end="9" items="${newLists}">
                    <div class="promotionWrap">
                        <a href='../Goods/GDetail.action?brNum=${dto.brNum}'>
            <span class="thumb">
            <img src='../Product/${dto.brMainPhoto}' width="274px" height="274px" alt="사진없음" />
            </span>
            <span class="info">
            <span class="category">[${dto.cgCategory1}]</span>
            <span class="title" style="height: 44px;">${dto.brSubject}</span>
            <span class="price"><span class="num">${dto.brPrice}</span> 원</span>
            </span>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                
            </div>
            <div class="pager"></div>
        </div>
    </div>

    <!-- contents -->
    <div id="contents" class="mainWrap">

        <!-- TODAY HOT -->
        <h2 class="sectionTitle">TODAY’S <span>HOT</span></h2>

        <!-- //TODAY HOT -->
        <div id="WUC_MainGoodListHot_upMainGHot">

            <div class="pdtListWrap">
                <div class="pdtList">
                	<c:forEach var="dto" begin="0" end="17" items="${countLists}" varStatus="status">
                    <div class="pdtWrap">
                        <div class="sellerResume" >
                        <span class="sellingUser">

									<img
                                            src="../pds/imageFile/${dto.mbPic }"
                                            alt="" Height=36px Width=36px /> <span class="user_id">${dto.mbNickName} </span>
                        </span>
                            <div class="sellerCondition">
                                <span class="onOff on">ONLINE</span>
                                <span class="response">평균 응답시간 <span class="num">10</span>분</span>
                            </div>
                        </div>
                        <div >
                            <a href="../Goods/GDetail.action?brNum=${dto.brNum}">
                            <span class="pdtThumb">
                                <img src="../Product/${dto.brMainPhoto}" alt="기업용 홈페이지 제작해드립니다."  Height=308px  Width=308px   />
                                <span class="btnWistList on">
                                    <input type="button" id="wishList_${status.index}" style="border-style:None;" onclick="changeWishList(${status.index});return false;"/>
                                </span>
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
                </div>
            </div>
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
    <!-- //contents -->

</div>
</body>
</html>
