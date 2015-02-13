<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							<div id="ContentPlaceHolder1_WUC_QAChat1_upChat">
								<!-- 텍스트대화 -->
								<c:forEach var="dto" items="${lists }">
									
									<!-- 보낸 메세지 -->
									<c:if test="${dto.sender==mbId}">
									<div class="msg"><font color="#FF0000" style="font-size: 10pt;">보낸 메세지 : ${dto.msgContent }</font> <br/>  [${dto.msgDate }] </div> <br/>
									</c:if>

									<!-- 받은 메세지 -->
									<c:if test="${dto.receiver==mbId}">
									<div class="msg"><font color="#2F9D27"style="font-size: 10pt;">받은 메세지 : ${dto.msgContent }</font> <br/> [${dto.msgDate }] </div> <br/>
									</c:if>
								</c:forEach>
								<!-- //텍스트대화 -->
							</div>
						</div>
						<!-- 전송탭 -->
						<div id="ContentPlaceHolder1_WUC_QAChat1_upChatTool">

							<div id="sendTable" class="tabMenu">
								<div class="tabBtn btn1 on">
									<a href="#writeMsg" onclick="tabMenu(this ,'sendTable'); return false;"><span>글쓰기</span></a>
								</div>
								<div id="writeMsg" class="tabContents writeMsg">
									<textarea name="msg" rows="2" cols="20" class="textarea"
										style="width: 100%; height: 138px;"></textarea>
									<span id="ContentPlaceHolder1_WUC_QAChat1_rfvChatMsg" style="display: none;"></span>
									<div id="ContentPlaceHolder1_WUC_QAChat1_vsChatMsg" style="display: none;"></div>
									<div class="btnArea">
										<span>
										<input type="submit" name="msgSubmit" value="전송하기" class="btnType6"> 
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
		
		<input type="hidden" name="brNum" value="${brNum}" />
	</form>
</body>
</html>