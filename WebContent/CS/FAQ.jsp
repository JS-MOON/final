<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 3:17
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
            <li id="WUC_CSHeader1_liBtnNotice" class=""><a href="./Notice.jsp">공지사항</a></li>
            <li id="WUC_CSHeader1_liBtnFAQ" class="on"><a href="./FAQ.jsp">자주 묻는 질문</a></li>
            <li id="WUC_CSHeader1_liBtnSuggest" class=""><a href="./Suggest.jsp">제안하기</a></li>
            <li id="WUC_CSHeader1_liBtnInquiry" class=""><a href="./Inquiry.jsp">1:1 문의</a></li>
        </ul>
    </div>
</div>
<!-- //고객센터 header -->

<div id="container">
    <!-- contents -->
    <div id="contents" class="cs_faq">
        <!-- 검색영역 -->
        <div class="searchBlock type2">
            <label for="" class="label">질문검색하기</label>
            <div class="innerWrap">
                <select name="ctl00$ContentPlaceHolder1$WUC_CSFAQ1$hddl_searchField" id="ContentPlaceHolder1_WUC_CSFAQ1_hddl_searchField" class="select">
                    <option selected="selected" value="1">제목</option>
                    <option value="2">내용</option>
                </select>
                <input name="ctl00$ContentPlaceHolder1$WUC_CSFAQ1$htxt_searchValue" type="text" id="ContentPlaceHolder1_WUC_CSFAQ1_htxt_searchValue" class="input-text" />
                <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtn_search" class="btnSrc" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtn_search&#39;,&#39;&#39;)">검색</a>
            </div>
        </div>
        <!-- //검색영역 -->

        <ul class="sortBy_top">
            <li id="ContentPlaceHolder1_WUC_CSFAQ1_liBtnSell" class="on">
                <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtn_Sell" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtn_Sell&#39;,&#39;&#39;)">판매관련</a>
            </li>
            <li id="ContentPlaceHolder1_WUC_CSFAQ1_liBtnBuy" class="">
                <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtn_Buy" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtn_Buy&#39;,&#39;&#39;)">구매관련</a>
            </li>
        </ul>

        <div id="faqGroup1" class="tabMenu">
            <h3 class="tabBtn btn1 on"><a id="aBest" href="#faq1_1" onclick="tabMenu(this , 'faqGroup1'); return false;"><span>BEST</span></a></h3>
            <div id="faq1_1" class="tabContents">
                <!-- 게시판영역 -->
                <div class="boardSection">
                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="65px" />
                            <col width="125px" />
                            <col width="*" />
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">
                                <div class="th">번호</div>
                            </th>
                            <th scope="col">
                                <div class="th" style="text-align: center;">유형</div>
                            </th>
                            <th scope="col">
                                <div class="th">내용</div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    12
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    수익금/계좌
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_0" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        거래 수수료는 얼마인가요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        거래 수수료는 얼마인가요<br /><br /><br />수수료는 판매 금액의 18.3%입니다. <br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    11
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    기타
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_1" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        광고 등록에 특별한 제한 사항이 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        광고 등록에 특별한 제한 사항이 있나요<br /><br /><br />미스터스에서 판매중인 재능만 광고를 할 수 있습니다.<br /><br />미스터스는 재능을 거래하는 ‘재능마켓’입니다.<br /><br />따라서 자신의 재능을 상품화 하여 광고를 할 수 있습니다.<br /><br />하지만  재능이 아닌 특정 회사 및 사이트, 블로그 등의 홍보를 위한 광고 등록은 불가능합니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    10
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    재능등록
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_2" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        등록한 재능을 편집하거나 판매를 중지삭제하고 싶습니다</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        등록한 재능을 편집하거나 판매를 중지삭제하고 싶습니다<br /><br /><br />등록하신 재능은 마이페이지 판매관리 에서 재능을 일시정지,진행,수정,삭제를 하실 수 있습니다. <br /><br />이미 승인된 재능이라면, 판매를 중지하시더라도 언제든지 다시 판매를 재진행을 할 수 있습니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    9
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    충전/구매/결제
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_3" class="subject">
                                <div class="td">
                                    <a href="#">
                                        배송을 했는데도 구매자가 구매를 확정하지 않아요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        배송을 했는데도 구매자가 구매를 확정하지 않아요<br /><br /><br />작업을 완료하신 후 결과물을 배송하셨더라도, 구매자가 결과물을 받아 보신 후 구매를 확정해야만 거래가 완료됩니다.<br /><br /> <br /><br />단, 구매자가 구매를 확정하지 않더라도 배송 후 7일이 지나면 자동으로 구매가 확정됩니다.<br /><br />하지만 구매자는 구매를 확정하면서 동시에 3가지 항목에 대해 재능 평가를 하게 됩니다.<br /><br />구매자로부터 좋은 평가를 받을수록 더 많은 구매자가 판매자님의 재능을 찾게 됩니다.<br /><br /> <br /><br />따라서 구매자가 구매를 확정함과 동시에 재능 평가를 하도록 안내해주신다면,<br /><br />수익금을 더 빨리 정산하실 수 있으며 더 좋은 평가를 받으실 수 있게 됩니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    8
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    수익금/계좌
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_4" class="subject">
                                <div class="td">
                                    <a href="#">
                                        어떻게 수익금을 출금할 수 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        어떻게 수익금을 출금할 수 있나요<br /><br /><br />수익금은 마이페이지 수익금관리에서 출금 신청할 수 있습니다.<br /><br />재능을 판매하시면 결제 금액에서 수수료 18.3%을 제한 금액이 판매자의 수익금으로 전달됩니다.<br /><br />수익금을 출금하시려면 미스터스 마이페이지 계정관리에서 실명 인증과 계좌 인증을 반드시 하셔야 합니다.<br /><br />사업자일 경우, 사업자등록증사본과 통장사본을 info@mistus.co.kr 으로 첨부하여 보내주시면<br /><br />사업자명으로 인증 처리를 받으실 수 있습니다.
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    7
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    수익금/계좌
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_5" class="subject">
                                <div class="td">
                                    <a href="#">
                                        언제 수익금을 출금할 수 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        언제 수익금을 출금할 수 있나요<br /><br /><br />출금 신청 가능 시간 이내(월요일 ~ 금요일 09:00 ~ 17:00)에 수익금을 출금 신청할 수 있습니다.<br /><br />구매자가 구매를 확정하시면, 즉시 판매자의 수익금으로 전달해 드립니다.<br /><br />출금 신청 가능 시간 이내(월요일 ~ 금요일 0900 ~ 1700)에 미스터스 마이페이지 수익금관리에서 출금 신청하시면,<br /><br />등록하신 계좌로 수익금이 인출됩니다.<br /><br /> <br /><br />수익금 송금일은 평일에 신청하실 경우 신청하신 날을 기준으로 영업일 1일 이내이며,<br /><br />공휴일(주말) 및 법정 휴일이 익일일 경우 신청하신 날을 기준으로 해당 휴일 다음 날에 송금 됩니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    6
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    기타
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_6" class="subject">
                                <div class="td">
                                    <a href="#">
                                        작업이 길어질 것 같은데 배송완료를 미리 하고 작업을 진행해도 되나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        작업이 길어질 것 같은데 배송완료를 미리 하고 작업을 진행해도 되나요<br /><br /><br />작업이 완벽하게 완료 되었을 때 배송을 완료하시기 바랍니다.<br /><br />만약 작업이 완성되지 않은 채로, 배송완료를 할 경우 구매자는 주문을 수정취소 요청할 권리가 있습니다.<br /><br />늦은 배송이 되더라도 꼭 작업을 마무리하신 후 배송 완료하시기 바랍니다.<br /><br />다만 구매자의 요구가 변경되어 배송이 늦어진 경우에는 미스터스 고객센터로 문의 주시면,<br /><br />판매자의 재능 신뢰도에 영향을 미치지 않도록 조정하도록 하겠습니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    5
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    기타
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_7" class="subject">
                                <div class="td">
                                    <a href="#">
                                        재능 광고란 무엇인가요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        재능 광고란 무엇인가요<br /><br /><br />자신의 재능을 더 많은 구매자에게 노출하는 방법 중 하나로 미스터스 재능 광고를 신청할 수 있습니다.<br /><br />미스터스 재능 광고를 신청하시면 등록 된 재능을 미스터스의 메인 페이지에 노출하여,<br /><br />미스터스 사이트를 방문하는 모든 사용자가 볼 수 있게 됩니다.<br /><br />실제로 미스터스의 메인 페이지에 노출되는 재능은 그렇지 않은 재능보다 월등히 높은 판매율을 보이고 있습니다. <br /><br />더 자세한 내용은 사이트 하단 광고하기를 확인해 주세요.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    4
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    재능등록
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_8" class="subject">
                                <div class="td">
                                    <a href="#">
                                        재능등록 심사규정은 어떻게 되나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        재능등록 심사규정은 어떻게 되나요<br /><br /><br />미스터스의 재능등록 심사규정은 아래와 같습니다.<br /><br />재능 내용에 관한 규정<br />-재능에 대한 설명이 명확하지 않거나 부족하여 판매하는 재능의 내용을 파악하기 어려운 경우<br />-재능 제목과 내용이 일치하지 않거나 재능 거래와는 상관 없는 목적의 글이 작성되었을 경우<br />-선택한 카테고리와 재능의 내용이 관련성이 없을 경우<br />-주요 재능 내용이 옵션으로만 설정되어 있을 경우<br />-재능에 대한 판매의 목적이 아닌 특정 사이트프로그램 등에 대한 홍보성이 다분할 경우<br />-하나의 재능에 여러가지 내용을 등록할 경우 (단일한 재능 내용이 아닐 경우)<br />-재능 제목이 내용과 상관 없는 내용으로 등록 되었거나 오해의 소지가 있을 경우<br />-다른 계정으로 동일 재능을 중복 등록할 경우<br /><br />재능 가격에 관한 규정<br />-재능의 기본 가격에 대한 설명이 부족할 경우<br />-재능 설명 상에 기재된 금액과 실제 등록한 금액이 다른 경우<br /><br />기타 규정<br />-불법 프로그램 판매나 저작권에 위배되는 내용을 등록하였거나 그럴 소지가 있는 재능일 경우<br />-타 사이트 명로고이미지를 무단으로 사용하였거나 그럴 소지가 있는 재능일 경우<br />-재능과 관련이 없는 이미지나 사진을 사용하였을 경우<br />-불법적으로 악용될 우려가 있는 재능일 경우<br />-구체적인 사유로 구매자의 신고가 접수된 재능일 경우<br />-기타 관계 규정법규에 위배되는 내용이거나 사이트의 원활한 운영을 저해하는 내용의 재능일 경우<br /><br />직거래 유도에 관한 규정<br />-외부 링크 및 로고연락처메일 주소를 재능 내용상에 공개하여 등록한 경우<br />-기타 외부 거래로 유도 가능성이 있는 내용을 기재한 경우<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    3
                                </div>
                            </td>
                            <td class="num">
                                <div class="td" style="text-align: center;">
                                    재능등록
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpBestList_tdBest_9" class="subject">
                                <div class="td">
                                    <a href="#">
                                        재능을 등록할 때 어떤 내용을 입력해야 하나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="3">
                                <div class="td">
                                    <div class="contents-block">
                                        재능을 등록할 때 어떤 내용을 입력해야 하나요<br /><br /><br />재능 카테고리별로 아래의 사항을 반드시 지켜주셔야만 재능이 승인됩니다.<br /><br /> <br /><br />공통<br />-재능과 관련이 있는 사진을 등록해 주세요. 회원님의 재능 구매자가 많아집니다.<br />-직접 작업하신 포트폴리오를 등록해 주세요.<br />-타인의 포트폴리오를 이용하여 신고가 접수될 경우, 미스터스 에서는 책임지지 않습니다<br />-재능 작업일을 정확하게 작성해야 하며, 배송이 늦어질 경우 구매자에게 미리 알려 주세요.<br />-배송 기간을 지켜주시면 재능 신뢰도가 높아집니다.<br />-구매자가 배송받은 재능에 대해 사용 가능한 범위를 기재해 주세요<br /> 예) 개인용, 상업용, 재배포 가능 등<br /> <br /><br />디자인 - 공통<br />-디자인 수정 가능 여부 및 수정 가능 횟수를 기재해 주세요.<br />-기본 가격에 원본 비용 포함여부를 기재해 주세요. 또는 원본 포함을 옵션으로 제공해 주세요.<br />-포트폴리오에 기본 이미지 이에외 상세 이미지를 2개 이상 등록해 주세요. 포트폴리오가 많을수록 구매자가 많아집니다.<br /><br /><br />문서 - 번역<br />-아래의 예시와 같은 번역 기준을 작성해 주세요.<br />-A4 장당 글자체 돋움체  글자크기 12pt  줄간격 200%  좌우상하 여백 <br />-일반 영한 200단어 당 5천원(단어당 25원)<br /><br /><br />컴퓨터 - 공통<br />-사용하시는 언어와 플랫폼을 기재해 주세요.<br />-많은 구매자가 프로그래밍 언어나 플랫폼을 기준으로 재능을 검색합니다.<br /><br /><br />컴퓨터 - 홈페이지웹개발<br />-홈페이지 AS 가능 여부 및 관리 기간을 기재해 주세요.<br /><br /><br />음악&영상 - 공통<br />-음악 편집 및 동영상 편집의 경우, 포트폴리오 동영상 URL을 기재해 주세요.<br />-구매자는 회원님이 만드신 포트폴리오를 직접 보고 구매를 결정합니다.<br /><br /><br />생활서비스 - 공통<br />-애인대행, 불건전한 만남등의 재능은 등록하지 말아주세요.<br />-방문 서비스의 경우, 방문 가능한 지역을 기재해 주세요.<br /><br /><br />핸드메이드 - 공통<br />-판매자가 직접 만드는 과정을 보여주세요.<br />-구매자는 회원님이 직접 만드시는 과정에 감탄해야만 구매를 합니다.<br />-포트폴리오에 기본 이미지 이에외 상세 이미지를 2개 이상 등록해 주세요.<br />-포트폴리오가 많을수록 구매자가 많아집니다.<br />-재능 기본 가격에 배송료가 포함되는지 여부를 기재해 주세요
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="seeMore">
                        <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtnNpBest" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtnNpBest&#39;,&#39;&#39;)">더보기</a>
                    </div>
                </div>
                <!-- //게시판영역 -->
            </div>
            <h3 id="hTapAbility" class="tabBtn btn2"><a id="aAbility" href="#faq1_2" onclick="tabMenu(this , 'faqGroup1'); return false;"><span>재능등록</span></a></h3>
            <div id="faq1_2" class="tabContents">
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
                                    7
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_0" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        등록한 재능을 편집하거나 판매를 중지삭제하고 싶습니다</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        등록한 재능을 편집하거나 판매를 중지삭제하고 싶습니다<br /><br /><br />등록하신 재능은 마이페이지 판매관리 에서 재능을 일시정지,진행,수정,삭제를 하실 수 있습니다. <br /><br />이미 승인된 재능이라면, 판매를 중지하시더라도 언제든지 다시 판매를 재진행을 할 수 있습니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    6
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_1" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        재능등록 심사규정은 어떻게 되나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        재능등록 심사규정은 어떻게 되나요<br /><br /><br />미스터스의 재능등록 심사규정은 아래와 같습니다.<br /><br />재능 내용에 관한 규정<br />-재능에 대한 설명이 명확하지 않거나 부족하여 판매하는 재능의 내용을 파악하기 어려운 경우<br />-재능 제목과 내용이 일치하지 않거나 재능 거래와는 상관 없는 목적의 글이 작성되었을 경우<br />-선택한 카테고리와 재능의 내용이 관련성이 없을 경우<br />-주요 재능 내용이 옵션으로만 설정되어 있을 경우<br />-재능에 대한 판매의 목적이 아닌 특정 사이트프로그램 등에 대한 홍보성이 다분할 경우<br />-하나의 재능에 여러가지 내용을 등록할 경우 (단일한 재능 내용이 아닐 경우)<br />-재능 제목이 내용과 상관 없는 내용으로 등록 되었거나 오해의 소지가 있을 경우<br />-다른 계정으로 동일 재능을 중복 등록할 경우<br /><br />재능 가격에 관한 규정<br />-재능의 기본 가격에 대한 설명이 부족할 경우<br />-재능 설명 상에 기재된 금액과 실제 등록한 금액이 다른 경우<br /><br />기타 규정<br />-불법 프로그램 판매나 저작권에 위배되는 내용을 등록하였거나 그럴 소지가 있는 재능일 경우<br />-타 사이트 명로고이미지를 무단으로 사용하였거나 그럴 소지가 있는 재능일 경우<br />-재능과 관련이 없는 이미지나 사진을 사용하였을 경우<br />-불법적으로 악용될 우려가 있는 재능일 경우<br />-구체적인 사유로 구매자의 신고가 접수된 재능일 경우<br />-기타 관계 규정법규에 위배되는 내용이거나 사이트의 원활한 운영을 저해하는 내용의 재능일 경우<br /><br />직거래 유도에 관한 규정<br />-외부 링크 및 로고연락처메일 주소를 재능 내용상에 공개하여 등록한 경우<br />-기타 외부 거래로 유도 가능성이 있는 내용을 기재한 경우<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    5
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_2" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        재능을 등록하면 언제부터 판매할 수 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        재능을 등록하면 언제부터 판매할 수 있나요<br /><br /><br />신규재능일 경우 업무 시간 이내(월요일 ~ 금요일 0900 ~ 1800)에 관리자 승인 후 미스터스에 노출 됩니다.<br /><br />휴일 및 공휴일에는 승인이 되지 않으니 참고해주시기 바랍니다.<br /><br />이미 승인이 된 재능의 경우 수정을 요청할 경우 수정 전 내용으로 판매가 지속되며,<br /><br />추후 최종 승인이 된 뒤에는 수정 된 내용이 반영 되어 노출 됩니다. <br /><br />단순히 재능을 수정한 경우라도 미스터스 재능 규정에 어긋난다면, 승인거절 처리될 수 있습니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    4
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_3" class="subject">
                                <div class="td">
                                    <a href="#">
                                        재능을 등록할 때 반드시 휴대폰 인증을 받아야 하나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        재능을 등록할 때 반드시 휴대폰 인증을 받아야 하나요<br /><br /><br />보다 안전하고 원활한 거래를 위해 재능 등록 시 최초 1회에 한해 휴대폰 인증을 시행하고 있습니다.<br /><br />인증 된 휴대폰 번호는 기본적으로 재능 결제가 이루어진 후 구매자에게 노출 되며,<br /><br />해당 휴대폰 번호를 제외하고 업무상 연락이 가능한 다른 연락처가 있을 경우,<br /><br />언제든지 미스터스 마이페이지 프로필 화면 혹은 재능 등록 시 변경 및 재등록이 가능하므로 이용에 많은 참고 부탁 드립니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    3
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_4" class="subject">
                                <div class="td">
                                    <a href="#">
                                        재능을 등록할 때 어떤 내용을 입력해야 하나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        재능을 등록할 때 어떤 내용을 입력해야 하나요<br /><br /><br />재능 카테고리별로 아래의 사항을 반드시 지켜주셔야만 재능이 승인됩니다.<br /><br /> <br /><br />공통<br />-재능과 관련이 있는 사진을 등록해 주세요. 회원님의 재능 구매자가 많아집니다.<br />-직접 작업하신 포트폴리오를 등록해 주세요.<br />-타인의 포트폴리오를 이용하여 신고가 접수될 경우, 미스터스 에서는 책임지지 않습니다<br />-재능 작업일을 정확하게 작성해야 하며, 배송이 늦어질 경우 구매자에게 미리 알려 주세요.<br />-배송 기간을 지켜주시면 재능 신뢰도가 높아집니다.<br />-구매자가 배송받은 재능에 대해 사용 가능한 범위를 기재해 주세요<br /> 예) 개인용, 상업용, 재배포 가능 등<br /> <br /><br />디자인 - 공통<br />-디자인 수정 가능 여부 및 수정 가능 횟수를 기재해 주세요.<br />-기본 가격에 원본 비용 포함여부를 기재해 주세요. 또는 원본 포함을 옵션으로 제공해 주세요.<br />-포트폴리오에 기본 이미지 이에외 상세 이미지를 2개 이상 등록해 주세요. 포트폴리오가 많을수록 구매자가 많아집니다.<br /><br /><br />문서 - 번역<br />-아래의 예시와 같은 번역 기준을 작성해 주세요.<br />-A4 장당 글자체 돋움체  글자크기 12pt  줄간격 200%  좌우상하 여백 <br />-일반 영한 200단어 당 5천원(단어당 25원)<br /><br /><br />컴퓨터 - 공통<br />-사용하시는 언어와 플랫폼을 기재해 주세요.<br />-많은 구매자가 프로그래밍 언어나 플랫폼을 기준으로 재능을 검색합니다.<br /><br /><br />컴퓨터 - 홈페이지웹개발<br />-홈페이지 AS 가능 여부 및 관리 기간을 기재해 주세요.<br /><br /><br />음악&영상 - 공통<br />-음악 편집 및 동영상 편집의 경우, 포트폴리오 동영상 URL을 기재해 주세요.<br />-구매자는 회원님이 만드신 포트폴리오를 직접 보고 구매를 결정합니다.<br /><br /><br />생활서비스 - 공통<br />-애인대행, 불건전한 만남등의 재능은 등록하지 말아주세요.<br />-방문 서비스의 경우, 방문 가능한 지역을 기재해 주세요.<br /><br /><br />핸드메이드 - 공통<br />-판매자가 직접 만드는 과정을 보여주세요.<br />-구매자는 회원님이 직접 만드시는 과정에 감탄해야만 구매를 합니다.<br />-포트폴리오에 기본 이미지 이에외 상세 이미지를 2개 이상 등록해 주세요.<br />-포트폴리오가 많을수록 구매자가 많아집니다.<br />-재능 기본 가격에 배송료가 포함되는지 여부를 기재해 주세요
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    2
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_5" class="subject">
                                <div class="td">
                                    <a href="#">
                                        재능이 승인거절 처리 되었어요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        <br />재능 옵션을 추가한 경우 마땅한 이유가 있어야 합니다<br /><br />재능은 모두 기본 가격을 정할 수 있습니다.<br /><br />따라서 옵션을 추가하여 옵션 가격이 추가된다면,<br /><br />반드시 기본 재능 상품에 추가적인 서비스 또는 결과물에 대해 기술하셔야 합니다.<br /><br />예를 들어 디자인 시안이 추가된다든지 또는 기본 1장에 1장 더 추가된다든지와 같이,<br /><br />재능 옵션은 반드시 추가적인 헤택이 있어야 합니다.<br /><br /> <br /><br /><br />재능 설명에 계좌번호, 이메일, 전화 번호, 블로그, 카페 등과 같은 개인 연락처 또는 외부 사이트를 노출할 수 없습니다.<br /><br />포트폴리오가 필요할 경우 캡쳐 등을 통해 이미지화 하여 재능 등록 시 첨부파일 형태로 게재하여 주시기 바랍니다.<br /><br /> <br /><br />동일한 재능을 중복해서 등록할 수 없습니다<br /><br />동일한 재능을 중복해서 등록 판매할 수 없습니다. <br /><br /> <br /><br />성인, 도박과 같은 불건전한 내용 또는 불법적인 내용을 포함해서는 안됩니다<br /><br />성인 사진, 도박 과련 재능과 같이 불건전하거나 불법적인 재능은 등록할 수 없습니다.<br /><br /> <br /><br />금기어를 사용해서는 안 됩니다<br /><br />사이트의 이용환경에 맞지 않거나, 유사 경쟁 업체와 관련한 키워드는 등록하실 수 없습니다.<br />
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
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpAbility_tdAbility_6" class="subject">
                                <div class="td">
                                    <a href="#">
                                        판매중인 재능이 갑자기 중단승인거절 되었어요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        판매중인 재능이 갑자기 중단승인거절 되었어요<br /><br /><br />미스터스의 안전거래 정책에 위반 되는 행위로 인해 필터링 되었거나<br /><br />관련 사항에 대한 신고가 있었을 경우 판매 중인 재능이 삭제 될 수 있습니다.<br /><br />일반적인 삭제 사유는 다음과 같습니다.<br />-직거래 유도 적발<br />-주문판매 후 연락두절<br />-홍보스팸메시지 대량 발송<br />-욕설, 협박, 성인 메시지 전송<br />-일방적 주문취소 신고<br />-사기성 판매 (재능설명과 전혀 다를 경우)<br />-주문 후 외부거래 유도 적발<br />-불법, 저작권 침해<br /><br /> <br /><br />심사 대기 중이었던 재능이 승인 되지 못하고 승인이 거절 되는 것은,<br /><br />등록하신 재능이 재능등록 심사규정 상의 항목에 따라 승인 과정에서 거절 된 것이며<br /><br />거절 사유는 미스터스 메세지를 통해 안내 드리고 있사오니 이용에 참고하여 주시기 바랍니다.<br /><br /> <br /><br />만약 위의 사항에 해당하지 않는데도 불구하고 재능 승인이 거절 되었거나 삭제 되었다면 <br /><br />미스터스 고객센터로 문의해주시기 바랍니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="seeMore">
                        <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtnNpAbility" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtnNpAbility&#39;,&#39;&#39;)">더보기</a>
                    </div>
                </div>
                <!-- //게시판영역 -->
            </div>
            <h3 id="hTapRecharge" class="tabBtn btn3"><a id="aRecharge" href="#faq1_3" onclick="tabMenu(this , 'faqGroup1'); return false;"><span>충전/구매/결제</span></a></h3>
            <div id="faq1_3" class="tabContents">
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
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpRecharge_tdRecharge_0" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        배송을 했는데도 구매자가 구매를 확정하지 않아요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        배송을 했는데도 구매자가 구매를 확정하지 않아요<br /><br /><br />작업을 완료하신 후 결과물을 배송하셨더라도, 구매자가 결과물을 받아 보신 후 구매를 확정해야만 거래가 완료됩니다.<br /><br /> <br /><br />단, 구매자가 구매를 확정하지 않더라도 배송 후 7일이 지나면 자동으로 구매가 확정됩니다.<br /><br />하지만 구매자는 구매를 확정하면서 동시에 3가지 항목에 대해 재능 평가를 하게 됩니다.<br /><br />구매자로부터 좋은 평가를 받을수록 더 많은 구매자가 판매자님의 재능을 찾게 됩니다.<br /><br /> <br /><br />따라서 구매자가 구매를 확정함과 동시에 재능 평가를 하도록 안내해주신다면,<br /><br />수익금을 더 빨리 정산하실 수 있으며 더 좋은 평가를 받으실 수 있게 됩니다.<br />
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
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpRecharge_tdRecharge_1" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        추가 결제 요청은 어떻게 하나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        추가 결제 요청은 어떻게 하나요<br /><br /><br />구매자가 결제한 금액 이상의 작업을 요청하셨다면, 구매자에게 추가 결제를 요청할 수 있습니다.<br /><br />추가 결제는 구매자만이 할 수 있습니다.<br /><br />구매자의 요구가 결제 금액보다 무리한 요구인 경우, 그에 합당한 추가 금액을 요청할 수 있습니다.<br /><br />반드시 구매자와 상담 후에 거래 금액이 확정 되면 요청하시기 바랍니다.<br /><br />만약 재능 설명에서 이미 약속한 작업에 대해 추가 요청을 하시거나 합당하지 않은 금액의 결제 요구를 하신다면<br /><br />구매자는 해당 거래를 취소할 수 있는 권리가 있습니다.<br /><br />또한 그러한 추가 결제 요청에 대해 신고가 접수 될 경우,<br /><br />미스터스는 건강한 재능 거래 문화를 만들기 위해 그에 따른 제지를 할 수 있습니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="seeMore">
                        <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtnNpRecharge" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtnNpRecharge&#39;,&#39;&#39;)">더보기</a>
                    </div>
                </div>
                <!-- //게시판영역 -->
            </div>
            <h3 id="hTapProfit" class="tabBtn btn4"><a id="aProfit" href="#faq1_4" onclick="tabMenu(this , 'faqGroup1'); return false;"><span>수익금/계좌</span></a></h3>
            <div id="faq1_4" class="tabContents">
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
                                    4
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpProfits_tdProfits_0" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        거래 수수료는 얼마인가요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        거래 수수료는 얼마인가요<br /><br /><br />수수료는 판매 금액의 18.3%입니다. <br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    3
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpProfits_tdProfits_1" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        어떻게 수익금을 출금할 수 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        어떻게 수익금을 출금할 수 있나요<br /><br /><br />수익금은 마이페이지 수익금관리에서 출금 신청할 수 있습니다.<br /><br />재능을 판매하시면 결제 금액에서 수수료 18.3%을 제한 금액이 판매자의 수익금으로 전달됩니다.<br /><br />수익금을 출금하시려면 미스터스 마이페이지 계정관리에서 실명 인증과 계좌 인증을 반드시 하셔야 합니다.<br /><br />사업자일 경우, 사업자등록증사본과 통장사본을 info@mistus.co.kr 으로 첨부하여 보내주시면<br /><br />사업자명으로 인증 처리를 받으실 수 있습니다.
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">
                                <div class="td">
                                    2
                                </div>
                            </td>
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpProfits_tdProfits_2" class="subject important">
                                <div class="td">
                                    <a href="#">
                                        언제 수익금을 출금할 수 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        언제 수익금을 출금할 수 있나요<br /><br /><br />출금 신청 가능 시간 이내(월요일 ~ 금요일 09:00 ~ 17:00)에 수익금을 출금 신청할 수 있습니다.<br /><br />구매자가 구매를 확정하시면, 즉시 판매자의 수익금으로 전달해 드립니다.<br /><br />출금 신청 가능 시간 이내(월요일 ~ 금요일 0900 ~ 1700)에 미스터스 마이페이지 수익금관리에서 출금 신청하시면,<br /><br />등록하신 계좌로 수익금이 인출됩니다.<br /><br /> <br /><br />수익금 송금일은 평일에 신청하실 경우 신청하신 날을 기준으로 영업일 1일 이내이며,<br /><br />공휴일(주말) 및 법정 휴일이 익일일 경우 신청하신 날을 기준으로 해당 휴일 다음 날에 송금 됩니다.<br />
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
                            <td id="ContentPlaceHolder1_WUC_CSFAQ1_rpProfits_tdProfits_3" class="subject">
                                <div class="td">
                                    <a href="#">
                                        판매 수익금은 언제 받을 수 있나요</a>
                                </div>
                            </td>

                        </tr>
                        <tr class="boardCont">
                            <td colspan="2">
                                <div class="td">
                                    <div class="contents-block">
                                        판매 수익금은 언제 받을 수 있나요<br /><br /><br />거래가 성사되었다면, 판매자가 배송을 완료한 후 구매자가 구매를 확정한 즉시<br /><br />수수료를 제외한 결제금을 판매자분의 수익금으로 전환합니다.<br /><br /> <br /><br />그리고 구매자가 구매를 확정하지 않더라도,<br /><br />7일이 지나면 자동으로 구매가 확정되며 결제금을 판매자분의 수익금으로 전환합니다.<br /><br /> <br /><br />수익금은 마이페이지 수익금관리 페이지에서 확인할 수 있으며,<br /><br />출금 신청을 하시면 1영업일 이내에 회원님의 계좌로 출금해 드립니다.<br />
                                        <div class="go_inquiry">답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. <a href="./Inquiry.jsp">1:1문의하기 ></a></div>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="seeMore">
                        <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtnNpProfit" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtnNpProfit&#39;,&#39;&#39;)">더보기</a>
                    </div>
                </div>
                <!-- //게시판영역 -->
            </div>
            <h3 id="hTapPremium" class="tabBtn btn5"><a id="aPremium" href="#faq1_5" onclick="tabMenu(this , 'faqGroup1'); return false;"><span>프리미엄관</span></a></h3>
            <div id="faq1_5" class="tabContents">
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

                        </tbody>
                    </table>
                    <div class="seeMore">
                        <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtnNpPremium" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtnNpPremium&#39;,&#39;&#39;)">더보기</a>
                    </div>
                </div>
                <!-- //게시판영역 -->
            </div>
            <h3 id="hTapEtc" class="tabBtn btn6"><a id="aEtc" href="#faq1_6" onclick="tabMenu(this , 'faqGroup1'); return false;"><span>기타</span></a></h3>
            <div id="faq1_6" class="tabContents">
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

                        </tbody>
                    </table>
                    <div class="seeMore">
                        <a id="ContentPlaceHolder1_WUC_CSFAQ1_lbtnNpEtc" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSFAQ1$lbtnNpEtc&#39;,&#39;&#39;)">더보기</a>
                    </div>
                </div>
                <!-- //게시판영역 -->
            </div>
        </div>
    </div>
</div>


</body>
</html>
