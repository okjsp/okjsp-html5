<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>    
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />
<jsp:setProperty name="list" property="*" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
    response.setContentType("text/html");

	Iterator iter = list.getList().iterator();
	Article one = null;
%>
<%@page import="kr.pe.okjsp.ArticleDao"%>
<%
	String cPath  = request.getContextPath();
	String bbsids = request.getParameter("bbs");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		    onComplete: list_response}
	    );
	}
			
	function list_response(originalRequest) {
		var list = $('list');
		var addlist = document.createElement('section');
		addlist.innerHTML = originalRequest.responseText;
		list.appendChild(addlist);
		//list.innerHTML = originalRequest.responseText; 
	}		

	function writeArticle() {
	    document.nav.act.value = "ADD";
	    document.nav.submit();
	}

	function getMemo(bbs) {

	    var myAjax = new Ajax.Request(
			        "/html5/bbs/viewMemo.jsp",
			        {method: 'get', parameters: "seq="+bbs ,
				    onComplete: memo_response }
			    );

	}

	function memo_response(originalRequest) {

		alert ( originalRequest.responseText ) ; 
	}		

	window.onload=getList('<%=bbsids%>', 0);
	
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
<%
	Map map = (Map)application.getAttribute("bbsInfoMap");
	BbsInfoBean bib = (BbsInfoBean)(map.get(bbsids));
%>      	
			        <h1><%= bib.getName() %> [<%=list.getCnt() %>]</h1> 
			        <br/>
			        <h3><%= bib.getHeader() %></h3>
			        <input type="button" class="button" value="글쓰기" onClick="writeArticle()"/>
			        <br/><br/>
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
