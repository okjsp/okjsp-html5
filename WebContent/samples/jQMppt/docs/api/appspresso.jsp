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
		<h1>Appspresso</h1>
	</div><!-- /header -->

	<div data-role="content">
		<img src="<%=cPath %>/samples/jQMppt/docs/api/apps.png" alt="rho" style="max-width:100%; margin-top:20px;">
		<ul>
			<li class="font-one"><a href="http://www.appspresso.com/appdev/appMain.do" target="_blank">Appspresso</a></li>
			<li class="font-one"><a href="http://www.appspresso.com/appdev/doc/doc.html" target="_blank">Document</a></li>
			<li class="font-one"><a href="http://www.appspresso.com/appdev/doc/api.html" target="_blank">API</a></li>
			<li class="font-one">KTH에서 만든 하이브리드 어플 개발 프레임웍</li>
			<li class="font-one">개발언어 : HTML5, Javascript
				<img src="<%=cPath %>/samples/jQMppt/docs/about/icon18_wrench_allbkg.png" 
					alt="icon designs" style="max-width:100%; margin-top:20px;" onClick="doControl('control_cc')">
				<div id="control_cc" style="display:none">
				(jQTouch , SenchaTouch, jQueryMobile , <a href="http://joapp.com/" target="_blank">Joapp</a> 
				과 같은 <br/>다양한 터치 UI Framework 들을 지원)
				</div>
			</li>
			<li class="font-one">지원플랫폼 : 아이폰, 아이패드, 안드로이드폰, 안드로이드타블렛
			</li>			
		</ul>
	
	
	
	
	

		
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>