<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil" %>

<%
	String cPath  = request.getContextPath();

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" />

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
					<section>
					삭제되었습니다<br/><br/>
					<a href="javascript:location.href='/html5/bbs?act=LIST&bbs=<%= request.getParameter("bbs") %>'">목록으로</a>
					</section>
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
