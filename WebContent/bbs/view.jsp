<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>
<%@ page import="kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>               
<jsp:useBean id="one"  class="kr.pe.okjsp.Article" scope="request"/>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />
<%
	String cPath  = request.getContextPath();
	String bbsids = request.getParameter("bbs");
	int memoCount = 0; 	// 뎃글 갯수 (SSE 에서 비교 값으로 사용)
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
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
	        <h2><%= CommonUtil.showHtml(one.getSubject()) %></h2>
			<br/>
				<%
				    if (one.getId() != null) {
				        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
				        	alt="<%= one.getId() %>"
				        	style="width:77px"
				        	onerror="this.src='/images/spacer.gif'"><%
				    }
				%>
			<%= DateLabel.getTimeDiffLabel(one.getWhen()) %> (<%= one.getWhen("yyyy-MM-dd HH:mm") %>), by <a href="<%= one.getHomepage() %>"><%= one.getWriter() %> </a>
          <p><%=  one.getContentView()  %></p>
          <p>| Posted by <a href="<%= one.getHomepage() %>"><%= one.getWriter() %> </a> | Categories: <a href="#"> <%= one.getBbs() %></a> | Read: <a href="#"><%= one.getRead() %></a> | CCL: <%= one.getCcl_id() %> </p>          
	<ul><%
	  ArrayList fileList = (ArrayList) request.getAttribute("arrdf");
	  if (fileList != null) {
	    Iterator file = fileList.iterator();
	    while (file.hasNext()) {
	      DownFile df = (DownFile)file.next();
	%><li><a href="/html5/bbs?act=DOWN&maskname=<%= df.getMaskName() %>&fileName=<%= df.getFileName() %>"><%= df.getFileName() %>
	 <%= df.getFileSize() %> Bytes (<%=df.getDownload()%>)</a></li><%
	    } // end while
	  }
	%>
	</ul>
	</article> 
	    <!--<input type="button" class="button" value="답변" onClick="goReply()"/> -->
    	<input type="button" class="button" value="수정" onClick="show_passwd_layer('goModify')"/>
     	<input type="button" class="button" value="삭제" onClick="show_passwd_layer('goDelete')"/>
     	<input type="button" class="button" value="책갈피" onClick="goBookmark()"/>
	<div id="passwd_layer" style="position:absolute;display:none;width:220px;height:60px;padding:10px" align="center">
	<input type="password" id="passwd" name="passwd" maxlength="15">
	<br>
	<input type="button" class="button" id="submit_type" onclick="return submit_passwd()">
	<input type="button" class="button" value="취소" onclick="return toggleMenu('passwd_layer')">
     </div>
		
	
	
	<div  id="memoDiv">
	</div>
		<form name="f0" method="POST" onSubmit="return chk_memo(this)">
	    <input type="hidden" name="pact" value="MEMO">
	    <input type="hidden" name="seq" value="<%= one.getSeq() %>">
	    <input type="hidden" name="pg" value="<%= list.getPg() %>">
	    <input type="hidden" name="keyfield" value="<%=  CommonUtil.nchk(request.getParameter("keyfield"),"content")  %>">
	    <input type="hidden" name="keyword" value="<%=  CommonUtil.nchk(request.getParameter("keyword"))  %>">
	    <input type="hidden" name="bbs" value="<%= one.getBbs() %>">
	    <input type="hidden" name="viewstamp" value="<%= System.currentTimeMillis() %>">
		
	      <textarea name="bcomment" style="width:100%;height:80px" id="note"></textarea>
	        id:<input type="text" class="memoid" name="writer"
	            maxlength="50" value="<%= CommonUtil.a2k(CommonUtil.getCookie(request, "okwriter")) %>">
	        pw:<input type="password" class="memopw" name="memopass" maxlength="15">
		    <input type="hidden" name="doublecheck" class="memodc" value="okjsp">
		    <br /><span style="color:#f00">IP 노출됩니다. 예민한 얘기는 올리지 않으시는 게 사이트 운영에 도움이 됩니다.
		    <br />개조심할 필요는 있으니까요. 낮말은 새, 밤말은 쥐, 인터넷말은 검색엔진</span>
	        <br /><input type="submit" name="send" value="Memo">
		</form>		
	</div></div>
	<form name="f1">
    <input type="hidden" name="act" value="LIST">
    <input type="hidden" name="bbs" value="<%= one.getBbs() %>">
    <input type="hidden" name="seq" value="<%= one.getSeq() %>">
    <input type="hidden" name="pg" value="<%= list.getPg() %>">
    <input type="hidden" name="keyfield" value=""> 
    <input type="hidden" name="keyword" value="<%= CommonUtil.nchk(request.getParameter("keyword")) %>">
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
<script type="text/javascript">

	var currentMemoCount = <%= memoCount %>;

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

/*

			if( currentMemoCount < newMemoCount )
				alert( currentMemoCount +": DIFF :" + newMemoCount );
			else
				alert( currentMemoCount +": ==== :" + newMemoCount );
*/
			
	    document.getElementById("note").innerHTML = event.data + ">>>>>" + <%= memoCount %>
	};

	function ajax_response(originalRequest) {

		var list = $('memoDiv');
		var addlist = document.createElement('section');
		addlist.innerHTML = originalRequest.responseText;
		list.appendChild(addlist);
	}

	// 실시간 댓글기능 Start. 
	startSSE();
</script>
<%-- ############################################################## --%>
<%-- ############             실시간 댓글 끝                             ############ --%>
<%-- ############################################################## --%>


</html>
