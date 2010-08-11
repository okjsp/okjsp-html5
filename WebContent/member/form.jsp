<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<%@ page errorPage="error.jsp"
    import="kr.pe.okjsp.*,
            kr.pe.okjsp.util.CommonUtil,
            kr.pe.okjsp.util.DateLabel,
            java.util.*,
            java.util.Iterator"
%>
<head>
<%
//ContextPath
String cPath = request.getContextPath();

%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<style type="text/css">
.contactform {
    width: 418px;
    margin: 2.0em 0 0 0;
    padding: 10px 10px 0 10px;
    border: solid 1px #C8C8C8;
    background-color: #F2F2F2;
}
.contactform fieldset {
    padding: 20px 0 0 0 !important /*Non-IE6*/;
    padding: 0 /*IE6*/;
    margin: 0 0 20px 0;
    border: solid 1px #DCDCDC;
}
.contactform fieldset legend {
    margin: 0 0 0 5px !important /*Non-IE*/;
    margin: 0 0 20px 5px /*IE6*/;
    padding: 0 2px 0 2px;
    color: rgb(80,80,80);
    font-weight:bold;
    font-size:130%;
}
.contactform label.left {
    float: left;
    width: 100px; 
    margin: 0 0 0 10px;
    padding: 2px; 
    font-size: 110%;
}

</style>
<title>OKJSP</title>
<script>
/**server-sent-event_시작 */
(function() {
    var INIT_MESSAGE = "Now wait for server-side events. They will keep appearing in the console...",
        FAIL_MESSAGE = "Sorry, I have never heard that your browser supports SSE";

    /**
     * Event logger
     * @param (string) message
     */
    var log = function(message) {
        document.getElementById('output').innerHTML =  message + "\n";
    };
    /**
     * Detects which sort of SSE support to apply if to apply it at all
     * @return user agent type
     */
    var detectUAgent = function() {
        if (navigator.appName == "Opera" && -1 !== navigator.appVersion.indexOf("9.")) {
            //log("Opera browser detected. " + INIT_MESSAGE);
            return 'opera';
        } else
        if (-1 !== navigator.appVersion.indexOf("AppleWebKit/5")) {
            //log("Apparently, your browser supports SSE. " + INIT_MESSAGE);
            return 'webkit';
        } else
        if (navigator.appName == "Netscape" && -1 !== navigator.appVersion.indexOf("5.0")) {
            //log("Your browser does not support SSE yet natively, but you can see here emulation. " + INIT_MESSAGE);
            return 'webkit';
        } else
        if (undefined !== window['EventSource']) {
            //log("I'm not sure about your browser, but let's try. " + INIT_MESSAGE);
            return 'webkit';
        }  else {
            //log(FAIL_MESSAGE);
            return false;
        }
    };
    /**
     * Event handler for upcomming server-sent messages
     * @param (event) event
     * @event
     */
    var onMessageHandler = function (event) {
        log(event.data);
    };
    /**
     * Init event source in Opera fashion
     */
    var operaEventSource = function() {
        alert( "Opera" );
        document.getElementsByTagName("event-source")[0]
        .addEventListener("server-time", onMessageHandler, false);
    };
    /**
     * Init event source in WebKit fashion
     */
    var webkitEventSource = function() {
      var eventSrc = new EventSource('main/main_event.jsp');
      eventSrc.addEventListener('message', onMessageHandler);
    };

    var startEvent = function() {
            switch(detectUAgent()) {
                case "opera":
                    operaEventSource();
                    break;
                case "webkit":
                    webkitEventSource();
                    break;
            }
    };
    startEvent();
}());
/**server-sent-event_끝 */
</script>
<title>OKJSP_HTML5</title>
</head>
<body>

<div id="wrapper">

    <jsp:include page="../main/header.jsp" />

    <section>
        <div id="container">
            <div id="content">
                <!-- 메인 컨텐츠_시작======================================= -->
                    <div class="contactform">
                        <form method="post" action="index.html">
                            <fieldset><legend>&nbsp;okjsp.pe.kr 회원가입&nbsp;</legend>
                                <p><label for="contact_email" class="left">Email:</label>
                                     <input type="email" name="contact_email" id="contact_email" class="field" autofocus required /></p>
                                <p><label for="contact_id" class="left">ID:</label>
                                     <input type="text" name="contact_id" id="contact_id" class="field" required /></p>
                                <p><label for="contact_name" class="left">Name:</label>
                                     <input type="text" name="contact_name" id="contact_name" class="field" required /></p>
                                <p><label for="contact_url" class="left">Website:</label>
                                     <input type="text" name="contact_url" id="contact_url" class="field" /></p>
                                <p><label for="contact_url" class="left">Mailling:</label>
                                     <span class="item first"><input type="radio" name="contact_mailling" id="contact_mailling_y" /><label class="" for="contact_mailling_y">허용</label></span>
                                     <span class="item"><input type="radio" name="contact_mailling" id="contact_mailling_n" checked /><label class="" for="contact_mailling_n">거부</label></span>
                                     <span class="guide">okjsp에서 비정기적으로 발행하는 뉴스레터와 홍보메일 수신 설정입니다.</span>
                                     </p>
                            </fieldset>
                            <fieldset><legend>&nbsp;Icon&nbsp;</legend>
                                <div id="preview">
                                    <div id="icon-drop">Drop the image</div>
                                    <div id="icon"></div>
                                </div>
                            </fieldset>
                            <fieldset><legend>&nbsp;Info&nbsp;</legend>
                                <p style="padding-left:15px;">가입시 임시비밀번호가 메일로 발송됩니다.<br>로그인 후 비밀번호를 바꿔주시기 바랍니다.</p>
                            </fieldset>
                        </form>
                    </div>
                <!-- 메인 컨텐츠_끝======================================= -->
            </div><!-- #content-->
        </div><!-- #container-->

        <jsp:include page="../main/left.jsp" />

        <jsp:include page="../main/right.jsp" />
    
    </section>

    <jsp:include page="../main/footer.jsp" />

</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>
<event-source src="main_event.jsp" />
<%!
    ListHandler list = new ListHandler();
    Iterator getCachedList(String bbsid) {
        Iterator iter = null;
        try {
            iter = list.getRecentList(bbsid, 5).iterator();
        } catch(Exception e) {
            iter = new ArrayList().iterator();
        }
        return iter;
    }

%>