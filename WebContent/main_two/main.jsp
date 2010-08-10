<!DOCTYPE html>
<html lang="ko">
<%@ page errorPage="error.jsp"
    import="kr.pe.okjsp.*,
    	    kr.pe.okjsp.util.CommonUtil,
    	    kr.pe.okjsp.util.DateLabel,
            java.util.*,
            java.util.Iterator"
    pageEncoding="euc-kr"
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

	<jsp:include page="header.jsp"></jsp:include>

	<section>

		<div id="container">
			<div id="content">

		<article>
			<h2><a href="#" rel="bookmark">Your Awesome Article Title</a></h2>
			<div class="entry">
				<p>
				Lorem ipsum pri at agam postulant. Vis option euismod ut, mucius nominavi noluisse vim in, his ne mediocrem qualisque necessitatibus. Has at ubique utroque molestie, <a href="#">vim ne ceteros ponderum</a> hendrerit. No everti singulis disputationi eam, minim iusto cu usu, sint nulla harum duo ei. Ut vidit cotidieque ullamcorper mea, dolorem oportere vulputate ea mei, eu ius error perpetua theophrastus.
				</p>
				<img src="<%=cPath%>/images/turquoise-stone.png" alt="" class="alignright framed" /><p>
				Quis quaerendum pri no, sit ad noster timeam. An pro consul concludaturque, no possim impetus mei. Facer oblique referrentur te qui, ornatus postulant evertitur ius ea. No sed vero aperiri equidem, pri et perpetua erroribus accusamus, doctus menandri ad qui. Natum dicunt delenit te vim, has te decore deseruisse. Quot malorum legendos ut est, urbanitas interpretaris id qui, duo populo animal conclusionemque ne.
				</p>
				<p>
			Iriure postulant pro ad. Wisi delectus legendos an duo, alia utroque recteque no mel, te sed porro alienum. Vix tale suavitate incorrupte at, viris tractatos incorrupte pri ad. Veri putant volutpat his ad, no doming deserunt persecuti eum, ad nobis essent sed. Ad vis mandamus expetenda, salutandi iracundia repudiandae mei ei. Alii pericula abhorreant mei an, vix dignissim consequuntur ex, alienum invenire posidonium nam ei.
				</p>
				<blockquote>
			Minim elitr congue eu mea, quo minimum verterem gloriatur in, ex alia cotidieque complectitur qui. Eu sit idque quodsi constituto, ex mea omnesque adolescens. Sit id fabulas eligendi suscipiantur, eu natum perfecto sit, at brute option lucilius mea. Te malis disputationi has, ex eum habeo sententiae. An est meliore denique voluptatibus, nam putent voluptua inciderint in, ne simul graeci nonummy vel.
				</blockquote>
				<p>
			Quod malorum delectus ne duo, an pri facer doming quaeque, ancillae omnesque his ei. At sed nibh illum placerat. At quod appareat reprehendunt vim, te pri velit nonumy antiopam. Exerci placerat est no, cu quo affert vidisse democritum. Debitis maiestatis referrentur qui ad. Sonet praesent intellegebat mei ex, duo meis epicurei cu. Idque volutpat sadipscing ut est, eos eu alienum oportere, eum ea dicat ignota persequeris.
				</p>
				<p>
			Veritus menandri referrentur est cu. Eos ea mazim elaboraret delicatissimi, puto nostrud platonem vis an. Mea eirmod torquatos et, ad sonet minimum mea, mei eu causae eruditi intellegat. Velit vitae ridens et vel, commodo suscipit persequeris sea id, iudico persius eruditi in vel. Magna eloquentiam mei et, quo erat vituperatoribus ea, in sale audiam quo. Ad eum illum tantas volumus, iriure feugiat recteque ei est.
				</p>
			</div>
		</article>
		
			</div><!-- #content-->
		</div><!-- #container-->

		<jsp:include page="left.jsp"></jsp:include>

		<jsp:include page="right.jsp"></jsp:include>
	
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>