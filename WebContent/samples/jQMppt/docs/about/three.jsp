<!DOCTYPE html> 
<html> 
<head>
<%
//ContextPath
String cPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OKJSP_jQueryMobile</title>
</head> 
<body> 

<div data-role="page">

	<div data-role="header">
		<h1>Supported platforms</h1>
	</div><!-- /header -->

	<div data-role="content">
		<p class="font-one">Apple iOS: iPhone, iPod Touch, iPad (all versions)</p>
		<p class="font-one">Android: all devices (all versions)</p>
		<p class="font-one">Blackberry Torch (version 6)</p>
		<p class="font-one">Palm WebOS Pre, Pixi</p>
		<p class="font-one">Nokia N900 (in progress)</p>

		<p class="font-two">Older versions of Blackberry, Nokia/Symbian, and Windows Mobile : 디버깅중 </p>
		<p class="font-two">Windows Mobile 7, bada, or MeeGo : 향후 지원 예정</p>
		<p class="font-two">Firefox, Chrome, Safari, Internet Explorer, Opera, etc. : jQuery core 내장</p>

		<a href="http://jquerymobile.com/gbs/" target="_blank">
			View supported browser matrix on jQuery Mobile</a>
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>