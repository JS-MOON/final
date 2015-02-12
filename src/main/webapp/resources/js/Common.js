
// 팝업창 호출
function popUP(mypage, myname, winl, wint, w, h, scroll, titlebar, status, menubar, location) {
    winprops = 'height=' + h + ',width=' + w + ',top=' + wint + ',left=' + winl + ',toolbar=no,scrollbars=' + scroll + ',status=' + status + ',menubar=' + menubar + 'location=' + location + ',resize=no'
    //window.open(url,popname,"toolbar=no,width=350px;,height=285px;,directories=no,status=no,scrollbars=no,resize=no,menubar=no");//
    win = window.open(mypage, myname, winprops)
    if (parseInt(navigator.appVersion) >= 4) {
        win.window.focus();
    }
}
// 팝업창 호출

// 의사 결정 창 호출
function ConfirmMsg(Msg) {
    if (confirm(Msg))
        return true;
    else
        return false;
}
// 의사 결정 창 호출


