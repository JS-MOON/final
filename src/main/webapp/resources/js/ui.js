// JavaScript Document

// ========== [공통] ========== //

// 스크롤 이동
function goTo(to) {
    $('html, body').stop().animate({ scrollTop: to });
};

// 레이어 열기, 닫기
function showLayer(ele, modal) {
    $('#' + ele).css({}).show();
    if (modal == 'modalpop') {
        if ($('.modalScreen').hasClass('modalScreen')) {
        }
        else {
            $('<div class="modalScreen"></div>').clone().prependTo($('#wrapper'));
        }
    }
};
function hideLayer(ele, modal) {
    $('#' + ele).hide();
    if (modal == 'modalpop') {
    }
    else {
        $('.modalScreen').remove();
    }
};

// 퀵마이페이지
$(document).ready(function () {
    $(window).bind('scroll', function () {
        var quick = $('.quick-mypage-re'); // 302px
        var docT = $(document).scrollTop();

        // alert(stopH);
        if (docT < 750) {
            $(quick).removeClass('on');
        } else if (docT > 750) {
            $(quick).addClass('on');
        }
    });
});

//퀵베스트
$(document).ready(function() {

     $(window).bind('scroll', function() {
        var quick = $('#quick-best'); // 302px
        var docT = $(document).scrollTop();

        if (docT < 800) {
            $(quick).fadeOut(0);
            $(quick).removeClass('on');
        } else if (docT > 800) {
            $(quick).fadeIn(500);
            $(quick).addClass('on');
        }
    });

    $('ul , li').click(function() {
        $('li .a').css("color", "hotpink");

    });

});


// 제품상세 - side 관련재능
$(document).ready(function () {
    $(window).bind('scroll', function () {
        var quick = $('#side-related-pdt'); // 302px
        var docT = $(document).scrollTop();

        // alert(stopH);
        if (docT < 360) {
            $(quick).removeClass('on');
        } else if (docT > 360) {
            $(quick).addClass('on');
        }
    });
});

//TOP타임라인
jQuery(function () {
    $('#newAlram').hover(function () {
        $(this).find('.myNewAlram').show();
    }, function () {
        $(this).find('.myNewAlram').hide();
    });
});

jQuery(function () {
    $('#myPageDrop').hover(function () {
        $(this).find('.myPageDrop').show();
    }, function () {
        $(this).find('.myPageDrop').hide();
    });
});

// 탭메뉴
function tabMenu(target, tabGroup) {
    $('#' + tabGroup).find('.tabBtn').removeClass('on');
    $('#' + tabGroup).find('.tabContents').hide();
    $(target).parent('.tabBtn').addClass('on');
    $($(target).attr('href')).show();
}

//toast팝업
function toast(ele) {
    $('#' + ele).animate({ 'opacity': 1 });
    setTimeout(function () { $('#' + ele).animate({ 'opacity': 0 }) }, 3000);
};

// ========== [레이아웃] ========== //
// GNB
jQuery(function () {
    $('#gnb > ul > li').hover(function () {
        $(this).addClass('on');
    }, function () {
        $(this).removeClass('on');
    });
});

// ========== [메인] ========== //
jQuery(function () {
    var MainVisualBanner = function () {
        var settings = {
            RootSelector: '.mainPromotion',
            banner: '.rollingWrap',
            moveDiv: '.rollingArea',
            item: '.promotionWrap',
            button: '.controller > a'
        };
        var nodeItem = new Array();
        var length = 0;
        return {
            init: function (options) {
                var _this = this;

                $.extend(settings, options);

                $(settings.RootSelector).find(settings.button).click(function () {
                    var button = $(this).hasClass('prev') ? 'prev' : 'next'; // 2014-02-13 수정
                    if ($(settings.RootSelector).find(settings.moveDiv).css("left") === "-815px") {
                        if (button == 'prev') {
                            $(settings.RootSelector).find(settings.moveDiv).css({ "left": -1630 + "px" });
                            $(settings.RootSelector).find(settings.moveDiv).stop().animate({ 'left': -815 + "px" }, 450, function () {
                                _this.settingTabFn();
                            });
                            _this.clonePrevFn();
                        }
                        else {
                            $(settings.RootSelector).find(settings.moveDiv).animate({ 'left': -1685 + "px" }, 450, function () {
                                _this.cloneNextFn();
                                $(this).css("left", -815);
                                _this.settingTabFn();
                            });
                        }
                    }
                    return false;
                });
                this.load();
                this.settingTabFn();
            },
            load: function () {
                length = $(settings.RootSelector).find(settings.item).size();
                $(settings.RootSelector).find(settings.moveDiv).css('left', -815);

            },
            nodeItemFn: function () {
                $(settings.RootSelector).find(settings.item).each(function (i) {
                    nodeItem[i] = $(this);
                });
                return nodeItem;
            },
            clonePrevFn: function () {
                var _this = this;
                for (j = 0; j <= 2; j++) {
                    $(settings.RootSelector).find(settings.moveDiv).prepend(_this.nodeItemFn()[length - 1]);
                }
            },
            cloneNextFn: function () {
                var _this = this;
                for (j = 0; j <= 2; j++) {
                    $(settings.RootSelector).find(settings.moveDiv).append(_this.nodeItemFn()[0]);
                }

            },
            move: function () {
            },
            settingTabFn: function () {
                $(settings.RootSelector).find('a.detail, a.more').attr('tabindex', '-1');
                $(settings.RootSelector).find(settings.item).eq(3).find('a.detail, a.more').removeAttr('tabindex');
                $(settings.RootSelector).find(settings.item).eq(4).find('a.detail, a.more').removeAttr('tabindex');
                $(settings.RootSelector).find(settings.item).eq(5).find('a.detail, a.more').removeAttr('tabindex');
            },
            settingSpanFn: function () {
                $(settings.RootSelector).find(settings.button).find('span').click(function () {
                    $(this).parent('button').trigger('click');
                });
            }
        };
    }();
    MainVisualBanner.init();
});



// ========== [서브] ========== //
// [고객센터] - 쇼핑가이드
function goToGuide(ele) {
    var target = $(ele).attr('href');
    var to = $(target).position().top;
    goTo(to);
};

// [고객센터] - 게시판내용보기
$(document).ready(function () {
    $('.boardSection').find('.subject a').live('click', function () {
        $('.boardSection').find('tr.boardCont').hide();
        $('.boardSection').find('tr').removeClass('on');
        $(this).parents('tr').addClass('on');
        $(this).parents('tr').next('tr.boardCont').show();
        return false;
    });
});


// 제품메인배너
function plusTalentRolling() {
    var timer;
    var nowNum = 0;
    var maxNum = $('#plusTalent .plusTalentCont').length;

    function fadeFunction(now) {
        $('#plusTalent .plusTalentBtn').removeClass('on');
        $('#plusTalent .plusTalentBtn').eq(now).addClass('on');
        $('#plusTalent .plusTalentCont').stop().animate({ 'opacity': 0 });
        $('#plusTalent .plusTalentCont').eq(now).stop().animate({ 'opacity': 1 });
        $('#plusTalentCont3 a').attr("href", $('#plusTalent .plusTalentCont a').eq(now).attr("href"));      // 추가 강남구..
    };

    function Action() {
        timer = setInterval(function () {
            nowNum++;
            nowNum = (nowNum >= maxNum) ? 0 : nowNum;
            fadeFunction(nowNum)
        }, 3000)
    };
    fadeFunction(nowNum);
    Action();

    $('#plusTalent .plusTalentBtn a').bind('click', function () {
        var btnNum = $('#plusTalent .plusTalentBtn').index($(this).parent('.plusTalentBtn'));
        fadeFunction(btnNum);
        nowNum = btnNum;
        clearInterval(timer);
        Action();
        return false;
    });
};

// 리스트롤링[공통]
jQuery.fn.listRolling = function (_o) {
    return this.each(function () {
        var o = jQuery.extend({}, _o);

        var $rollingWrap = jQuery(this);
        var $list = $rollingWrap.find(o.list);
        var $btnL = $rollingWrap.find(o.btnL);
        var $btnR = $rollingWrap.find(o.btnR);
        var totalNum = $list.find('li').length;
        var showNum = o.showNum;
        var moveNum = totalNum - showNum;

        function move(num) {
            $list.stop().animate({ 'left': -130 * num });
        }

        var i = 0;
        $btnR.bind('click', function () {
            if (totalNum <= showNum) return false;
            i++;
            if (i > moveNum) {
                move(0);
                i = 0;
            }
            else {
                move(i);
            }
        });

        $btnL.bind('click', function () {
            if (totalNum <= showNum) return false;
            i--;
            if (i < 0) {
                move(moveNum);
                i = moveNum;
            }
            else {
                move(i);
            }
        });
    });
};

// [마이페이지] - snb
jQuery(function () {
    $('#mypageSnb').find('a').hover(function () {
        $(this).parents('li').addClass('on');
    }, function () {
        $(this).parents('li').removeClass('on');
    });
});

// [프리미엄] 제품
jQuery(function () {
    $('.pmPdtWrap a').hover(function () {
        $(this).parent().addClass('on');
    }, function () {
        $(this).parent().removeClass('on');
    })
})

// 2조 추가사항
//========== [찜목록] ==========//
function changeWishList(id) {

	var parent = $("#wishList_" + id).parent();
	var sessionId = $("#sessionId").val();
	
	if(sessionId!=""){
		if (parent.hasClass('on')) {
			$.ajax({
				type : "POST",
				url : "../My/AddMyFavority.action",
				data : {
					brNum : $("#wishList_" + id).val()
				},
				success : function(args) {
						parent.removeClass('on');	
				},
				error : function(request, status, error) {
					alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				}
			});
		}else if(!parent.hasClass('on')){
			$.ajax({
				type : "POST",
				url : "../My/DelMyFavority.action",
				data : {
					brNum : $("#wishList_" + id).val()
				},
				success : function(args){
					parent.addClass('on');
					window.location.reload();
				},
				error : function(request, status, error) {
					alert("code : " + request.status + "\n" + "message : "+ request.responseText + "\n" + "error : " + error);
				}
			});
		}
	}else if(sessionId==""){
		alert("로그인이 필요합니다.");
		showLayer('loginPop', 'modalpop');
	}
}

//========== [포인트] ==========//
function selectUsePoint() {
    var usePoint = document.getElementsByName("usePoint");

    if(usePoint[0].checked===true) {
        usePoint[1].checked = false;
        document.getElementById("pointInputBox").hidden = "";
    } else {
        usePoint[0].checked = false;
        document.getElementById("pointInputBox").hidden = "hidden";
    }
}

function gOrderSubmit() {
    if((Number(document.getElementById("pointInputBox").value) <= Number(document.getElementById("restPoint").value))||document.getElementById("pointInputBox").value === "0") {
        if(document.getElementById("pointInputBox").value === "") {
            document.getElementById("usedPoint").value = 0;
        } else {
            document.getElementById("usedPoint").value = document.getElementById("pointInputBox").value;
        }
        document.orderForm.submit();
    } else {
        alert("포인트가 모자랍니다.");
    }
}

function updatePointValue() {
    if(Number(document.getElementById("pointInputBox").value)>Number(document.getElementById("temporaryTotalPrice").value)) {
        document.getElementById("pointInputBox").value = document.getElementById("temporaryTotalPrice").value;
        alert("합계금액 이상 포인트를 사용할 수 없습니다.")
    }
    
    $("#pointValue").text(document.getElementById("pointInputBox").value);
    $("#totalPrice").text(document.getElementById("temporaryTotalPrice").value - document.getElementById("pointInputBox").value);
    $("#vatAddedTotalPrice")
        .text(parseInt((document.getElementById("temporaryTotalPrice").value - document.getElementById("pointInputBox").value) * 1.1));
    document.getElementById("hiddenVatAddedTotalPrice").value = Math.round((document.getElementById("temporaryTotalPrice").value - document.getElementById("pointInputBox").value) * 1.1);
    document.getElementById("hiddenTotalPrice").value = (document.getElementById("temporaryTotalPrice").value - document.getElementById("pointInputBox").value);
}

function goLogin2() {
    // var button = document.getElementById('lbtnLogin');
    var f = document.loginForm2;

    if(!f.mbId.value.trim()){
        alert("아이디를 입력하세요.");
        f.mbId.focus();
        return;
    }
    if(!f.mbPw.value.trim()){
        alert("비밀번호를 입력하세요.");
        f.mbPw1.focus();
        return;
    }

    // button.click();

    f.submit();
}

function goLogin() {
    // var button = document.getElementById('lbtnLogin');
    var f = document.loginForm;

    if(!f.mbId.value.trim()){
        alert("아이디를 입력하세요.");
        f.mbId.focus();
        return;
    }
    if(!f.mbPw.value.trim()){
        alert("비밀번호를 입력하세요.");
        f.mbPw1.focus();
        return;
    }

    var path = location.href.substr(location.href.indexOf("/final/") + 6);

    document.getElementById("currentURL").value = path;

    f.submit();
}

function searchSubject(){

    var f = document.searchForm;

    if(f.searchValue.value==null){
        alert("검색어를 입력해주세요");
        f.searchValue.focus();
        return;
    }

    f.action = "../Goods/GSearchList.action";
    f.submit();
}
