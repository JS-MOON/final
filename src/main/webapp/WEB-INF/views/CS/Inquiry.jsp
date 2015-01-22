<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 3:20
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
    <div id="contents" class="cs_inquiry">
        <h3 class="cs_h_title">나의 문의 내역</h3>

        <!-- 게시판영역 -->
        <div class="boardSection">
            <table cellpadding="0" cellspacing="0">
                <colgroup>
                    <col width="125px" />
                    <col width="*" />
                    <col width="125px" />
                    <col width="125px" />
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">
                        <div class="th">문의유형</div>
                    </th>
                    <th scope="col">
                        <div class="th">제목</div>
                    </th>
                    <th scope="col" class="date">
                        <div class="th">문의날짜</div>
                    </th>
                    <th scope="col" class="condition">
                        <div class="th">답변상태</div>
                    </th>
                </tr>
                </thead>
                <tbody>

                <tr>
                    <td colspan="4">
                        <div class="nodata">
                            등록된 1:1 문의가 없습니다.
                        </div>
                    </td>
                </tr>


                </tbody>
            </table>
            <div class="seeMore">
                <a id="ContentPlaceHolder1_WUC_CSInquiry1_lbtnGoNext" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSInquiry1$lbtnGoNext&#39;,&#39;&#39;)">더보기</a></div>
        </div>
        <!-- //게시판영역 -->

        <h3 class="cs_h_title">1:1 문의하기</h3>

        <div class="user_input_form">
            <table cellpadding="0" cellspacing="0">
                <colgroup>
                    <col width="180px" />
                    <col width="*" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="th">문의유형</div>
                    </th>
                    <td class="inquery_type">
                        <div class="td">
                            <span class="input-radio"><input type="radio" name="inquiryType" value="inquiry_type1" checked="checked" /></span>
                            <label for="inquiry_type1" class="label">재능 등록 관련</label>
                            <span class="input-radio"><input type="radio" name="inquiryType" value="inquiry_type2" /></span>
                            <label for="inquiry_type2" class="label">재능 구매 관련</label>
                            <span class="input-radio"><input type="radio" name="inquiryType" value="inquiry_type3" /></span>
                            <label for="inquiry_type3" class="label">충전/구매/결제</label>
                            <span class="input-radio"><input type="radio" name="inquiryType" value="inquiry_type4" /></span>
                            <label for="inquiry_type4" class="label">프리미엄관 관련</label>
                            <span class="input-radio"><input type="radio" name="inquiryType" value="inquiry_type5" /></span>
                            <label for="inquiry_type5" class="label">기타문의</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">이메일</div>
                    </th>
                    <td>
                        <div class="td"><span id="ContentPlaceHolder1_WUC_CSInquiry1_hsp_userID" class="user_email">mjsung2@nate.com</span></div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">제목</div>
                    </th>
                    <td>
                        <div class="td">
                            <input name="ctl00$ContentPlaceHolder1$WUC_CSInquiry1$htxt_title" type="text" id="ContentPlaceHolder1_WUC_CSInquiry1_htxt_title" class="input-text" style="width: 100%;" maxlength="50" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">내용</div>
                    </th>
                    <td>
                        <div class="td">
                            <textarea name="ctl00$ContentPlaceHolder1$WUC_CSInquiry1$htxt_content" id="ContentPlaceHolder1_WUC_CSInquiry1_htxt_content" class="textarea" style="width: 100%; height: 180px;"></textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">파일첨부</div>
                    </th>
                    <td>
                        <div class="td">
                            <input type="file" name="ctl00$ContentPlaceHolder1$WUC_CSInquiry1$fup_attached" id="ContentPlaceHolder1_WUC_CSInquiry1_fup_attached" class="input-file" style="width: 100%;" />
                            <p class="pleaseNote">(최대용량 2MB 이내 파일만 등록하실 수 있습니다.)</p>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="tbl_line"></div>
            <p class="noticeMsg">* 입력하신 정보는 제안내용에 대한 확인 및 보상을 위해 처리기간 동안만 보관하며, 마케팅 등 다른 목적으로 사용되지 않습니다.</p>
        </div>

        <div class="btnArea al_c">
            <a id="ctl00_ContentPlaceHolder1_WUC_CSInquiry1_lbtn_goInquiry" class="btnType7" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$WUC_CSInquiry1$lbtn_goInquiry&quot;, &quot;&quot;, true, &quot;GuestInquiry&quot;, &quot;&quot;, false, true))"><span>문의하기</span></a>
            <a id="ContentPlaceHolder1_WUC_CSInquiry1_lbtn_cancel" class="btnType8" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_CSInquiry1$lbtn_cancel&#39;,&#39;&#39;)"><span>취소</span></a>
        </div>
    </div>
    <!-- //contents -->
</div>

</body>
</html>
