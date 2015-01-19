<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<script>
    function popUP(mypage, myname, winl, wint, w, h, scroll, titlebar, status, menubar, location) {
        winprops = 'height=' + h + ',width=' + w + ',top=' + wint + ',left=' + winl + ',toolbar=no,scrollbars=' + scroll + ',status=' + status + ',menubar=' + menubar + 'location=' + location + ',resize=no'
        //window.open(url,popname,"toolbar=no,width=350px;,height=285px;,directories=no,status=no,scrollbars=no,resize=no,menubar=no");//
        win = window.open(mypage, myname, winprops)
        if (parseInt(navigator.appVersion) >= 4) {
            win.window.focus();
        }
    }
</script>

<div class="primaryContents myProfile">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>프로필 관리</h3>
        <div class="location">
            <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>포인트 관리</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <form action="UpdateMyprofile.do" method="post" name="profileForm">
        <div class="contBlock">
            <div class="sectionTop">
                <div class="profile_img">
	                <span class="profile_thumb">
	                
	                <!-- ../resources/images/mypage/img_profile_img_blank_120x120.png -->
	                    <img src="${imagePath}/${dto.mbPic}" alt="등록해주세요." height="120" width="120"/></span>
                    <a href="javascript:popUP('../Comm/PhotoUpload.jsp','UploadProfilePhoto',50,50,200,100,'no','no','no','no','no');" class="replace">Replace</a>
                </div>

                <ul class="i_r">
                    <li>
                        <span class="dt">ID</span>
                        <input name="mbId" type="text" value="${sessionScope.session.mbId}" maxlength="50" readonly="readonly" class="input-text" style="width: 410px;" />
                    </li>
                    <li>
                        <span class="dt">닉네임</span>
                        <input name="mbNickName" value="${dto.mbNickName}" type="text" maxlength="20" class="input-text" style="width: 410px;" />
                    </li>
                </ul>

            </div>
            <dl class="i_r">
                <dt>소개</dt>
                <dd>
                    <textarea name="mbAbout"  rows="2" cols="20" class="textarea" title="소개" placeholder="자신을 어필할 수 있는 공간입니다.
자격증이나 경력사항을 상세히 적어주시면 구매자분께 더 어필할 수 있습니다.
(단, 연락처를 기제하여 직거래를 유도하려고 하는 경우 제제를 당할 수 있습니다.)"
                              style="height:206px;width:710px;width: 100%; height: 198px;">${dto.mbAbout}</textarea></dd>
            </dl>

            <div class="btnArea al_r">
                <a class="btnType12" href='javascript:document.profileForm.submit()' style="float:right ;height: 27px;" ><span>등록</span></a>
                <%--<input type="submit" value=" 전  송 " >--%>
                <!--  <a class="btnType12" href=""><span>저장</span></a> -->
            </div>
        </div>

    </form>
    <!-- //내용 -->

</div>

</body>
</html>