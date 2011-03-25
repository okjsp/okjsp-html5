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
		<h1>Appcelerator Titanium</h1>
	</div><!-- /header -->

	<div data-role="content">
		<img src="<%=cPath %>/samples/jQMppt/docs/api/Ti.png" alt="titabium" style="max-width:100%; margin-top:20px;">
		<ul>
			<li class="font-one"><a href="http://www.appcelerator.com/" target="_blank">Titanium</a></li>
			<li class="font-one"><a href="http://developer.appcelerator.com/" target="_blank">Developer Center</a></li>
			<li class="font-one"><a href="http://developer.appcelerator.com/documentation" target="_blank">Document</a></li>
			<li class="font-one">Open Source License : 
				<a href="http://opensource.org/licenses/apache2.0" target="_blank">Apache Public License v2, Proprietary</a>
			</li>
			<li class="font-one">free</li>
			<li class="font-one">Framework target : Embedded applications</li>
			<li class="font-one">개발언어 : HTML, Javascript, [PHP, Ruby & Python for Desktop apps]</li>
			<li class="font-one">지원플랫폼 : iOS, Android, BlackBerry(지원예정),other(Windows, Linux & Mac)
				<img src="<%=cPath %>/samples/jQMppt/docs/about/icon18_wrench_allbkg.png" 
					alt="icon designs" style="max-width:100%; margin-top:20px;" onClick="doControl('control_cc')">
				<div id="control_cc" style="display:none">
				==> 모바일 부터 데스크탑 까지 호환될수 있는 app의 개발이 가능<br/>
				<img src="<%=cPath %>/samples/jQMppt/docs/api/Ti_2.png" alt="titabium_2" style="max-width:100%; margin-top:20px;">
				</div>
			</li>
		</ul>
	
	
	
	
	

		
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>