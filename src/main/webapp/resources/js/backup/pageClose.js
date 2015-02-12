var clicked = false;
function CheckBrowser() {
    if (clicked == false) {
        //Browser closed
    } else {
        //redirected
        clicked = false;
    }
}

function bodyUnload() {
    if (clicked == false)//browser is closed  
    {
        var request = GetRequest();
        request.open("GET", "/testLogout.jsp", true);
        request.send();
    }
}

function GetRequest() {
    var xmlHttp = null;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    }
    catch (e) {
        //Internet Explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}