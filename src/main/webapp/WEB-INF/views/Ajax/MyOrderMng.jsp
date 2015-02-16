<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="dto" items="${lists }" varStatus="seq">
    <tr>
        <td class="num">
            <div class="td">
                ${dto.listNum}</div>
        </td>
        <td class="thumbnail">
            <div class="td"><a href="../Goods/GDetail.action?brNum=${dto.brNum }">
                <img src="../Product/${dto.brMainPhoto}" alt=""   Height=160px  Width=160px /></a></div>
        </td>
        <td class="payResume">
            <div class="td">
                ${dto.brSubject }
                <dl class="option">
                    <dt>옵션내역 : ${dto.hsOptions }</dt>
                    <dd>
                    </dd>
                </dl>
                                            <span class="price"><span class="count">
                                                ${dto.hsPrice }</span> 원</span>
                <p class="dialogue mine">
                </p>
            </div>
        </td>
        <td class="date">
            <div class="td">
                                            <span class="payDate">
                                                ${dto.hsDate }/</span>
                                            <span class="finishDate">
                                                </span>
                []




            </div>
        </td>
        <c:if test="${dto.progress==0}">
            <td style="cursor: pointer;" align="center" class="process step9" >
                <img src="../resources/images/mypage/ing.png"/><div class="td">
                진행중 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
                <img src="../resources/images/mypage/cancel.png"
                     onclick="if(confirm('구매취소하시겠습니까?')===true){location.href='../My/BuyCancel.action?hsNum=${dto.hsNum}'};" /><div class="td">
                취소
            </div>
            </td>
        </c:if>

        <c:if test="${dto.progress==1}">
            <td style="cursor: pointer;" align="center" class="process step9" >
                <img src="../resources/images/mypage/check.png"
                     onclick="if(confirm('구매확정하시겠습니까?(구매확정시 반품불가)')===true){location.href='../My/BuyComplete.action?hsNum=${dto.hsNum}';}"/><div class="td">
                구매확정 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
                <img src="../resources/images/mypage/cancel.png"
                     onclick="if(confirm('반품하시겠습니까?')===true){location.href='../My/BuyCancel.action?hsNum=${dto.hsNum}'};"/><div class="td">
                반품
            </div>
            </td>
        </c:if>

        <c:if test="${dto.progress==2}">
            <td style="cursor: pointer;" align="center" class="process step9" >
                <img src="../resources/images/mypage/ico_correct.png"/>
                <div class="td">완료</div>
            </td>
        </c:if>

        <c:if test="${dto.progress==3}">
            <td style="cursor: pointer;" align="center" class="process step9" >
                <img src="../resources/images/mypage/cancel.png"/>
                <div class="td">취소</div>
            </td>
        </c:if>

        <!-- step1 ~ step4 -->

    </tr>
</c:forEach>
