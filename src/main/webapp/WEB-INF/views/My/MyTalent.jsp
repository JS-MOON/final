<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<div class="primaryContents mypageMain">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>나의 TALENT</h3>
        <div class="location">
            <span>홈</span> &gt; <span>개인 Personal</span> &gt; <span>나의 TALENT</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div class="contBlock">
        <h4 class="itemTitle">나의 상태</h4>
        <div class="conditionResume totalResume">
            <ul>
                <li class="item1">
                    <div class="innerWrap">
                        <span class="dt">판매 수익금</span>
                        <span class="dd">
                            0원</span>
                    </div>
                </li>
                <li class="item2">
                    <div class="innerWrap">
                        <span class="dt">보유포인트</span>
                        <span class="dd">
                            ${sessionScope.session.ptPoint}
                            P</span>
                    </div>
                </li>
                <li class="item3">
                    <div class="innerWrap">
                        <span class="dt">본인인증</span>
                        <span class="dd"></span>
                    </div>
                </li>
                <li class="item4 correct">
                    <div class="innerWrap">
                        <span class="dt">계좌번호</span>
                        <span class="dd"><span>예금주:</span>
                            
                            <strong class="bankAccount">
                                /</strong></span>
                    </div>
                </li>
            </ul>
        </div>

        <h4 class="itemTitle">구매 관리</h4>
        <div class="conditionResume payManage">
            <div class="resumeTable">
                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="25%" />
                        <col width="25%" />
                        <col width="25%" />
                        <col width="25%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">진행중</th>
                        <th scope="col">전달 / 배송중</th>
                        <th scope="col">완료</th>
                        <th scope="col" class="cancel">취소</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="on">
                            ${buyOnGoing}</td>
                        <td>
                            ${buyChecked}</td>
                        <td>
                            ${buyCompleted}</td>
                        <td>
                            ${buyCanceled}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <h4 class="itemTitle">판매 관리</h4>
        <div class="conditionResume sellManage">
            <div class="resumeTable">
                <table cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="25%" />
                        <col width="25%" />
                        <col width="25%" />
                        <col width="25%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">진행중</th>
                        <th scope="col">전달 / 배송중</th>
                        <th scope="col">완료</th>
                        <th scope="col" class="cancel">취소</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="on">
                            ${sellOnGoing}</td>
                        <td>
                            ${sellChecked}</td>
                        <td>
                            ${sellCompleted}</td>
                        <td>
                            ${sellCanceled}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- //내용 -->
</div>

</body>
</html>