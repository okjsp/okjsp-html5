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

	<jsp:include page="header.jsp"></jsp:include>

	<section>
		<div id="container">
			<div id="content">
			<!-- 메인 컨텐츠_시작======================================= -->
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
		        		<h2><a href="<%=cPath%>/bbs?act=LIST&bbs=<%= rec[0] %>"><%= rec[0] %>[<%= rec[1] %>]</a></h2>
		        		<blockquote>
			          		<table>
			        		<%
			        		iterList = getCachedList(rec[0]);
			        		while (iterList.hasNext()) {
			        			one = (Article) iterList.next();
			        			%>
			        			<tr align="center">
							        <td><%= one.getRef() %></td>
							        <td>
							        	<div class="ellipsis" style="width: 260px;">
								            <a href="<%=cPath%>/seq/<%= one.getSeq() %>">
								            	<%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
								            </a>
							            </div>
							        </td>
							        <td>
							        	<span><str:replace replace="[0]" with="">[<%= one.getMemo() %>]</str:replace></span>
							        </td>
							        <td><div><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
							        <td><div><%
								    if (one.getId() != null) {
								        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
								        	alt="<%= one.getId() %>"
								        	style="width:14px;height:14px"
								        	onerror="this.src='<%=cPath%>/images/spacer.gif'"><%
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
				<br><br>
				<article>
					<h2><a href="#" rel="bookmark">전체게시판</a></h2>
					<blockquote>
						<table>
			            <%
							HashMap bbsInfoMap = (HashMap)application.getAttribute("bbsInfoMap");
							iterList = list.getAllRecentList(48).iterator();
							int i = 0;
							while (iterList.hasNext() && i < 40) {
						
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
							    i++;
						%>
			                <tr align="center">
						        <td>
						        	<div class="ellipsis" style="width: 50px;">
						        		<a href="<%=cPath%>/bbs?act=LIST&bbs=<%= one.getBbs() %>">
						        			<%= bbsInfo.getName() %></a></div>
						        </td>
						        <td>
						        	<div class="ellipsis" style="width: 170px;">
							            <a href="<%=cPath%>/seq/<%= one.getSeq() %>">
							            <%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
							            </a>
						            </div>
						        </td>
						        <td>
						        	<span>[<%= one.getMemo() %>]</span>
						        </td>
						        <td><div><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
						        <td><div><%
						    if (one.getId() != null) {
						        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
						        	alt="<%= one.getId() %>"
						        	style="width:14px;height:14px"
						        	onerror="this.src='<%=cPath%>/images/spacer.gif'"><%
						    }
						        	%></div></td>
						        <td title="<%= one.getWhen() %>">
						        <%= DateLabel.getTimeDiffLabel(one.getWhen()) %></td>
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
		</div><!-- #container-->

		<jsp:include page="left.jsp"></jsp:include>

		<jsp:include page="right.jsp"></jsp:include>
	
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

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