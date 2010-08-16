<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>    
<%
	String cPath  = request.getContextPath();
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
<title>OKJSP_HTML5</title>
</head>
<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include>
	<section>
		<div id="container">
			<div id="contentinner">
	   			<article> 
	   			<!-- 메인 컨텐츠_시작======================================= -->
					<h1>개인정보취급방침 및 회원가입약관</h1>
					<br/>
					<section>
						<h2>개인정보취급방침</h2>
						<br/>
						<jsp:include page="privacyPolicy.jsp" />
					</section>
					<section>
						<h2>회원가입약관</h2>
						<br/>
						<jsp:include page="agree.html" />
					</section>
					<section align="center">
						위 개인정보취급방침과 회원가입약관에 동의하십니까?
						<br/>
							<a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/form.jsp" id="forgotpsswd_2">
								<input type="button" id="forgotpsswd_2" class="button_two" value="동의합니다" />
							</a>
							<input type="button" class="button_two" value="동의하지않습니다" onClick="window.close()"/>
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
