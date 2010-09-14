<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>    
<%
	String cPath  = request.getContextPath();
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<title>OKJSP_HTML5</title>
</head>
<body>
<div id="wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<div id="container">
			<div id="contentinner">
	   			<article> 
	   			<!-- 메인 컨텐츠_시작======================================= -->
	   				<section>
					<h1>사이트 안내</h1>
					<br/>
					1. 해당 사이트는 크롬 6.0에 최적화 되어 있습니다. <br/> 
					   퀘적한 사이트 서핑을 위해서 크롬, 사파리, WebKit 등의 설치를 권장합니다. <br/>
					 WebKit : <a href="http://webkit.org/">http://webkit.org/</a> <br/>
					 구글크롬 : <a href="http://www.google.com/chrome/">http://www.google.com/chrome/</a> <br/>
					 사파리 : <a href="http://www.apple.com/safari/download/">http://www.apple.com/safari/download/</a>
					<br/><br/>
					2. 익스 플로러 사용자는 크롬프레임 설치를 권장합니다. <br/>
					<a href="http://code.google.com/intl/ko-KR/chrome/chromeframe/">http://code.google.com/intl/ko-KR/chrome/chromeframe/</a>
					<br/><br/>
					3. 해당 사이트에서 사용한 HTML5 관련 스킬목록입니다. 참고 바랍니다.<br/>
					
					
					
					
					</section>
			    <!-- 메인 컨텐츠_끝========================================== -->
				</article>
			</div><!-- #content-->
		</div><!-- #container--> 
		<jsp:include page="left.jsp"></jsp:include>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>
