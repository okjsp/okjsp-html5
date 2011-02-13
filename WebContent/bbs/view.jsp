<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>
<%@ page import="kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>               
<jsp:useBean id="one"  class="kr.pe.okjsp.Article" scope="request"/>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />
<%
	String cPath = request.getContextPath();
	String bbsids = request.getParameter("bbs");
	int memoCount = 0; // 뎃글 갯수 (SSE 에서 비교 값으로 사용)
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link rel="icon" type="image/x-icon" href="<%=cPath%>/images/favicon.ico" />
<script src="<%=cPath%>/js/okjsp.js"></script>
<script src="<%=cPath%>/js/okboard_view.js"></script>
<script src="<%=cPath%>/js/prototype.js"></script>
<title>OKJSP</title>
</head>

<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include> 
    <section>
    	<div id="container">
			<div id="contentinner">		        
        <article>
<h2><%=CommonUtil.showHtml(one.getSubject())%> 
<%-- Twitter 공식 트윗 버튼 --%>
<a href="//twitter.com/share" class="twitter-share-button"
	data-count="horizontal" data-via="okjsp"
	data-text="<%=CommonUtil.showHtml(one.getSubject())%>"> [Tweet]</a><script
	type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
</h2>
			<br/>
				<%
					if (one.getId() != null) {
				%><img src="http://www.okjsp.pe.kr/profile/<%=one.getId()%>.jpg"
				        	alt="<%=one.getId()%>"
				        	style="width:77px"
				        	onerror="this.src='/images/spacer.gif'"><%
					}
				%>
			<%=DateLabel.getTimeDiffLabel(one.getWhen())%> (<%=one.getWhen("yyyy-MM-dd HH:mm")%>), by <a href="<%=one.getHomepage()%>"><%=one.getWriter()%> </a>
          <p><%= one.getContentView() %></p>
          <p>| Posted by <a href="<%=one.getHomepage()%>"><%=one.getWriter()%> </a> | Categories: <a href="#"> <%=one.getBbs()%></a> | Read: <a href="#"><%=one.getRead()%></a> | CCL: <%=one.getCcl_name()%> </p>          
	<ul><%
          		ArrayList fileList = (ArrayList) request.getAttribute("arrdf");
          		if (fileList != null) {
          			Iterator file = fileList.iterator();
          			while (file.hasNext()) {
          				DownFile df = (DownFile) file.next();
          	%><li><a href="/html5/bbs?act=DOWN&maskname=<%=df.getMaskName()%>&fileName=<%=df.getFileName()%>"><%=df.getFileName()%>
	 <%=df.getFileSize()%> Bytes (<%=df.getDownload()%>)</a></li><%
	 	} // end while
	 	}
	 %>
	</ul>
	</article> 

	<div id="passwd_layer" style="position:absolute;display:none;width:220px;height:60px;padding:10px" align="center">
	<input type="password" id="passwd" name="passwd" maxlength="15">
	<br>
	<input type="button" class="button" id="submit_type" onclick="return submit_passwd()">
	<input type="button" class="button" value="취소" onclick="return toggleMenu('passwd_layer')">
     </div>
		
	
	
	<div  id="memoDiv">
		<section>
			<!--<input type="button" class="button" value="답변" onClick="goReply()"/> -->
	    	<input type="button" class="button_two" value="수정" onClick="show_passwd_layer('goModify')"/>
	    	&nbsp;
	     	<input type="button" class="button_two" value="삭 제" onClick="show_passwd_layer('goDelete')"/>
	     	&nbsp;
	     	<!--<input type="button" class="button" value="책갈피" onClick="goBookmark()"/> -->
	     	<input type="button" class="button_two" value="로컬저장" onClick="goBbsSaveWork()"/>
	     	&nbsp;
	     	<input type="button" class="button_two" value="로컬삭제" onClick="goBbsDeleteWork()"/>
		</section>
		<div id="result"></div>
	</div>
		<form name="f0" method="POST" onSubmit="return chk_memo(this)">
	    <input type="hidden" name="pact" value="MEMO">
	    <input type="hidden" name="seq" id="seq" value="<%= one.getSeq() %>">
	    <input type="hidden" name="pg" value="<%= list.getPg() %>">
	    <input type="hidden" name="keyfield" value="<%=  CommonUtil.nchk(request.getParameter("keyfield"),"content")  %>">
	    <input type="hidden" name="keyword" value="<%=  CommonUtil.nchk(request.getParameter("keyword"))  %>">
	    <input type="hidden" name="bbs" value="<%= one.getBbs() %>">
	    <input type="hidden" name="viewstamp" value="<%= System.currentTimeMillis() %>">		
	      <textarea name="bcomment" id="note"></textarea>
	        id:<input type="text" name="writer" class="field"
	            maxlength="50" value="<%=CommonUtil.a2k(CommonUtil.getCookie(request, "okwriter"))%>">
	        &nbsp;&nbsp;&nbsp;
	        pw:<input type="password" name="memopass" maxlength="15" class="field">
	        &nbsp;&nbsp;&nbsp;
	        <input type="submit" name="send" value="Memo" class="button_two">
		    <input type="hidden" name="doublecheck" class="memodc" value="okjsp">
		    <div style="color:#f00;font-size:12px ">IP 노출됩니다. 예민한 얘기는 올리지 않으시는 게 사이트 운영에 도움이 됩니다.
		    <br />개조심할 필요는 있으니까요. 낮말은 새, 밤말은 쥐, 인터넷말은 검색엔진</div>
	        <br />
		</form>		
	</div></div>
	<form name="f1">
    <input type="hidden" name="act" value="LIST">
    <input type="hidden" name="bbs" value="<%=one.getBbs()%>">
    <input type="hidden" name="seq" value="<%=one.getSeq()%>">
    <input type="hidden" name="pg" value="<%=list.getPg()%>">
    <input type="hidden" name="keyfield" value=""> 
    <input type="hidden" name="keyword" value="<%=CommonUtil.nchk(request.getParameter("keyword"))%>">
    <input type="hidden" name="pact" value="">
    <input type="hidden" name="password" value="">
</form>
	
	<jsp:include page="../main/left.jsp"></jsp:include>
</section>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
<!-- hidden navigation form -->
</body>

<%-- ############################################################## --%>
<%-- ############             실시간 댓글 시작                             ############ --%>
<%-- ############################################################## --%>
<script>

	var currentMemoCount = <%=memoCount%>;

	function startSSE() {
	    switch(detectUAgent()) {
	        case "opera":
	            // opera 지원은 추후에...
	            break;
	        case "webkit":
	            webkitEventSource();
	            break;
	    }
	}
	
	/**
	 * Detects which sort of SSE support to apply if to apply it at all
	 * @return user agent type
	 */
	var detectUAgent = function() {
	    if (navigator.appName == "Opera" && -1 !== navigator.appVersion.indexOf("9.")) {
	        //log("Opera browser detected. " + INIT_MESSAGE);
	        return 'opera';
	    } else
	    if (-1 !== navigator.appVersion.indexOf("AppleWebKit/5")) // WebKit5 이상인 경우
		{	
			if( -1 !== navigator.appVersion.indexOf("Chrome/5") )	// Chrome5 버젼은 Server-Sent Events 지원하지 않아 막아 둡니다. (Chrome6 은 SSE 지원 합니다.)
			{
			    var myAjax = new Ajax.Request(	// 댓글 가져오는 로직
				        "/html5/bbs/viewMemo.jsp",
				        {method: 'get', parameters: "seq=<%=one.getSeq()%>&startCount="+currentMemoCount ,
					    onComplete: ajax_response}
				    );
			} else {	// Chrome6 , Safari5
				return 'webkit';
			}
	    } else
	    if (navigator.appName == "Netscape" && -1 !== navigator.appVersion.indexOf("5.0")) {
	        //log("Your browser does not support SSE yet natively, but you can see here emulation. " + INIT_MESSAGE);
	        return 'webkit';
	    } else
	    if (undefined !== window['EventSource']) {
	        //log("I'm not sure about your browser, but let's try. " + INIT_MESSAGE);
	        return 'webkit';
	    }  else {	// IE 인 경우.
		    var myAjax = new Ajax.Request(	// 댓글 가져오는 로직
			        "/html5/bbs/viewMemo.jsp",
			        {method: 'get', parameters: "seq=<%=one.getSeq()%>&startCount="+currentMemoCount ,
				    onComplete: ajax_response}
			    );
	        //log(FAIL_MESSAGE);
	        return false;
	    }
	};
	
	/**
	 * Init event source in WebKit fashion
	 */
	var webkitEventSource = function() {
		var eventSrc = new EventSource('/html5/sse?seq=<%=one.getSeq()%>');
		eventSrc.addEventListener('message', onMessageHandler);
	}
	
	/**
	 * Event handler for upcomming server-sent messages
	 * @param (event) event
	 * @event
	 */
	var onMessageHandler = function (event) {
			var newMemoCount = event.data;

			if( currentMemoCount < newMemoCount ) {
			    var myAjax = new Ajax.Request(
				        "/html5/bbs/viewMemo.jsp",
				        {method: 'get', parameters: "seq=<%=one.getSeq()%>&startCount="+currentMemoCount ,
					    onComplete: ajax_response}
				    );
			}
			
		    currentMemoCount = newMemoCount;
	};

	function ajax_response(originalRequest) {

		var list = $('memoDiv');
		var addlist = document.createElement('section');
		addlist.innerHTML = originalRequest.responseText; 

		if( originalRequest.responseText.length > 100 ) {	// 100bytes 미만이면, 댓글이 없는 것으로 간주하고 'section'을 추가 하지 않는다. (빈 Section 추가 방지를 위함)
			list.appendChild(addlist);
		}
	}

	// 실시간 댓글기능 Start. 
	startSSE();
	<%-- ############################################################## --%>
	<%-- ############             실시간 댓글 끝                             ############ --%>
	<%-- ############################################################## --%>


	//worker에서 생성시킨 db는 jsp파일에 있는 db와 호환되지 않는 문제로
	//같이 worker에서 구동시켜아 함..
	var worker = new Worker("<%=cPath%>/bbs/worker.js");
	//web worker사용하여 webdb에 저장
	function goBbsSaveWork(){
		worker.postMessage({'seq': '<%=one.getSeq()%>'
			, 'bbs': '<%=one.getBbs()%>'
			, 'writer': '<%=one.getWriter()%>'
			, 'subject': '<%=one.getSubject()%>'
			, 'when': '<%=one.getWhen("yyyy-MM-dd")%>'
			, 'content': '<%=one.getContentView2()%>'
			, 'type': 'insert'}); // Send data to our worker.
		worker.addEventListener('message', function(e) {
		    document.getElementById('result').textContent = e.data;
		}, false);
	}

	function goBbsDeleteWork(){
		worker.postMessage({'seq': '<%=one.getSeq()%>'
			, 'bbs': '<%=one.getBbs()%>'
			, 'writer': '<%=one.getWriter()%>'
			, 'subject': '<%=one.getSubject()%>'
			, 'when': '<%=one.getWhen("yyyy-MM-dd")%>'
			, 'content': '<%=one.getContentView2()%>'
			, 'type': 'delete'}); // Send data to our worker.
		worker.addEventListener('message', function(e) {
		    document.getElementById('result').textContent = e.data;
		}, false);
	}
	
</script>


</html>
