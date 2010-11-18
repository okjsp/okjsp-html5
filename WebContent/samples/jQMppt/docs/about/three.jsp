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
		<p id="font-one">Apple iOS: iPhone, iPod Touch, iPad (all versions)</p>
		<p id="font-one">Android: all devices (all versions)</p>
		<p id="font-one">Blackberry Torch (version 6)</p>
		<p id="font-one">Palm WebOS Pre, Pixi</p>
		<p id="font-one">Nokia N900 (in progress)</p>

		<p id="font-two">Older versions of Blackberry, Nokia/Symbian, and Windows Mobile : 디버깅중 </p>
		<p id="font-two">Windows Mobile 7, bada, or MeeGo : 향후 지원 예정</p>
		<p id="font-two">Firefox, Chrome, Safari, Internet Explorer, Opera, etc. : jQuery core 내장</p>
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>