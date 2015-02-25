<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-11-27
  Time: 오후 6:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator"
           uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Page-Enter" content="BlendTrans(Duration=0.0)" />
    <meta http-equiv="Page-exit" content="BlendTrans(Duration=0.0)" />

    <title></title>

    <link rel="stylesheet" type="text/css" href="../resources/css/ui.css" />

    <script type="text/javascript" src="../resources/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript"
            src="../resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../resources/js/jquery.cycle2.js"></script>
    <script type="text/javascript"
            src="../resources/js/jquery.cycle2.carousel.js"></script>
    <script type="text/javascript" src="../resources/js/ui.js"></script>

    <script src="../resources/js/url.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var str = jQuery.url.segment(2) // jQueryURL.htm 반환.
            //$('#id1').append('<p>' + 'segment 2 : ' + str + '</p>');

            if(str.indexOf("MyTalent")!==-1) {
                $(".mypageSnb ul.personal li.m2 a").css("color","#db1515");
            } else if(str.indexOf("MyProfile")!==-1) {
                $(".mypageSnb ul.personal li.m3 a").css("color","#db1515");
            } else if(str.indexOf("MyAccount")!==-1) {
                $(".mypageSnb ul.personal li.m4 a").css("color","#db1515");
            } else if(str.indexOf("MyMessage")!==-1) {
                $(".mypageSnb ul.personal li.m5 a").css("color","#db1515");
            } else if(str.indexOf("MyFavority")!==-1) {
                $(".mypageSnb ul.personal li.m6 a").css("color","#db1515");
            } else if(str.indexOf("MyPoint")!==-1) {
                $(".mypageSnb ul.personal li.m7 a").css("color","#db1515");
            } else if(str.indexOf("MyOrderMng")!==-1) {
                $(".mypageSnb ul.personal li.m8 a").css("color","#db1515");
            } else if(str.indexOf("SellProdReg")!==-1) {
                $(".mypageSnb ul.sell li.m1 a").css("color","#db1515");
            } else if(str.indexOf("SellProdListMy")!==-1) {
                $(".mypageSnb ul.sell li.m2 a").css("color","#db1515");
            } else if(str.indexOf("SellMng")!==-1) {
                $(".mypageSnb ul.sell li.m3 a").css("color","#db1515");
            } else if(str.indexOf("SellIncome")!==-1) {
                $(".mypageSnb ul.sell li.m4 a").css("color","#db1515");
            }
        });
    </script>

    <style type="text/css">

        .quick-mypage-re .on {
            position: fixed;
            left: 50%;
            top: 20px;
            margin-left: -650px;
        }

        .quick-best ul li a:active {
            background: #ebebeb;
            font-weight: bold;
            color: #ed1b1b;
        }

        .hidden {
            display: none;
        }

        .btnType21 {
            display: inline-block;
            display: inline;
            padding: 5px 15px;
            border: none;
            background: #ed1442;
            font-weight: bold;
            font-size: 15px;
            text-align: center;
            vertical-align: middle;
            color: white; ! important;
            cursor: pointer;
            zoom: 1;
        }
    </style>

    <script type="text/javascript">
        var id = null;

        $(document).ready(function() {
            if (document.getElementById("sessionId").value !== "") {
                id = document.getElementById("sessionId").value;
            }

            $('.utilMenu').addClass('hidden');

            if (id !== null) {
                $('.headerLogin').addClass('hidden');
                $('.utilMenu').removeClass('hidden');
            } else {
                $('.headerLogin').removeClass('hidden');
                $('.utilMenu').addClass('hidden');
            }

        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('.adBannerWrap .adBanner').cycle({
                'fx' : 'turnDown',
                //'carouselVisible' : 1,
                //'carouselFluid' : true,
                'timeout' : 5000,
                'delay' : -2000,
                'slides' : 'li',
                'pager' : '.nav'
            });
        });
    </script>

    <script type="text/javascript">
        function goClose() {
            var button = document.getElementById('btnDisappearNotice');
            button.click();
        }
    </script>

    <script language="javascript">
        function SrcKeydown() {
            if (event.keyCode == 13) { //엔터클릭시
                var button = document.getElementById('lbtnTopSearch');
                button.click();
            }
        }
    </script>

    <script language="javascript">
        function Keydown_Login() {
            if (event.keyCode == 13) { //엔터클릭시
                goLogin();
            }
        }

        // 로그인 후 메일 인증 여부 확인 후 메시지 출력 (2014-10-19 by 강남구)
        function emailAuthChkMsg() {
            // 로그인 체크 전 무조건 강제로 메시지를 안보이게 하고
            // $(".erroremailauth_msg").css("display", "none");
            // 로그인 정보를 입력
            var LoginChk = '';
            var AuthChk = '';
            // 로그인 정보 확인 후
            if (LoginChk.toString() == "True") {
                // 메일 인증이 완료가 안됐을 경우
                if (AuthChk.toString() != "1") {
                    $(".erroremailauth_msg").css("display", "");
                }
            }
        }

        function openLogin() {
            showLayer('loginPop', 'modalpop');
            //return false;
        }

        function goReSendAuthEmail() {
            var button = document.getElementById('lbtnReSendEmailAuth');
            button.click();
        }

        // 로그인 후 메일 인증 재발송 버튼 자바스크립트
        function goReSendAuthEmailAfterLogin() {
            var button = document.getElementById('lbtnReSendEmailAuthAfterLogin');
            button.click();
        }

        function changeForMemberJoin() {
            hideLayer('loginPop');
            showLayer('registerPop', 'modalpop');
        }

        //ID/PW찾기 창 열기
        function changeForMemberFind() {
            hideLayer('loginPop');
            showLayer('registerFindPop', 'modalpop');
        }

        function validateMemberJoin() {
            var f = document.myForm;

            if ($('input:checkbox[id=chk_agree1]').is(':checked') == false) {
                alert("미스터스 이용약관에 동의하세요.");
                return;
            }
            if ($('input:checkbox[id=chk_agree2]').is(':checked') == false) {
                alert("개인정보 보호약관에 동의하세요.");
                return;
            }

            f.submit();
        }

        function callEmailAuthCompleted() {
            showLayer('registerComplete', 'modalpop');
            return false;
        }

        function callSendedAuthEmail() {
            showLayer('joinCertification', 'modalpop');
            return false;
        }
        
    </script>
</head>

<body>


<input id="sessionId" type="hidden" name="sessionId"
       value="${sessionScope.session.mbId}" />


<div id="wrapper">

    <!-- header -->
    <div id="header">

        <!-- 로그인 -->
        <div id="utilArea">
            <div class="centered_cont">

                <!-- 공지 -->
                <div class="nowNotice">
                    <p class="article">
                        <a href="/final/Etc/Notice.action">[공지] 재능 등록하시기 전 필독!</a>
                    </p>
                    <span class="va_m"></span>
                </div>
                <!-- //공지 -->

                <!-- 유틸메뉴 !!로그인 했을시 display!! -->

                <ul class="utilMenu" style="display:;">
                    <li class="newMsg"><a href="../My/MyMessage.action"> <img
                            src="../resources/images/common/ico_newMessage.png" alt="새로운메세지" />
								<span class="new"> <img
                                        src="../resources/images/common/ico_new.png" alt="NEW" />
							</span>
                    </a></li>
                    <li id="newAlram" class="newAlram">
                        <button>
                            <img src="../resources/images/common/ico_myAlram.png"
                                 alt="새로운알람" /> <span class="new"> <img
                                src="../resources/images/common/ico_new.png" alt="NEW" />
								</span>
                        </button>

                        <div class="myNewAlram">
                            <div class="alramWrap">
                                <img
                                        src="../resources/images/common/ico_seller_default_thumb.png"
                                        alt="" /> <span class="alram">[talent]님이 재능접수를 완료했습니다.
										판매자님과 대화를 시작해주세요</span> <span class="alramTime">1분 전</span>
                            </div>
                            <div class="alramWrap">
                                <img
                                        src="../resources/images/common/ico_seller_default_thumb.png"
                                        alt="" /> <span class="alram">[talent]님이 재능접수를 완료했습니다.
										판매자님과 대화를 시작해주세요</span> <span class="alramTime">1분 전</span>
                            </div>
                            <a href="#" class="seeMore">더보기</a> <span class="arr"></span>
                        </div>
                    </li>
                    <li class="myPoint"><span class="point">${sessionScope.session.ptPoint}</span> P</li>
                    <li id="myPageDrop" class="user"><a href="#"> <!--<img src="../../resources/images/common/ico_my_default_thumb.png" alt="" />-->
                        <img src="../resources/images/common/ico_my_default_thumb.png"
                             alt=""> <span></span>
                    </a> <a onclick="return confirm('로그아웃하시겠습니까?');" href="../Goods/logout.action">${sessionScope.session.mbId}</a>
                        <div class="myPageDrop">
                            <span class="arr"></span>
                            <div class="innerWrap">
                                <ul class="list1">
                                    <li><a href="../My/MyTalent.action">나의 탤런트</a></li>
									<li><a href="../My/MyFavority.action">찜 목록</a></li>
                                </ul>
                                <ul class="list2">
                                    <li class="m1"><a href="../My/SellProdReg.action">재능 등록</a></li>
                                    <li class="m2"><a href="../My/SellProdListMy.action">재능
                                        목록</a></li>
                                </ul>
                                <ul class="list3">
                                    <li><a href="../My/MyOrderMng.action">구매 목록</a></li>
                                    <li><a href="../My/SellMng.action">판매 목록</a></li>
                                </ul>
                            </div>
                        </div></li>
                </ul>

                <!-- 유틸메뉴 -->

                <!-- 유틸메뉴 로그아웃 -->

                <div class="headerLogin" style="display:;">
						<span class="login" style="float: right;"><a
                                href="javascript:openLogin();">로그인</a></span> <span class="register"><a
                        href="#" style="display: none;"
                        onclick="showLayer('registerPop','modalpop'); return false;">회원가입</a></span>
                </div>

                <!-- 유틸메뉴 로그아웃-->

            </div>
        </div>
        <!-- //로그인 -->
        <form action="" method="post" name="searchForm">
            <!-- 검색 -->
            <div id="search">
                <div class="centered_cont">
                    <h1>
                        <a href="../"> <img
                                src="../resources/images/common/h1_logo.png"
                                alt="세상 모든 재능의 시작 TALENT" />
                        </a>
                    </h1>
                    <div class="searchWindow">

                        <input name="searchValue" type="text" maxlength="10" title="TopSearch"

                               class="mainSearch" onkeydown="javascript:SrcKeydown();" />
                        <a id="lbtnTopSearch" class="btnSearch" alt="검색" onclick="searchSubject();" href="#"/> <img
                            src="../resources/images/common/btn_main_search.png" alt="검색">
                        </a>
                        <ul class="searchKeyword">
                            <li><a
                                    href='../Goods/GList_ok.action?cgNum=3'>만화</a></li>
                            <li><a
                                    href='../Goods/GList_ok.action?cgNum=61'>마술공연</a></li>
                            <li><a href='../Goods/GList_ok.action?cgNum=45'>번역</a></li>
                            <li><a href='../Goods/GList_ok.action?cgNum=16'>마케팅</a></li>
                            <li><a
                                    href='../Goods/GList_ok.action?cgNum=71'>연애상담</a></li>
                        </ul>
                    </div>
                    <div class="adBannerWrap">
                        <div class="nav"></div>
                        <ul class="adBanner">
                            <li><a
                                    href='GDetail.action?brNum=39'>
                                <img src='../Upload/TopBanner/ADTB20141217023314247.png'
                                     width="230px" height="75px" alt="" />
                            </a></li>
                            <li><a
                                    href='GDetail.action?brNum=40'>
                                <img src='../Upload/TopBanner/ADTB20150118025956414.png'
                                     width="230px" height="75px" alt="" />
                            </a></li>
                            <li><a
                                    href='GDetail.action?brNum=38'>
                                <img src='../Upload/TopBanner/ADTB20150118025822392.png'
                                     width="230px" height="75px" alt="" />
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //검색 -->
        </form>
        <!-- gnb -->
        <div id="gnb">
            <ul class="centered_cont">
                <li class="m1"><a href="../Goods/GList.action?start=1&end=14&range=0">그래픽 · 디자인</a></li>
                <li class="m2"><a href="../Goods/GList.action?start=15&end=22&range=0">사업 · 전문가</a></li>
                <li class="m3"><a href="../Goods/GList.action?start=23&end=30&range=0">문서 · 레포트</a></li>
                <li class="m4"><a href="../Goods/GList.action?start=31&end=41&range=0">컴퓨터 · IT</a></li>
                <li class="m5"><a href="../Goods/GList.action?start=42&end=50&range=0">번역 · 외국어</a></li>
                <li class="m6"><a href="../Goods/GList.action?start=51&end=58&range=0">음악 · 동영상</a></li>
                <li class="m7"><a href="../Goods/GList.action?start=59&end=68&range=0">행사 · 공연</a></li>
                <li class="m8"><a href="../Goods/GList.action?start=69&end=79&range=0">노하우 · 상담</a></li>
                <li class="m9"><a href="../Goods/GList.action?start=80&end=90&range=0">생활서비스</a></li>
                <li class="m10"><a href="../Goods/GList.action?start=91&end=96&range=0">여행 · 가이드</a></li>
                <li class="m11"><a href="../Goods/GList.action?start=97&end=109&range=0">핸드메이드</a></li>
                <li class="m12"><a href="javascript:alert('서비스 준비중 입니다');">프리미엄 재능관</a></li>
            </ul>
        </div>
        <!-- //gnb -->

    </div>
    <!-- //header -->

    <!-- container -->
    <div id="container">

        <!-- contents -->
        <div id="contents">
            <div class="mypage">

                <!-- 마이페이지snb -->
                <div id="mypageSnb" class="mypageSnb">
                    <h2>개인 <span>Personal</span></h2>
                    <ul class="personal">
                        <li class="m2"><a href="../My/MyTalent.action"><span>나의 탤런트</span></a></li>
                        <li class="m3"><a href="../My/MyProfile.action"><span>프로필 관리</span></a></li>
                        <li class="m4"><a href="../My/MyAccount.action"><span>계정 관리</span></a></li>
                        <li class="m5"><a href="../My/MyMessage.action"><span>메세지 관리</span></a></li>
                        <li class="m6"><a href="../My/MyFavority.action"><span>찜목록</span></a></li>
                        <li class="m7"><a href="../My/MyPoint.action"><span>포인트</span></a></li>
                        <li class="m8"><a href="../My/MyOrderMng.action"><span>구매 관리</span></a></li>
                    </ul>

                    <h2>판매 <span>Sell</span></h2>
                    <ul class="sell">
                        <li class="m1"><a href="../My/SellProdReg.action"><span>재능 등록</span></a></li>
                        <li class="m2"><a href="../My/SellProdListMy.action"><span>내 재능 목록</span></a></li>
                        <li class="m3"><a href="../My/SellMng.action"><span>판매 관리</span></a></li>
                        <li class="m4"><a href="../My/SellIncome.action"><span>수익 관리</span></a></li>
                    </ul>
                </div>
                <!-- //마이페이지snb -->

                <!-- 마이페이지컨텐츠 시작 -->
                <decorator:body />
                <!-- //마이페이지컨텐츠 시작 -->

            </div>
        </div>
        <!-- //contents -->

    </div>
    <!-- //container -->

    <!-- footer -->
    <div id="footer">
        <div class="centered_cont">
            <ul class="footerUtil">
                <li class="first"><a href="/final/Etc/LawService.action">서비스 이용약관</a></li>
                <li><a href="/final/Etc/LawPersonal.action">개인정보 취급방침</a></li>
                <li><a href="/final/Etc/Suggest.action">제안하기</a></li>
                <li><a href="/final/Etc/Notice.action">고객센터</a></li>
                <li><a href="/final/Etc/LawGoodsReg.action">재능등록심사규정</a></li>
                <li><a href="/final/Etc/ADPayment.action">재능광고신청</a></li>
            </ul>
            <div class="company_info">
                <img src="../resources/images/common/footer.gif" style="margin-left: 36px" alt="" />
            </div>
        </div>
    </div>
    <!-- //footer -->

    <!-- 로그인팝업 -->
    <form action="../Login/Login.action" method="post" name="loginForm">
        <div id="loginPop" class="layerPopup">
            <h4 class="popTitle">로그인</h4>
            <div class="layerPopBody">
                <div class="loginSet">
                    <label class="label">이메일 아이디</label> <input name="mbId" id="mbIdEmail"
                                                                type="text" maxlength="50" class="input-text"
                                                                onkeydown="javascript:Keydown_Login();" title="이메일 아이디"
                                                                placeholder="이메일 아이디" />
                </div>
                <div class="loginSet">
                    <label class="label">비밀번호</label> <input name="mbPw"
                                                             type="password" maxlength="20" class="input-text"
                                                             onkeydown="javascript:Keydown_Login();" title="비밀번호"
                                                             placeholder="비밀번호" />
                </div>
                <div class="loginOption">
                    <div class="saveId">
                        <span class="input-check"><input type="checkbox" name="" /></span>
                        <label class="label">아이디 저장</label>
                    </div>
                    <div class="findId">
                        <a href="javascript:changeForMemberFind();"><span>아이디
									/ 비밀번호 찾기</span></a>
                    </div>
                </div>
                <p class="btnLogin">
                    <a href="javascript:goLogin();">로그인</a>
                </p>
                <div class="memberJoin">
                    <span>아직 회원이 아니십니까?</span> <a
                        href="javascript:changeForMemberJoin();">회원으로 가입하기</a>
                </div>
            </div>
            <div class="popClose">
                <a href="#" onclick="hideLayer('loginPop'); return false;"> <img
                        src="../resources/images/common/btn_popup_close.png" alt="닫기" />
                </a>
            </div>
        </div>
        <input name="currentURL" id="currentURL" type="hidden" value="" />
    </form>
    <!-- //로그인팝업 -->

    <!-- 회원가입팝업 -->
    <form method="post" action="../Register/Register.action" name="myForm">
        <div id="registerPop" class="layerPopup">
            <h4 class="popTitle">회원가입</h4>
            <div class="layerPopBody">
                <div class="loginSet">
                    <label class="label">이메일 아이디</label> <input name="mbId"
                                                                type="text" maxlength="50" class="input-text" title="이메일 아이디"
                                                                placeholder="이메일 아이디" style="width: 221px;" />
                </div>
                <div class="loginSet">
                    <label class="label">비밀번호 설정</label> <input name="mbPw1"
                                                                type="password" maxlength="20" class="input-text" title="비밀번호"
                                                                placeholder="비밀번호" />
                </div>
                <div class="loginSet">
                    <label class="label">비밀번호 확인</label> <input name="mbPw2"
                                                                type="password" maxlength="20" class="input-text" title="비밀번호"
                                                                placeholder="비밀번호" />
                </div>
                <div class="agreeChk">
						<span class="input-check"><input id="chk_agree1"
                                                         type="checkbox" name="" /></span> <label class="label mgr30">탤런트 이용약관 동의</label> <span class="input-check"><input id="chk_agree2"
                                                                     type="checkbox" name="" /></span> <label class="label">개인정보
                    보호약관 동의</label>
                </div>
                <div class="memberJoin">
                    <a onclick="validateMemberJoin();" class="memberJoin">회원으로
                        가입하기</a>
                </div>
            </div>
            <div class="popClose">
                <a href="#" onclick="hideLayer('registerPop'); return false;">
                    <img src="../resources/images/common/btn_popup_close.png" alt="닫기" />
                </a>
            </div>
        </div>
    </form>
    <!-- //회원가입팝업 -->

    <!-- 회원가입인증팝업 -->
    <div id="joinCertification" class="layerPopup">
        <h4 class="popTitle">회원가입</h4>
        <div class="layerPopBody">
            <p class="p">
                인증 메일이 발송되었습니다.<br /> 메일 인증을 하시면 가입이 완료됩니다.
            </p>
            <div class="memberJoin">
                <span>메일을 받으시지 못하셨나요?</span> <a
                    href="javascript:goReSendAuthEmail();">재발송</a>
            </div>
        </div>
        <div class="popClose">
            <a href="#" onclick="hideLayer('joinCertification'); return false;">
                <img src="../resources/images/common/btn_popup_close.png" alt="닫기" />
            </a>
        </div>
    </div>
    <!-- //회원가입인증팝업 -->

    <!-- 회원가입완료 -->
    <div id="registerComplete" class="layerPopup">
        <!-- style="display:block;"-->
        <h4 class="popTitle">회원가입</h4>
        <div class="layerPopBody">
            <p class="p">
                회원가입이 완료되었습니다.<br /> 지금 바로 미스터스에 재능을 등록하여<br /> 내 재능을 판매해 보세요
            </p>
            <div class="registerTalent">
                <a href="../My/SellProdReg.action">내 재능 등록하기</a>
            </div>
        </div>
        <div class="popClose">
            <a href="#" onclick="hideLayer('registerComplete'); return false;">
                <img src="../resources/images/common/btn_popup_close.png" alt="닫기" />
            </a>
        </div>
    </div>
    <!-- //회원가입완료 -->

    <!-- 회원ID/PW팝업 -->
    <div id="registerFindPop" class="layerPopup">
        <h4 class="popTitle">아이디 / 비밀번호 찾기</h4>
        <div class="layerPopBody">
            <div class="loginSet">
                <label class="label">이메일 아이디</label> <input name="" type="text"
                                                            maxlength="50" class="input-text" title="이메일 아이디"
                                                            placeholder="이메일 아이디" style="width: 221px;" />
            </div>
            <div class="memberJoin">
                <a class="memberFind" href="">이메일 발송</a>
            </div>

        </div>
        <div class="popClose">
            <a href="#" onclick="hideLayer('registerFindPop'); return false;">
                <img src="../resources/images/common/btn_popup_close.png" alt="닫기" />
            </a>
        </div>
    </div>
    <!-- //회원ID/PW팝업 -->

    <div style="display: none;">
        <input type="submit" name="" value="" id="lbtnReSendEmailAuth" /> <input
            type="submit" name="" value="" id="lbtnReSendEmailAuthAfterLogin" />
    </div>

</div>

</body>
</html>



