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
<link rel="stylesheet"  href="http://code.jquery.com/mobile/1.0a2/jquery.mobile-1.0a2.min.css" />
<script src="http://code.jquery.com/jquery-1.4.3.min.js"></script>
<!-- 사용자 스크립트 : 위치 중요~ -->
<script src="js/custom-scripting.js"></script>
<script src="http://code.jquery.com/mobile/1.0a2/jquery.mobile-1.0a2.min.js"></script>
<!-- 기본으로 들어가는 링크 _끝 -->

<!-- 사용자css_현재 상단 타이틀에만 적용 -->
<link rel="stylesheet" href="css/jqm-docs.css" />
<script>
function doControl(val){
	if(document.getElementById(val).style.display == 'none' ){
		document.getElementById(val).style.display = "block" ;
	}else{
		document.getElementById(val).style.display = "none" ;
	}
}

</script>
</head>
<body>
	<!-- 화면 상단_제목 들어가는 부분_시작  -->
	<div data-role="page" data-theme="b" id="jqm-home">
		<div id="jqm-homeheader">
			<h1 id="jqm-logo">
				<img src="images/logo_blue.png" width="200" />
			</h1>
			<p class="font-two" id="maintitle">[OKJSP] hybrid Application 발표자료</p>
		</div>
		<!-- 화면 상단_제목 들어가는 부분_끝  -->
	
		<!-- 개  요_시작 -->
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
				<li data-role="list-divider">개요 </li>
				<li><a href="docs/about/one.jsp">What?</a></li>
				<li><a href="docs/about/two.jsp">Native apps vs Web apps vs Hybrid apps</a></li>
				<li><a href="docs/about/three.jsp">현황</a></li>
			</ul>
		</div>
		<!-- 개  요_끝 -->
		
		<!-- API_시작 -->
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
				<li data-role="list-divider">종류</li>
				<li><a href="docs/api/phonegap.jsp">Phone Gap</a></li>
				<li><a href="docs/api/titanium.jsp">Appcelerator Titanium</a></li>
				<li><a href="docs/api/rhodes.jsp">Rhodes</a></li>
				<li><a href="docs/api/appspresso.jsp">Appspresso</a></li>
			</ul>
		</div>
		<!-- API_끝 -->
		<%-- 
		<!-- API_시작 -->
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
				<li data-role="list-divider">마침</li>
				<li><a href="docs/end.jsp">마치면서</a></li>
			</ul>
		</div>
		--%>
		<!-- API_끝 -->
	</div>
</body>
</html>