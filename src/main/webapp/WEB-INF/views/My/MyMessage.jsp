<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<div class="primaryContents messageManage">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>메세지 관리</h3>
        <div class="location">
            <span>홈</span> &gt; <span>마이페이지</span> &gt; <span>메세지 관리</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div id="ContentPlaceHolder1_WUC_MyMessage1_divNoData" class="nodata" style="display:none;">
        <p class="nodata_msg">새로운 메세지가 없습니다.</p>
    </div>

    <div id="ContentPlaceHolder1_WUC_MyMessage1_divHasData" class="contBlock" style="display:;">
        <h4>새로운 메세지<span class="newMsg"><span>0</span></span></h4>

        <div class="tblLine lineTop"></div>


        <div class="tblLine"></div>
        
        
    </div>
    <div class="dealList">

                <table cellpadding="0" cellspacing="0" border="0">
                    <colgroup>
                        <col width="100px" />
                        <col width="250px"/>
                        <col width="100px" />
                        <col width="70px" />
                    </colgroup>

                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="th">고양이</div>
                        </th>
                        <th scope="col">
                            <div class="th">메 세 지</div>
                        </th>
                        <th scope="col">
                            <div class="th">강아지</div>
                        </th>
                        <th scope="col">
                            <div class="th">구매날짜</div>
                        </th>
                        
                    </tr>
                    </thead>

					<c:forEach var="dto" items="${lists }" varStatus="seq">
                    <tbody>
                    <tr>
                        <td class="num" align="center">
                            <div class="td">
                                 ${dto.sender }</div>
                        </td>
                        
                        <td class="payResume">
                            <div class="td">
                             
                                <dl class="option">
                                    <dt ><a href="../Chat/QAChat_ok2.action?brNum=${dto.brNum}" style="color: #00a651">보낸 메세지 :  ${dto.msgContent }</a> 
                                    
                                    </dt>
                                </dl>
                               
                            </div>
                        </td>
                        <td class="date">
                             
                                ${dto.receiver }
                               
                        </td>
                         <td class="date">
                              ${dto.msgDate }
                        </td>
                       
                        <!-- step1 ~ step4 -->

                    </tr>
                    </tbody>
                    </c:forEach>
                    
                    <!-- 받는 메세지 -->
                    <c:forEach var="dto" items="${listsRe }" varStatus="seq">
                    <tbody>
                    <tr>
                        <td class="num" align="center">
                            <div class="td">
                                 ${dto.receiver }</div>
                        </td>
                        
                        <td class="payResume">
                            <div class="td">
                                
                                <dl class="option">
                                    <dt><a href="../Chat/QAChat_ok3.action?brNum=${dto.brNum}">받은 메세지 :  ${dto.msgContent } </a>
                                    
                                    </dt>
                                </dl>
                               
                            </div>
                        </td>
                        <td class="date">
                             
                                ${dto.sender }
                               
                        </td>
                         <td class="date">
                              ${dto.msgDate }
                        </td>
                       
                        <!-- step1 ~ step4 -->

                    </tr>
                    </tbody>
                    </c:forEach>

                </table>
                <div class="tblLine2"></div>

                <div class="paging">

                    <b>1 </b>

                </div>
            </div>
    <!-- //내용 -->
    
    
   <h2>${msgDTO.sender }</h2> 
    
    
</div>

</body>
</html>