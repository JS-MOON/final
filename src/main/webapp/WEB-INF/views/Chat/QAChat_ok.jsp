<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%

%>
</head>
<body>
<form action="./QAChat_ok.action" method="post">
<div id="container">
                <!-- contents -->
                
    
<div id="contents">
    <!-- location -->
    
	<div id="location">
        <span>홈</span>
	</div>
    <!-- //location -->

    <div class="productDialoge">
        <div class="dialogeWrap">
            <h2 class="secTit">대화하기</h2>
            <div class="orderDialoge">
            <c:forEach var="dto" items="${msgAllDTO }">
                <div class="msg">
                        <!-- 텍스트대화 -->
                      <%--   ${msgDTO.msgContent } --%>
                        <!-- //텍스트대화 -->
                        
                        
                        ${dto.msgContent }
                        
                   </div>
                   </c:forEach>
                   
                   <!-- 받은메세지 -->
                   <c:forEach var="dto" items="${msgReceiver }">
                <div class="msg">
                        <!-- 텍스트대화 -->
                      <%--   ${msgDTO.msgContent } --%>
                        <!-- //텍스트대화 -->
                        
                        
                        ${dto.msgContent }
                        
                   </div>
                   </c:forEach>
            </div>
            <!-- 전송탭 -->
            <div id="ContentPlaceHolder1_WUC_QAChat1_upChatTool">
	
                    <div id="sendTable" class="tabMenu">
                        <div class="tabBtn btn1 on"><a href="#writeMsg" onclick="tabMenu(this , 'sendTable'); return false;"><span>글쓰기</span></a></div>
                        <div id="writeMsg" class="tabContents writeMsg">
                            <textarea name="msg" rows="2" cols="20" id="ContentPlaceHolder1_WUC_QAChat1_txtChatMsg" class="textarea" style="width: 100%; height: 138px;"></textarea>
                            <span id="ContentPlaceHolder1_WUC_QAChat1_rfvChatMsg" style="display:none;"></span>
                            <div id="ContentPlaceHolder1_WUC_QAChat1_vsChatMsg" style="display:none;">

	</div>
                            <div class="btnArea">
                                 <span><input type="submit" name="msgSubmit" value="전송하기" class="btnType6">
                                </span>
                            </div>
                        </div>
                    </div>
</div>
            <!-- 전송탭 -->
        </div>
    </div>
</div>

                <!-- //contents -->
            </div>
            <div>
            
           
            </div>
            <input type="hidden" name="brNum" value="${brNum}"/>
</form>
</body>
</html>