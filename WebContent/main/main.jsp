<!DOCTYPE html>
<html lang="ko">
<%@ page errorPage="error.jsp"
    import="kr.pe.okjsp.*,
    	    kr.pe.okjsp.util.CommonUtil,
    	    kr.pe.okjsp.util.DateLabel,
            java.util.*,
            java.util.Iterator"
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
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="icon" type="image/x-icon" href="<%=cPath%>/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<script src="<%=cPath%>/js/prototype.js"></script>
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
				<article align="center">
					<a href="<%=cPath %>/f.jsp?http://www.devlec.com/?_pageVariable=OKJSP" target="_blank"> 
						<img src="http://www.okjsp.pe.kr/images/banner/devlec_473x98.gif" alt="▒▒▒ 데브렉 ▒▒▒ 개발자를 위한 국내 최고 프로그래밍 전문 동영상강좌 사이트"> 
					</a>
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
		        		<h2><a href="<%=cPath%>/bbs?act=LIST&bbs=<%= rec[0] %>"><%= rec[1] %></a></h2>
		        		<blockquote>
			          		<table>
			        		<%
			        		iterList = getCachedList(rec[0]);
			        		while (iterList.hasNext()) {
			        			one = (Article) iterList.next();
			        			%>
			        			<tr align="center">
			        			<%-- 
							        <td><%= one.getRef() %></td>
							    --%>
							        <td>
							        	<div class="ellipsis" style="width: 260px;">
								            <a href="<%=cPath%>/seq/<%= one.getSeq() %>" target="_blank">
								            	<%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
								            </a>
							            </div>
							        </td>
							        <td>
							        	<span><str:replace replace="[0]" with="">[<%= one.getMemo() %>]</str:replace></span>
							        </td>
							        <td><div class="ellipsis" style="width: 80px;"><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
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
			                <tr align="center">
						        <td>
						        	<div class="ellipsis" style="width: 70px;">
						        		<a href="<%=cPath%>/bbs?act=LIST&bbs=<%= one.getBbs() %>">
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
<script>
var maxseq = '<%=maxseq%>';
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
        //log(event.data);
        var dbmaxseq = event.data;
        //alert('maxseq:'+maxseq +',dbmaxseq'+dbmaxseq);
		if(maxseq < dbmaxseq){
			//1. db값이 클경우 : 추가(하면서 밑의 데이터를 삭제시켜야함)
			var myAjax = new Ajax.Request(
			        "/html5/main/main_event.jsp",
			        {method: 'get', parameters: "seq="+dbmaxseq ,
				    onComplete: ajax_response}
			    );
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