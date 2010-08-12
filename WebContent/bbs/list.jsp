<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>    
<jsp:useBean id="one"  class="kr.pe.okjsp.Article" scope="request"/>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />
<jsp:setProperty name="list" property="*" />

<%
	String cPath  = request.getContextPath();
	String bbsids = request.getParameter("bbs");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script src="<%=cPath%>/js/prototype.js"></script>
<script type="text/javascript">
	function getList(bbs, pg) {
				
	    var myAjax = new Ajax.Request(
	        "/html5/bbs/list_result.jsp",
	        {method: 'get', parameters: "act=LIST&bbs="+bbs+"&keyfield=content&keyword&pg="+pg ,
		    onComplete: ajax_response}
	    );
	}
			
	function ajax_response(originalRequest) {
		var list = $('list');
		//var addlist = document.createElement('section');
		//addlist.innerHTML = originalRequest.responseText;
		//list.appendChild(addlist);
		list.innerHTML = originalRequest.responseText;
}		

	window.onload=getList('<%=bbsids%>', 0);

	function write() {
	    document.nav.act.value = "ADD";
	    document.nav.submit();
	}
		 
</script>
<title>OKJSP_HTML5</title>
</head>
<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include>
	<form name="nav">		
		<%
			String keyword = CommonUtil.nchk(request.getParameter("keyword"));
		%>
		<input type="hidden" name="keyword" value="<%= CommonUtil.a2k(keyword) %>">
		<input type="hidden" name="act"      value="LIST">
		<input type="hidden" name="bbs"      value="<%= request.getParameter("bbs") %>">
		<input type="hidden" name="seq">
	</form>
	<section>
		<div id="container">
			<div id="contentinner">
	   			<article>
	   			<!-- 메인 컨텐츠_시작======================================= -->
			      	<!-- Pagetitle -->
			        <h1> <%= bbsids %> </h1> 
			        <input type="button" class="button" value="글쓰기" />
			        <input type="button" class="button" value="글쓰기2" />
					<br></br>
			        
			        <h4><a href="javascript:write()">글쓰기</a> <a href="/html5/bbs/write.jsp">글쓰기2</a></h4> 
			
			        <div id='list'>
			        </div>
			    <!-- 메인 컨텐츠_끝========================================== -->
				</article>
			</div><!-- #content-->
		</div><!-- #container-->
		<jsp:include page="../main/left.jsp"></jsp:include>
	</section>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>
