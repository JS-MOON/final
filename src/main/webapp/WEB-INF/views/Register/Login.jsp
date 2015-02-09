<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JS_Laptop
  Date: 2015-01-29
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>

<body>
<c:if test="${error == 'true'}">
  <script>
    jQuery(function() {
      var move = '70px';
      jQuery('#message').animate({
        top : '+=' + move
      }, 'slow', function() {
        jQuery('#message').delay(1000).animate({ top : '-=' + move }, 'slow');
      });
    });
  </script>
</c:if>


<div id="contents">

  <style type="text/css">
    .btnFaceBook {
      margin-left: 100px;
    }

    .btnJoin {
      margin-left: 20px;
    }

    .chkBox input, select {
      margin-bottom: 2px;
      margin-right: 5px;
    }
  </style>

  <form action="../j_spring_security_check" method="post" name="loginForm2">
    <div style="text-align: center; align-content: center;">


      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
        <tr>
          <td align="center">



            <table width="901" height="500" border="0" cellpadding="0" cellspacing="0" style="width: 901px; background-position: center top; background-color: #ffffff; background-repeat: no-repeat;">
              <tbody>
              <tr>
                <td rowspan="9" style="width: 127px; height: 169px;"></td>
                <td colspan="3" style="width: 645px; height: 59px;"></td>
                <td rowspan="9" style="width: 129px; height: 169px;"></td>
              </tr>
              <tr>
                <td colspan="3" style="width: 645px; height: 70px;"></td>
              </tr>
              <tr>
                <td style="font-size: 18px; font-weight: bold; color: #333333; font-family: 'ng', 'NanumGothic', '나눔 고딕', dotum, '돋움', gulim, '굴림', Georgia, helvetica, sans-serif, Arial, verdana;">이메일 아이디</td>
                <td style="width: 380px; height: 55px">
                  <input type="text" maxlength="50" name="mbId" placeholder="이메일 아이디" style="color: rgb(126, 126, 126); font-size: 15px; height: 38px; width: 93%; text-align: left; vertical-align: middle; padding-left: 5px; border: 1px solid rgb(221, 107, 107); cursor: auto; background-attachment: scroll; background-color: rgb(225, 225, 225); background-position: 100% 50%; background-repeat: no-repeat;" autocomplete="off"></td>



                <td style="width: 100px;" rowspan="2">
                  <input type="image" src="../resources/images/common/login1229.jpg" onclick="javascript:goLogin2()">
                </td>
              </tr>
              <tr style="height: 60px">
                <td style="font-size: 18px; font-weight: bold; color: #333333; font-family: 'ng', 'NanumGothic', '나눔 고딕', dotum, '돋움', gulim, '굴림', Georgia, helvetica, sans-serif, Arial, verdana; height: 54px;">비밀번호 입력</td>
                <td style="width: 380px; height: 55px">
                  <input type="password" name="mbPw" onkeydown="" placeholder="비밀번호" style="color: rgb(126, 126, 126); font-size: 15px; height: 37px; width: 93%; text-align: left; vertical-align: middle; padding-left: 5px; border: 1px solid rgb(221, 107, 107); cursor: auto; background-attachment: scroll; background-color: rgb(225, 225, 225); background-position: 100% 50%; background-repeat: no-repeat;" autocomplete="off">
                </td>
              </tr>
              <tr>
                <td style="width: 120px; height: 40px;"></td>
                <td style="width: 400px; height: 40px" colspan="2">
                  <span>
                            <span class="chkBox" style="border-color:#EC8484;">
                              <input id="chk_save" type="checkbox" ></span>
                            <label class="label" id="lbCheck" style="color: #222; font-size: 14px; font-weight: bold; cursor:pointer;">아이디 저장</label>
                            <a href="javascript:changeForMemberFind();" style="float: right; padding-right: 155px;">
                              <span style="color: #222; font-size: 14px; font-weight: bold;">비밀번호 찾기</span>
                            </a>
                        </span>
                </td>
              </tr>
              <tr>
                <td colspan="3" style="width: 645px; height: 25px; border-bottom: solid 1px #d44848;"></td>
              </tr>

              <tr>
                <td colspan="3" style="width: 645px; height: 50px;text-align: center">

                  <div class="memberJoin">
                    <span>아직 회원이 아니십니까?</span> <a href="javascript:changeForMemberJoin();" style="text-decoration:underline;font-size:13px;color:red">회원으로 가입하기</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="3" style="width: 645px; height: 70px;"></td>
              </tr>
              </tbody></table>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </form>

</div>


</body>
</html>
