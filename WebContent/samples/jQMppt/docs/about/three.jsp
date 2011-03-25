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
		<ul>
			<li class="font-one"><a 
				href="http://en.wikipedia.org/wiki/Multiple_phone_web_based_application_framework" 
				target="_blank" >Wiki</a>
				<ul>
					<li>PhoneGap</li>
					<li>WorkLight</li>
					<li>QuickConnectFamily framework</li>
					<li>Big5Apps (단종)</li>
					<li>Rhodes</li>
					<li>Appcelerator Titanium</li>
					<li>MobileReflex</li>
					<li>iPFaces</li>
					<li>MoSync</li>
					<li>moppr</li>
					<li>Jmango</li>
					<li>Eclipse Pulsar</li>
					<li>mobl</li>
				</ul>
			</li>
			<li class="font-one">
				<a href="http://www.appspresso.com/appdev/appMain.do" target="_blank">앱스프레소</a>
			</li>
		</ul>
		
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>