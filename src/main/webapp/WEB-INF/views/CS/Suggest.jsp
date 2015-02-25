<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-28
  Time: 오후 3:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>
<script language="javascript">


    function keyUp() {
        var maxLength = 50;
        var inputTxt = document.getElementById('htxt_title');
        var writeTag = document.getElementById('spLimit');

        if (inputTxt.value.length > 50) {
            alert('최대 글자수는 50자 입니다!');
            inputTxt.value = inputTxt.value.substring(0, maxLength);
        } else {
            writeTag.innerText = "(" + inputTxt.value.length + "/" + maxLength + ")";
        }

    }

</script>

<!-- 고객센터 header -->
<div id="customer_header">
    <div class="customer_header">
        <div class="topArea">
            <h2>TALENT 고객센터</h2>
            <p class="note">궁금하신 점이나 TALENT에게 바라는 점을 자유롭게 작성해 주세요.</p>
        </div>
        <ul class="csMenu">
            <li class=""><a href="/final/Etc/Notice.action">공지사항</a></li>
            <li class=""><a href="/final/Etc/FAQ.action">자주 묻는 질문</a></li>
            <li class="on"><a href="/final/Etc/Suggest.action">제안하기</a></li>
            <li class=""><a href="/final/Etc/Inquiry.action">1:1 문의</a></li>
        </ul>
    </div>
</div>
<!-- //고객센터 header -->

<div id="container">
    <!-- contents -->
    <div id="contents" class="cs_proposal">
        <div class="toMistus">
            <img src="../resources/images/customer/img_toMistus.gif" alt="To MISTUS team TALENT는 여러분의 신선한 아이디어로 성장하고있습니다. TALENT팀에게 제한사항이나 바라는 점을 보내주세요. 더욱 새로운 서비스로 보답하겠습니다." />
        </div>

        <h3 class="cs_h_title">제안하기</h3>

        <div class="user_input_form">
            <table cellpadding="0" cellspacing="0">
                <colgroup>
                    <col width="180px" />
                    <col width="*" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="th">이메일</div>
                    </th>
                    <td>
                        <div class="td"><span class="user_email">mjsung2@nate.com</span></div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">제목</div>
                    </th>
                    <td>
                        <div class="td">
                            <input type="text" id="htxt_title" class="input-text" style="width: 90%;" onkeyup="keyUp();" maxlength="50" />
                            <span class="char_limit" id="spLimit">(0/50)</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">내용</div>
                    </th>
                    <td>
                        <div class="td">
                            <textarea class="textarea" style="width: 100%; height: 180px;"></textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="th">파일첨부</div>
                    </th>
                    <td>
                        <div class="td">
                            <input type="file" class="input-file" style="width: 90%;" />
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
            <a class="btnType7" href="#"><span>제안하기</span></a>
            <a class="btnType8" href="#"><span>취소</span></a>
        </div>
    </div>
    <!-- //contents -->
</div>


</body>
</html>
