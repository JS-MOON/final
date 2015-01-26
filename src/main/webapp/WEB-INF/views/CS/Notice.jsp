<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 2:53
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>
<!-- 고객센터 header -->
<div id="customer_header">
    <div class="customer_header">
        <div class="topArea">
            <h2>미스터스 고객센터</h2>
            <p class="note">궁금하신 점이나 미스터스에게 바라는 점을 자유롭게 작성해 주세요.</p>
            <div class="csNumber">
                <span class="phone">1600-3667</span>
                <span class="time">월~금 09:00 ~ 18:00</span>
            </div>
        </div>
        <ul class="csMenu">
            <li id="WUC_CSHeader1_liBtnNotice" class="on"><a href="/final/Etc/Notice.action">공지사항</a></li>
            <li id="WUC_CSHeader1_liBtnFAQ" class=""><a href="/final/Etc/FAQ.action">자주 묻는 질문</a></li>
            <li id="WUC_CSHeader1_liBtnSuggest" class=""><a href="/final/Etc/Suggest.action">제안하기</a></li>
            <li id="WUC_CSHeader1_liBtnInquiry" class=""><a href="/final/Etc/Inquiry.action">1:1 문의</a></li>
        </ul>
    </div>
</div>
<!-- //고객센터 header -->

    <div id="container">
        <!-- contents -->
        <div id="contents" class="cs_notice">
            <!-- 게시판영역 -->
            <div class="boardSection">
                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="125px" />
                        <col width="*" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="th">번호</div>
                        </th>
                        <th scope="col">
                            <div class="th">제목</div>
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td class="num">
                            <div class="td">
                                2
                            </div>
                        </td>
                        <td id="ContentPlaceHolder1_WUC_CSNotice1_rptList_tdClass_0" class="subject important">
                            <div class="td">
                                <a href="#">[공지]
                                    재능 등록하시기 전 필독!</a>
                            </div>
                        </td>

                    </tr>
                    <tr class="boardCont">
                        <td colspan="2">
                            <div class="td">
                                <div class="contents-block">
                                    안녕하세요! 미스터스 관리자입니다.<br />저희 재능마켓에 재능을 등록하고자 하시는 많은 분들께 감사의 말씀 드립니다.<br /><br />우선 저희 미스터스는 다른 재능마켓과는 다르게 <br />재능인의 재능 하나하나 별도의 디자인 페이지를 만들어 드리고 있습니다.<br /><br />디자인이 들어가는 영역은 다음과 같습니다.<br />1. 대표 썸네일 : 목록에 노출되는 대표 이미지<br />2. 재능 프로필 : 재능 상세페이지의 최상단 프로필+가격정보 영역<br />3. 정보 및 예제 : 재능 프로필 밑으로 들어가는 재능 정보와 예시 이미지<br /><br />그렇기 때문에 저희는 재능인들의 질좋은 많은 자료들을 받고자 합니다!<br />좋은 퀄리티의 사진이나(얼굴이 나온 본인의 사진이면 좋아요^^) 포트폴리오 이미지, 작업환경 사진 등<br />최대한 많은 이미지 자료를 주셔야지 원활한 작업이 이루어 집니다.<br /><br />제목과 간단한 1~2줄의 설명을 가지고 페이지 디자인을 하기엔 너무나도 어렵답니다 :<<br />다소 번거롭지만 더욱 퀄리티있는 디자인 페이지로 많은 사람들이 구매가 이루어 질 수 있도록<br />첨부파일에 가능한 많은 사진자료들을 압축해서 등록해주시길 바랍니다. :D<br /><br />또한, 디자인 작업은 등록 순차적으로 이루어지며 평일 기준으로 최대 7일정도까지 소요됩니다!<br />등록을 하셨지만 저희가 판단하기에 다소 자료가 부족하신 분들께는<br />추가 요청을 위한 안내 문자 혹은 전화가 갈 예정입니다.<br /><br />재능의 판매는 사이트가 완료되는 시점부터 이루어 지게 됩니다. <br />약 한달 정도로 예상하고 있으며 더 빠르게 사이트가 완료될 수 있도록 최선을 다하겠습니다!<br /><br />많은 협조 부탁드리고 미스터스에서 대박 재능인으로 모두 성공하시길 기원합니다^^
                                    <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td class="num">
                            <div class="td">
                                1
                            </div>
                        </td>
                        <td id="ContentPlaceHolder1_WUC_CSNotice1_rptList_tdClass_1" class="subject important">
                            <div class="td">
                                <a href="#">[공지]
                                    미스터스팀 새롭게 출발합니다!</a>
                            </div>
                        </td>

                    </tr>
                    <tr class="boardCont">
                        <td colspan="2">
                            <div class="td">
                                <div class="contents-block">
                                    안녕하세요 미스터스팀 입니다.<br /><br />미스터스가 새롭게 발돋움합니다.<br /><br />재능마켓의 새로운 패러다임으로<br /><br />신선한 재능과 알찬 내용들로<br /><br />만족시켜드리겠습니다.
                                    <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
                <div class="seeMore">
                    <a id="ContentPlaceHolder1_WUC_CSNotice1_lbtnGoNext" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSNotice1$lbtnGoNext&#39;,&#39;&#39;)">더보기</a></div>
            </div>
            <!-- //게시판영역 -->

            <!-- 검색영역 -->
            <div class="searchBlock type1">
                <select name="ctl00$ContentPlaceHolder1$WUC_CSNotice1$hddl_searchField" id="ContentPlaceHolder1_WUC_CSNotice1_hddl_searchField" class="select">
                    <option selected="selected" value="1">제목</option>
                    <option value="2">내용</option>
                </select>
                <input name="ctl00$ContentPlaceHolder1$WUC_CSNotice1$htxt_searchValue" type="text" id="ContentPlaceHolder1_WUC_CSNotice1_htxt_searchValue" class="input-text" />
                <a id="ContentPlaceHolder1_WUC_CSNotice1_lbtn_searchBtn" class="btnSrc" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSNotice1$lbtn_searchBtn&#39;,&#39;&#39;)">검색</a>
            </div>
            <!-- //검색영역 -->
        </div>
        <!-- //contents -->
    </div>

</body>
</html>
