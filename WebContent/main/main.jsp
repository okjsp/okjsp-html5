<!DOCTYPE html>
<%@page import="kr.pe.okjsp.ListHandler"%>
<%@page import="kr.pe.okjsp.BbsInfoBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.pe.okjsp.util.DateLabel"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.pe.okjsp.Article"%>
<%@page import="java.util.Iterator"%>
<html lang="ko">
<%@ page errorPage="error.jsp"
    pageEncoding="UTF-8"
%>
<head>
<%
//ContextPath
String cPath = request.getContextPath();
int maxseq = 0;
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1" />
<link rel="icon" type="image/x-icon" href="<%=cPath%>/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<script src="<%=cPath%>/js/prototype.js"></script>
<script src="<%=cPath%>/js/cookie.js"></script>
<script src="/js/banner.js"></script>
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<title>OKJSP_HTML5</title>
</head>
<body>

<div id="wrapper">

	<jsp:include page="header.jsp"></jsp:include>

	<section>
		<div id="container">
			<div id="content">
			<!-- 메인 컨텐츠_시작======================================= -->
				<article style="text-align:center">
<script type="text/javascript">
Banner.show();
</script>
				</article>
				<br/>
				<article>
					<%
		          	Iterator iterList = null;
		        	Article one = null;
		          	ArrayList arrayList = new ArrayList();
		          	arrayList.add("notice|공지사항");
		
		        	Iterator iter = arrayList.iterator();
		        	String [] rec = null;
		        	while(iter.hasNext()) {
		        		rec = ((String)iter.next()).split("\\|");
		        		%>
		        		<h2><a href="<%=cPath%>/bbs?act=LIST&amp;bbs=<%= rec[0] %>"><%= rec[1] %></a></h2>
		        		<blockquote>
			          		<table>
			        		<%
			        		iterList = getCachedList(rec[0]);
			        		while (iterList.hasNext()) {
			        			one = (Article) iterList.next();
			        			%>
			        			<tr>
							        <td>
							        	<div class="ellipsis" style="width: 260px;">
								            <a href="<%=cPath%>/seq/<%= one.getSeq() %>" target="_blank"
								            ><%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %></a>
							            </div>
							        </td>
							        <td>
							        	<span>[<%= one.getMemo() %>]</span>
							        </td>
							        <td><div class="ellipsis" style="width: 80px;"><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
							        <td><div><%
								    if (one.getId() != null) {
								        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
								        	alt="<%= one.getId() %>"
								        	style="width:14px;height:14px"><%
								    }
							        	%></div></td>
							        <td title="<%= one.getWhen() %>">
							        	<%= DateLabel.getTimeDiffLabel(one.getWhen()) %>
							        </td>
							    </tr>
			        			<%
			        		}
			        		%>
			        		</table>
		        		</blockquote>
		        		<%
		        	}
		          	%>
				</article>
				<article>
					<h2><a href="#" rel="bookmark">전체게시판</a></h2>
					<blockquote>
						<table id="table_list">
			            <%
							HashMap bbsInfoMap = (HashMap)application.getAttribute("bbsInfoMap");
							iterList = list.getAllRecentList(40).iterator();
							int i = 0;
							while (iterList.hasNext() && i < 20) {
						
							    one = (Article) iterList.next();
							    BbsInfoBean bbsInfo = ((BbsInfoBean)(bbsInfoMap.get(one.getBbs())));
							    if (bbsInfo == null) {
							    	bbsInfo = new BbsInfoBean();
							    }
						    	
							    // 모바일웹 프로젝트 진행중에는 테스트 데이타인
						    	// twitter 와 null 은 보여지지 않습니다.
						    	if (bbsInfo.getCseq() == null || "".equals(bbsInfo.getCseq()) || "twitter".equals(bbsInfo.getBbs())) {
						    		continue;
						    	}
						    	
							    if ("2".equals(bbsInfo.getCseq())) {
							    	continue;
							    }
							    //게시판 목록의 가장 맨 위의 번호와 db에 있는 게시판 목록의 번호를 비교하여
							    //다르면 db의 게시판 내용을 뿌려준다
							    if(i == 0){
									maxseq = one.getSeq();
							    }
							    
							    i++;    
						%>
			                <tr>
						        <td>
						        	<div class="ellipsis" style="width: 70px;">
						        		<a href="<%=cPath%>/bbs?act=LIST&amp;bbs=<%= one.getBbs() %>">
						        			<%= bbsInfo.getName() %></a></div>
						        </td>
						        <td>
						        	<div class="ellipsis" style="width: 180px;">
							            <a href="<%=cPath%>/seq/<%= one.getSeq() %>" target="_blank">
							            <%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
							            </a>
						            </div>
						        </td>
						        <td>
						        	<span>[<%= one.getMemo() %>]</span>
						        </td>
						        <td><div class="ellipsis" style="width: 50px;"><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
						        <td><div><%
						    if (one.getId() != null) {
						        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
						        	alt="<%= one.getId() %>"
						        	style="width:14px;height:14px"><%
						    }
						        	%></div></td>
						        <td title="<%= one.getWhen("yyyy-MM-dd HH:mm:ss z") %>">
						        	<span name="dataLabel" data-time="<%= one.getWhen().getTime() %>">
						        		<%= DateLabel.getTimeDiffLabel(one.getWhen()) %>
						        	</span>
						        </td>
						    </tr>
						<%
							}
						%>
			            </table>
					</blockquote>
				</article>
				<br><br>
				<!-- 메인 컨텐츠_끝======================================= -->
			</div><!-- #content-->
			<br/>
			<!-- ############## Chatting 시작 ################# -->
			<div id="content">
				<jsp:include page="../chat/chatMain.jsp"></jsp:include>
			</div>
			<!-- ############## Chatting 끝 ################# -->
		</div><!-- #container-->

		<jsp:include page="left.jsp"></jsp:include>

		<jsp:include page="right.jsp"></jsp:include>
	
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
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
<script>
var maxseq = '<%=maxseq%>';

//전체게시판 날짜 계산
function refreshTimes(){
	var dates = document.getElementsByName('dataLabel');
	var now = new Date();
	for(var k=0;k<dates.length;k++){
		var date = dates[k];
		var writer = new Date(parseInt(date.getAttribute('data-time')));
		//alert(now+'=='+writer+'\n'+(now - writer));
		var tmp_date = Math.round((now - writer)/60000);
		var tmp = '';

		if(tmp_date < 1){
			tmp = ('지금막');
		}else if(tmp_date < 60){
			tmp = (tmp_date + '분전');
		}else if(tmp_date < (60*24)){
			tmp_date = Math.round(tmp_date/60);
			tmp = (tmp_date + '시간전');
		}else if(tmp_date < (60*24*30)){
			tmp_date = Math.round(tmp_date/(60*24));
			tmp = (tmp_date + '일전');
		}else if(tmp_date < (60*24*30*12)){
			tmp_date = Math.round(tmp_date/(60*24*30));
			tmp = (tmp_date + '달전');
		}else{
			tmp = '모름...';
		}

		date.innerHTML = tmp;
	}
}

refreshTimes();

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
            return 'opera';
        } else
        if (-1 !== navigator.appVersion.indexOf("AppleWebKit/5")) {
            return 'webkit';
        } else
        if (navigator.appName == "Netscape" && -1 !== navigator.appVersion.indexOf("5.0")) {
            return 'webkit';
        } else
        if (undefined !== window['EventSource']) {
            return 'webkit';
        }  else {
            return false;
        }
    };
    /**
     * Event handler for upcomming server-sent messages
     * @param (event) event
     * @event
     */
    var onMessageHandler = function (event) {
        var dbmaxseq = event.data;
		if(maxseq < dbmaxseq){
			//1. db값이 클경우 : 추가(하면서 밑의 데이터를 삭제시켜야함)
			var myAjax = new Ajax.Request(
			        "/html5/main/main_event.jsp",
			        {method: 'get', parameters: "seq="+dbmaxseq ,
				    onComplete: ajax_response}
			    );
		    //1-2. 게시판의 시간 값을 바꾼다.
		    refreshTimes();
		}else if(maxseq > dbmaxseq){
			//2. db값이 작을경우 : 삭제(하면서 밑의 데이터를 추가시켜야 하는데..어려울듯 ㅋㅋ)
			//삭제만 하자 ㅋㅋ~
			//근데 삭제가 잘 안된다 쩝...
			var list = $('table_list');
			list.deleteRow(1);
		} 
		maxseq = dbmaxseq;
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
      //var eventSrc = new EventSource('main/main_event.jsp');
      var eventSrc = new EventSource('/html5/mainlist');
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

    function ajax_response(originalRequest) {
		var list = $('table_list');
		var oRow = list.insertRow();
		oRow.innerHTML = originalRequest.responseText;
		oRow.className = 'tr_start';
		list.deleteRow(20);
	}
	
    startEvent();
}());
/**server-sent-event_끝 */
</script>
</body>
</html>