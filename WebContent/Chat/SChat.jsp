<%--
  Created by IntelliJ IDEA.
  User: JS
  Date: 2014-12-01
  Time: 오후 12:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>
</head>
<body>
<div id="container">
    <!-- contents -->


    <script language="javascript">
        function sendChatMsg() {
            var button = document.getElementById('lbtnChatMsgSend');
            button.click();
        }

        function goInquireOrderAcceptOfSeller(OCode) {
            alert(OCode);
            var button = document.getElementById('lbtnInquireOrderAcceptOfSeller');
            var args = document.getElementById('hfArguments');
            args.value = OCode;
            alert(args.value);
            button.click();
        }

        function goInquireOrderRefuseOfSeller(OCode) {
            alert(OCode);
            var button = document.getElementById('lbtnInquireOrderRefuseOfSeller');
            button.click();
        }
    </script>
    <div>
        <a id="lbtnInquireOrderAcceptOfSeller" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_SChat1$lbtnInquireOrderAcceptOfSeller&#39;,&#39;&#39;)"></a>
        <a id="lbtnInquireOrderRefuseOfSeller" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_SChat1$lbtnInquireOrderRefuseOfSeller&#39;,&#39;&#39;)"></a>
        <input type="hidden" name="ctl00$ContentPlaceHolder1$WUC_SChat1$hfArguments" id="hfArguments" />
    </div>
    <div id="contents">
        <!-- location -->

        <div id="location">
            <span>홈</span>
        </div>
        <!-- //location -->

        <div class="productDialoge">
            <div class="infoWrap">
                <h2 class="secTit">재능구매정보</h2>
                <div class="purchaceWrap">
                    <div class="orderNumWrap">
                        <img src="../resources/images/temp/barcode.gif" alt="" />
                        <span class="orderNum">주문번호<span>110815</span></span>
                    </div>
                    <div class="purchace_info">
                        <h3 class="infoTit">재능 타이틀</h3>
                        <p class="info tit">지루한 타이핑 작업 대신 해드리죠</p>
                        <h3 class="infoTit">판매자 정보</h3>
                        <p class="info userID">ckghr**<br/><span class="accessCondition on">ONLINE</span></p><!-- offline일때 클래스 off -->
                        <h3 class="infoTit">완료 예정일</h3>
                        <p class="info completeDate">2014. 12. 02 (1일)</p>
                        <h3 class="infoTit">결제 금액 (옵션 포함)</h3>
                        <p class="info amount">5,000 원</p>
                    </div>
                </div>

                <h2 class="secTit">옵션선택사항</h2>
                <div class="myOption">
                    <ol>
                        <li>
                            <span class="num">1 - </span>시안 10개 추가해 드립니다.
                            <span class="addition">+ 10,000 원 + 1일</span>
                        </li>
                        <li>
                            <span class="num">2 - </span>시안 10개 추가해 드립니다.
                            <span class="addition">+ 10,000 원 + 1일</span>
                        </li>
                        <li>
                            <span class="num">3 - </span>시안 10개 추가해 드립니다.
                            <span class="addition">+ 10,000 원 + 1일</span>
                        </li>
                    </ol>
                </div>

                <div class="indicator step1">
                    <div class="condition"><span>1단계</span>대화 진행중</div>
                    <p class="description">재능 거래가 이루어지고 있습니다.<br />
                        상호간의 대화 및 파일 업로드를 통해<br />
                        편리하게 재능을 주고 받을 수 있습니다.</p>
                </div>
            </div>

            <div class="dialogeWrap">
                <h2 class="secTit">대화하기 (판매자ver)</h2>
                <div class="orderDialoge">
                    <div id="ContentPlaceHolder1_WUC_SChat1_upChat">

                        <span id="ContentPlaceHolder1_WUC_SChat1_Timer1" style="visibility:hidden;display:none;"></span>
                        <span id="ContentPlaceHolder1_WUC_SChat1_Label1">Label</span>

                        <!-- 접수 -->
                        <div class="msgBlock msg_order" style="display:none">
                            <p class="msg_tit">주문 요청이 접수되었습니다. [구매자]님이 작업 요청서를 작성했습니다.</p>
                            <p class="msg_desc">주문을 접수하지 않을 채 10분이 경과되면, 구매자가 주문 요청을 취소할 수 있습니다. 접수하시겠습니까?</p>
                            <table cellpadding="0" cellspacing="0">
                                <colgroup>
                                    <col width="15%" /><col /><col width="15%" /><col /><col width="15%" /><col />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th><div class="th">상호명</div></th>
                                    <td><div class="td">미스터스</div></td>
                                    <th><div class="th">한글 이름</div></th>
                                    <td><div class="td">미스터스</div></td>
                                    <th><div class="th">영문 이름</div></th>
                                    <td><div class="td">미스터스</div></td>
                                </tr>
                                <tr>
                                    <th><div class="th">주소</div></th>
                                    <td colspan="3"><div class="td">미스터스</div></td>
                                    <th><div class="th">이메일</div></th>
                                    <td><div class="td">미스터스</div></td>
                                </tr>
                                <tr>
                                    <th><div class="th">전화번호</div></th>
                                    <td><div class="td">미스터스</div></td>
                                    <th><div class="th">휴대폰번호</div></th>
                                    <td><div class="td">미스터스</div></td>
                                    <th><div class="th">팩스번호</div></th>
                                    <td><div class="td">미스터스</div></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="btnArea">
                                <a href="#" class="btnType4"><span>접수하기</span></a>
                                <a href="#" class="btnType5"><span>접수취소</span></a>
                            </div>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //접수 -->

                        <!-- 주문취소 -->
                        <div class="msgBlock orderCancel" style="display:none">
                            <p class="msg_tit">[구매자]님이 주문 취소를 요청했습니다.</p>
                            <p class="msg_desc">24시간내 거절하지 않을 시 자동으로 주문이 취소됩니다.</p>
                            <div class="causeBy">
                                <span class="t">사유 |</span>
                                <p class="p">스타일이 맞지 않음</p>
                            </div>
                            <p class="deadline"><span>24 : 59 : 20</span></p>
                            <div class="btnArea">
                                <a href="#" class="btnType9"><span>수락하기</span></a>
                                <a href="#" class="btnType9"><span>거절하기</span></a>
                            </div>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //주문취소 -->

                        <!-- 주문취소완료 -->
                        <div class="msgBlock orderCancelComplete" style="display:none">
                            <p class="msg_tit">주문 취소가 수락되었습니다.</p>
                            <p class="msg_desc">재능 거래가 종료되었습니다.</p>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //주문취소완료 -->

                        <!-- 첨부파일업로드 -->
                        <div class="msgBlock attachedFile" style="display:none">
                            <p class="msg_tit">[ 구매자 ]님이 첨부파일을 업로드 했습니다.</p>
                            <div class="files"><span><a href="#">로고디자인 1차 시안.jpg</a></span></div>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //첨부파일업로드 -->

                        <!-- 추가결제 -->
                        <div class="msgBlock addPay" style="display:none">
                            <p class="msg_tit">[구매자]님이 추가결제를 했습니다.</p>
                            <div class="payment"><span>5,500 원</span></div>
                            <div class="causeBy">
                                <span class="t">사유 |</span>
                                <p class="p">옵션 추가 구매</p>
                            </div>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //추가결제 -->

                        <!-- 재능전달 -->
                        <div class="msgBlock pdtSend" style="display:none">
                            <p class="msg_tit">[구매자]님께 재능을 전달 완료했습니다.</p>
                            <div class="pdt"><span><a href="#">캘리그라피 로고_카페 샵_영문 원본.ai</a></span></div>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //재능전달 -->

                        <!-- 재능전달(택배) -->
                        <div class="msgBlock pdtSend shippingType" style="display:none">
                            <p class="msg_tit">[구매자]님께 재능을 전달 완료했습니다.</p>
                            <div class="pdt"><span>대한통운 <a href="#">111-11111111-11111</a></span></div>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //재능전달(택배) -->

                        <!-- 거래완료 -->
                        <div class="msgBlock dealComplete" style="display:none">
                            <p class="msg_tit">재능 거래가 완료되었습니다.</p>
                            <p class="msg_desc">구매자가 주문을 확정하면 바로 수익금이 지급됩니다.<br />
                                구매자가 완료를 하지 않더라고, 7일 후에 자동적으로 주문이 완료됩니다.</p>
                            <p class="msg_time">6. 18.  12:30:15</p>
                        </div>
                        <!-- //거래완료 -->

                        <!-- 텍스트대화 -->

                        <!-- //텍스트대화 -->

                    </div>
                </div>
                <!-- 전송탭 -->
                <div id="ContentPlaceHolder1_WUC_SChat1_upChatTool">

                    <div id="sendTable" class="tabMenu">
                        <div class="tabBtn btn1 on"><a href="#writeMsg" onclick="tabMenu(this , 'sendTable'); return false;"><span>글쓰기</span></a></div>
                        <div id="writeMsg" class="tabContents writeMsg">
                            <textarea name="ctl00$ContentPlaceHolder1$WUC_SChat1$txtChatMsg" rows="2" cols="20" id="ContentPlaceHolder1_WUC_SChat1_txtChatMsg" class="textarea" style="width:100%; height:138px;">
                            </textarea>
                            <span id="ContentPlaceHolder1_WUC_SChat1_rfvChatMsg" style="display:none;"></span>
                            <div id="ContentPlaceHolder1_WUC_SChat1_vsChatMsg" style="display:none;">

                            </div>
                            <div class="btnArea">
                                <a href="#" class="btnHelp">도움말 보기</a>
                                <a id="ContentPlaceHolder1_WUC_SChat1_lbtnChatMsgSend" class="btnType6" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$WUC_SChat1$lbtnChatMsgSend&quot;, &quot;&quot;, true, &quot;ChatMsg&quot;, &quot;&quot;, false, true))"><span>전송하기</span></a>
                            </div>
                        </div>

                        <div class="tabBtn btn2"><a href="#fileAttach" onclick="tabMenu(this , 'sendTable'); return false;"><span>파일첨부</span></a></div>
                        <div id="fileAttach" class="tabContents fileAttach">
                            <div class="fileWrap"><input type="file" class="input-file" style="width:430px;" /></div>
                            <div class="btnArea">
                                <a href="#" class="btnHelp">도움말 보기</a>
                                <a href="#" class="btnType6"><span>전송하기</span></a>
                            </div>
                        </div>

                        <div class="tabBtn btn3"><a href="#addPayment" onclick="tabMenu(this , 'sendTable'); return false;"><span>추가결제</span></a></div>
                        <div id="addPayment" class="tabContents addPayment">
                            <p class="desc">추가결제사항은 판매자와 충분히 상담을 하신 후 추가 진행하시길 바랍니다.</p>
                            <div class="paymentOption">
                                <div class="optionWrap option1">
                                    <span class="t">추가 결제</span>
                                    <div class="inputWrap"><span class="num1">5</span><span class="unit">,000 원</span></div>
                                    <p class="optionDesc">VAT 10%별도</p>
                                </div>
                                <div class="optionWrap option2">
                                    <span class="t">결제 사유</span>
                                    <div class="inputWrap">
                                        <select name="" class="select" style="width:100%">
                                            <option>옵션 추가 구매</option>
                                            <option>옵션 추가 구매</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="optionWrap option3">
                                    <span class="t">결제 사유</span>
                                    <div class="inputWrap">
                                        <select name="" class="select" style="width:100%">
                                            <option>신용카드</option>
                                            <option>신용카드</option>
                                        </select>
                                    </div>
                                    <p class="optionDesc">계좌이체 / 무통장입금 / 휴대폰 / Paypal 해외결제</p>
                                </div>
                            </div>
                            <div class="btnArea">
                                <a href="#" class="btnHelp">도움말 보기</a>
                                <a href="#" class="btnType6"><span>전송하기</span></a>
                            </div>
                        </div>

                        <div class="tabBtn btn4"><a href="#cancelRequest" onclick="tabMenu(this , 'sendTable'); return false;"><span>취소요청</span></a></div>
                        <div id="cancelRequest" class="tabContents cancelRequest">
                            <p class="desc">주문에 문제가 발생한 경우, 주문을 취소할 수 있습니다.</p>
                            <span class="t">결제 사유</span>
                            <div class="inputWrap">
                                <select name="" class="select" style="width:100%">
                                    <option>판매자 무응답</option>
                                    <option>판매자 무응답</option>
                                </select>
                            </div>
                            <div class="btnArea">
                                <a href="#" class="btnHelp">도움말 보기</a>
                                <a href="#" class="btnType6"><span>전송하기</span></a>
                            </div>
                        </div>

                        <div class="tabBtn btn5"><a href="#talentTransfer" onclick="tabMenu(this , 'sendTable'); return false;"><span>재능전송</span></a></div>
                        <div id="talentTransfer" class="tabContents talentTransfer">
                            <p class="desc">재능을 전송하시면 거래가 완료됩니다.</p>
                            <div class="sWrap">
                                <div class="s1">
                                    <span class="t">원본 파일 전송</span>
                                    <input type="file" class="input-file" style="width:100%" />
                                </div>
                                <div class="s2">
                                    <span class="t">상품 재능 전송</span>
                                    <select class="select">
                                        <option>우체국 택배</option>
                                        <option>우체국 택배</option>
                                        <option>우체국 택배</option>
                                    </select>
                                    <input type="text" class="input-text" style="width:230px;" />
                                </div>
                            </div>
                            <span class="t">완료 메세지 전송</span>
                            <input type="text" class="input-text" style="width:100%" />
                            <div class="btnArea">
                                <a href="#" class="btnHelp">도움말 보기</a>
                                <a href="#" class="btnType6"><span>전송하기</span></a>
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

</body>
</html>
