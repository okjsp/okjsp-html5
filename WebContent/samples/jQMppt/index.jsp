<!DOCTYPE html>
<html lang="ko">
<head>
<%
//ContextPath
String cPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />  
<title>OKJSP_jQueryMobile</title>
<!-- 기본으로 들어가는 링크 _시작 -->
<link rel="stylesheet"  href="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.css" />
<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.js"></script>
<!-- 기본으로 들어가는 링크 _끝 -->

<!-- 사용자css_현재 상단 타이틀에만 적용 -->
<link rel="stylesheet" href="css/jqm-docs.css" />
</head>
<body>
	<!-- 화면 상단_제목 들어가는 부분_시작  -->
	<div data-role="page" data-theme="b" id="jqm-home">
		<div id="jqm-homeheader">
			<h1 id="jqm-logo">
				<img src="images/logo_blue.png" width="200" />
			</h1>
			<p id="font-two">[OKJSP] jQuery mobile framework 발표자료</p>
			<p id="font-two">해당 자료는 
				<a href="http://jquerymobile.com/demos/1.0a2/" target="_blank">http://jquerymobile.com/demos/1.0a2/</a>
				 를 기초로 작성하였습니다.</p>
		</div>
		<!-- 화면 상단_제목 들어가는 부분_끝  -->
	
		<!-- 개  요_시작 -->
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
				<li data-role="list-divider">개  요</li>
				<li><a href="docs/about/one.jsp">jQuery Mobile 이란 무엇인가?</a></li>
				<li><a href="docs/about/two.jsp">특징</a></li>
				<li><a href="docs/about/three.jsp">지원플랫폼</a></li>
				<li><a href="docs/about/four.jsp">Alpha Release Notes</a></li>
			</ul>
		</div>
		<!-- 개  요_끝 -->
		
		<!-- API_시작 -->
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
				<li data-role="list-divider">API</li>
				<li><a href="docs/api/one.jsp">기본 설정</a></li>
			</ul>
		</div>
		<!-- API_끝 -->
	</div>
</body>
</html>