<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<style type="text/css">
    .hidden {
        display: none;
    }
</style>

<script type="text/javascript">
    function saveValidate() {
        var ctlUP1 = document.getElementById('fu_attach1');
		var ctlUP2 = document.getElementById('fu_attach1');
        var ctlFile1 = ctlUP1.files[0];
		var ctlFile2 = ctlUP2.files[0];

        if (ctlFile1 == null || ctlFile2 == null) {
            return true;
        } else {
            if (ctlFile1.size > 10240000 || ctlFile2.size > 10240000) {
                alert('최대 업로드 가능용량은 10M입니다.');
                return false;
            }
        }
        return true;
    }


    function option(){
    	var s1 = document.sellForm.s1;
    	var s2 = document.sellForm.s2;

    	while (s2.length != 0) {
			s2.options.remove(0);
		}

    	if(s1.value == "110") {
   		  s2.options.add(new Option("도면/3D", "1"));
   		  s2.options.add(new Option("로고/BI/CI디자인","2"));
   		  s2.options.add(new Option("만화/웹툰", "3"));
   		  s2.options.add(new Option("명함", "4"));
   		  s2.options.add(new Option("배너/상세페이지","5"));
   		  s2.options.add(new Option("블로그/카페/웹", "6"));
   		  s2.options.add(new Option("사진/포토샵", "7"));
   		  s2.options.add(new Option("일러스트/그림", "8"));
   		  s2.options.add(new Option("전단지/홍보물", "9"));
   		  s2.options.add(new Option("캐리커쳐/인물", "10"));
   		  s2.options.add(new Option("캐릭터/아이콘", "11"));
   		  s2.options.add(new Option("캘리그라피", "12"));
   		  s2.options.add(new Option("POP", "13"));
   		  s2.options.add(new Option("PPT/템플릿", "14"));
    	}

    	if(s1.value == "120") {
  		  s2.options.add(new Option("노하우/상담", "15"));
  		  s2.options.add(new Option("마케팅","16"));
  		  s2.options.add(new Option("법률/법무", "17"));
  		  s2.options.add(new Option("사업/컨설팅", "18"));
  		  s2.options.add(new Option("사업계획","19"));
  		  s2.options.add(new Option("세무/회계사", "20"));
  		  s2.options.add(new Option("투자/금융", "21"));
  		  s2.options.add(new Option("특허/변리사", "22"));
  		}

    	if(s1.value == "130") {
  		  s2.options.add(new Option("교정/교열", "23"));
  		  s2.options.add(new Option("독후감/서핑","24"));
  		  s2.options.add(new Option("리서치/자료수집", "25"));
  		  s2.options.add(new Option("문서 레포트", "26"));
  		  s2.options.add(new Option("사업계획/제안서","27"));
  		  s2.options.add(new Option("엑셀/통계", "28"));
  		  s2.options.add(new Option("워드/타이핑", "29"));
  		  s2.options.add(new Option("자기소개서/이력서", "30"));
	  	}

    	if(s1.value == "140") {
  		  s2.options.add(new Option("매크로/엑셀", "31"));
  		  s2.options.add(new Option("모바일웹","32"));
  		  s2.options.add(new Option("안드로이드", "33"));
  		  s2.options.add(new Option("워드프레스", "34"));
  		  s2.options.add(new Option("원격수리/최적화","35"));
  		  s2.options.add(new Option("응용프로그래밍", "36"));
  		  s2.options.add(new Option("컴퓨터IT", "37"));
  		  s2.options.add(new Option("플래시/스크립트", "38"));
  		  s2.options.add(new Option("홈페이지/웹", "39"));
  		  s2.options.add(new Option("IOS", "40"));
  		  s2.options.add(new Option("PC/노트북", "41"));
    	}

    	if(s1.value == "150") {
   		  s2.options.add(new Option("독일어번역", "42"));
   		  s2.options.add(new Option("러시아번역","43"));
   		  s2.options.add(new Option("스페인어번역", "44"));
   		  s2.options.add(new Option("영어번역", "45"));
   		  s2.options.add(new Option("외국어/기타","46"));
   		  s2.options.add(new Option("외국어교육", "47"));
   		  s2.options.add(new Option("일본어번역", "48"));
   		  s2.options.add(new Option("중국어번역", "49"));
   		  s2.options.add(new Option("프랑스어번역", "50"));
      	}

    	if(s1.value == "160") {
  		  s2.options.add(new Option("내래이션/성우", "51"));
  		  s2.options.add(new Option("노래/댄스","52"));
  		  s2.options.add(new Option("악보제작", "53"));
  		  s2.options.add(new Option("애니메이션", "54"));
  		  s2.options.add(new Option("영상제작/편집","55"));
  		  s2.options.add(new Option("음악레슨", "56"));
  		  s2.options.add(new Option("음악편집/녹음", "57"));
  		  s2.options.add(new Option("작곡/MR/작사", "58"));

    	}

    	if(s1.value == "170") {
   		  s2.options.add(new Option("강사섭외", "59"));
   		  s2.options.add(new Option("댄스공연","60"));
   		  s2.options.add(new Option("마술공연", "61"));
   		  s2.options.add(new Option("모델/피팅", "62"));
   		  s2.options.add(new Option("어린이행사","63"));
   		  s2.options.add(new Option("역활대행", "64"));
   		  s2.options.add(new Option("축가/연주", "65"));
   		  s2.options.add(new Option("하객대행", "66"));
   		  s2.options.add(new Option("행사도우미", "67"));
   		  s2.options.add(new Option("MC/사회", "68"));
        }

    	if(s1.value == "180") {
   		  s2.options.add(new Option("고민상담", "69"));
   		  s2.options.add(new Option("심리상담","70"));
   		  s2.options.add(new Option("연애상담", "71"));
   		  s2.options.add(new Option("요리", "72"));
   		  s2.options.add(new Option("유학/해외생활","73"));
   		  s2.options.add(new Option("인생/경험", "74"));
   		  s2.options.add(new Option("입시노하우", "75"));
   		  s2.options.add(new Option("직업/진로", "76"));
   		  s2.options.add(new Option("창업/사업", "77"));
   		  s2.options.add(new Option("투자/재테크", "78"));
   		  s2.options.add(new Option("학습/학교생활", "79"));
        }

    	if(s1.value == "190") {
   		  s2.options.add(new Option("건강/다이어트", "80"));
   		  s2.options.add(new Option("게임","81"));
   		  s2.options.add(new Option("노무/수리", "82"));
   		  s2.options.add(new Option("미용/스타일링", "83"));
   		  s2.options.add(new Option("사주/운세","84"));
   		  s2.options.add(new Option("생활서비스", "85"));
   		  s2.options.add(new Option("심부름/배달", "86"));
   		  s2.options.add(new Option("연애/이벤트", "87"));
   		  s2.options.add(new Option("온라인교습", "88"));
   		  s2.options.add(new Option("재미", "89"));
   		  s2.options.add(new Option("청소/이사", "90"));
        }

    	if(s1.value == "200") {
     		  s2.options.add(new Option("게스트하우스", "91"));
     		  s2.options.add(new Option("국내여행","92"));
     		  s2.options.add(new Option("제주여행", "93"));
     		  s2.options.add(new Option("캠핑가이드", "94"));
     		  s2.options.add(new Option("항공권","95"));
     		  s2.options.add(new Option("행외여행", "96"));
        }

    	if(s1.value == "210") {
   		  s2.options.add(new Option("도예/공예", "97"));
   		  s2.options.add(new Option("미술/예술품","98"));
   		  s2.options.add(new Option("생활용품", "99"));
   		  s2.options.add(new Option("식품/농작물", "100"));
   		  s2.options.add(new Option("아이디어제품","101"));
   		  s2.options.add(new Option("액세서리/쥬얼리", "102"));
   		  s2.options.add(new Option("옷/패션잡화", "103"));
   		  s2.options.add(new Option("웨딩","104"));
   		  s2.options.add(new Option("이벤트용", "105"));
   		  s2.options.add(new Option("인테리어소품", "106"));
   		  s2.options.add(new Option("천연제품","107"));
   		  s2.options.add(new Option("카드/문구", "108"));
   		  s2.options.add(new Option("Wedding the M", "109"));
      }

    }

	function sellIt() {
		var f = document.sellForm;

		var optionsList = document.getElementsByName("options");
		var pricesList = document.getElementsByName("prices");
		var option = "";

		//옵션1$추가금액1  & 옵션2$추가금액2 
        for(var i=0;i<optionsList.length;i++) {
        	if(option !== "" && optionsList[i].value!=="") {
        		option += "&";
        	}

            if (optionsList[i].value!=="") {
                option += optionsList[i].value;
                option += "/";
                option += pricesList[i].value;
            }
        }

        f.completedOption.value = option;
       
        if(f.brSubject.value==""){
        	alert("재능제목을 적어주세요");
        	return;
        }
        if(f.brPrice.value==""){
        	alert("가격을 적어주세요");
        	return;
        }
        if(f.brContent.value==""){
        	alert("재능설명을 적어주세요");
        	return;
        }

        f.action = "SellProdReg_ok.action";
        f.submit();

	}




</script>


<form action="" name="sellForm" method="post" enctype="multipart/form-data">

<div class="primaryContents registerTalent">
    <!-- 마이페이지lnb -->
    <div class="mypage_lnb">
        <h3>재능 등록</h3>
        <div class="location">
            <span>홈</span> &gt; <span>판매 Sell</span> &gt; <span>재능 등록</span>
        </div>
    </div>
    <!-- //마이페이지lnb -->

    <!-- 내용 -->
    <div class="contBlock">
        <div>

            <h4>카테고리</h4>
            <div class="settingOption category">

               <select name="s1" onchange="option()" class="select" style="width:180px;width: 180px;">
               		<option value="0">선택하세요 </option>
               		<option value="110">그래픽 디자인</option>
               		<option value="120">사업 전문가</option>
                    <option value="130">문서 레포트</option>
                    <option value="140">컴퓨터 IT</option>
                    <option value="150">번역 외국어</option>
                    <option value="160">음악 동영상</option>
                    <option value="170">행사 공연</option>
                    <option value="180">노하우 상담</option>
                    <option value="190">생활서비스</option>
                    <option value="200">여행 가이드</option>
                    <option value="210">핸드메이드</option>

               </select>

               <select name="s2" class="select" style="width:180px;width: 180px;">
               		<option value="0">선택하세요</option>

               </select>

            </div>

            	 <input name="mbId" type="hidden" value="${sessionScope.session.mbId }" />

            <h4>재능 타이틀</h4>
            <div class="settingOption title">

                <textarea name="brSubject" maxlength="100" class="textarea" style="width: 100%; height: 55px;"></textarea>

            </div>

            <h4>연락처</h4>
            <p class="settingDesc">TALENT 팀에서 판매자에게 연락할 수 있는 번호를 입력해주세요.</p>
            <div class="settingOption">

                <input name="tel1" type="text" maxlength="3"  class="input-text" style="width:89px;width: 60px;" />
                -<input name="tel2" type="text" maxlength="4"  class="input-text" style="width: 60px;" />
                -<input name="tel3" type="text" maxlength="4"  class="input-text" style="width: 60px;" />

            </div>

            <div class="optionWrap">
                <div class="innerWrap item1">
                    <h4>재능 가격</h4>
                    <div class="settingOption">

                        <input name="brPrice" type="text" maxlength="12" class="input-text" style="width:129px;" />
                        <label> 원</label>
                    </div>
                </div>

            </div>

            <h4>옵션 추가</h4>
            <p class="settingDesc">
               <!--  옵션은 최대 5개까지 추가 가능합니다.&nbsp;&nbsp;
                <a class="btnType6" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$WUC_My_AblityEdit1$lbtn_optAdd&#39;,&#39;&#39;)"><span>옵션추가</span></a> -->
				  옵션1 <input name="options" type="text" maxlength="12" class="input-text" style="width:129px;" />
				 추가금액1 <input name="prices" type="text" maxlength="12" class="input-text" style="width:129px;" /><br/>
				  옵션2 <input name="options" type="text" maxlength="12" class="input-text" style="width:129px;" />
				 추가금액2 <input name="prices" type="text" maxlength="12" class="input-text" style="width:129px;" /><br/>
				  옵션3 <input name="options" type="text" maxlength="12" class="input-text" style="width:129px;" />
				 추가금액3 <input name="prices" type="text" maxlength="12" class="input-text" style="width:129px;" /><br/>
				  옵션4 <input name="options" type="text" maxlength="12" class="input-text" style="width:129px;" />
				 추가금액4 <input name="prices" type="text" maxlength="12" class="input-text" style="width:129px;" /><br/>
				  옵션5 <input name="options" type="text" maxlength="12" class="input-text" style="width:129px;" />
				 추가금액5 <input name="prices" type="text" maxlength="12" class="input-text" style="width:129px;" /><br/>
            </p>
			<input type="hidden" name="completedOption" value=""/>
            <h4>재능설명</h4>
            <div class="settingOption">
                <textarea name="brContent" rows="2" cols="20" class="textarea" style="height:71px;width:772px;width: 100%; height: 270px;"></textarea>
            </div>




        </div>
        <h4>첨부파일</h4>
        <p class="settingDesc">포트폴리오 및 상세페이지에서 사용될 모든 자료를 하나로 압축해서 올려주세요.<font color="red"> (용량제한: 10MB 미만)</font></p>
        <div class="settingOption">

            <input type="file" name="brMainPhoto" id="fu_attach1" class="input-file" style="width:498px;width: 100%;" />
            <input type="file" name="brMorePhoto" id="fu_attach2" class="input-file" style="width:498px;width: 100%;" />
        </div>


        <div class="note">
            <strong>등록전 확인해주세요</strong>
            <ul>
                <li>- 판매자는 재능 등록과 동시에 해당 재능을 판매할 의무가 있습니다.</li>
                <li>- 등록한 재능이 관련법규를 위반한 경우, 모든 책임은 판매자가 감수합니다.</li>
                <li>- 등록한 재능은 관리자의 승인절차를 거치며, 재능이 적합해야만 판매 하실수 있습니다.</li>
                <li>- 등록하신 재능은 디자인 편집을 거쳐 게시됩니다. 추가적인 이미지나 첨부자료를 요청받으실 수 있습니다.</li>
                <li>- 업무시간(월~금: 오전 9:00 ~ 오후 6:00) 이외에 재능을 등록 및 편집시 승인이 늦어질 수 있습니다.</li>
                <li>- 구매자와 직거래를 유도하는 경우 판매정지 및 TALENT 접속에 제한을 받을수 있으니 주의 바랍니다.</li>
                <li>- 임시저장한 재능은 구매자에게 노출되지 않으며, 관리자의 승인도 거치지 않습니다.</li>
                <li>- 임시저장한 재능은 추후 나의 재능에서 작성완료하신 후 다시 등록요청하셔야 합니다.</li>
            </ul>
        </div>

        <div class="btnArea al_c">
            <a onclick="sellIt();" class="btnType3"><span>등록 요청</span></a>
        </div>
    </div>
    <!-- //내용 -->
</div>



</form>

</body>
</html>