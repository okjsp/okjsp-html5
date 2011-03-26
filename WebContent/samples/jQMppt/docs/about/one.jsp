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
		<h1>What?</h1>
	</div><!-- /header -->

	<div data-role="content">
		<ul>
			<li class="font-one">cross platform</li>
			<li class="font-one">mobile development</li>
			<li class="font-one">Multiple phone web-based application framework</li>
			<li class="font-one">HTML5/CSS/Javascript/XML 등의 웹기술을 기본으로 하여 
				<br/>어플리케이션의 형태와 기본UI를 만들고 
				<br/>단말기 내의 내부 API를 
				<br/>직접 호출하여 사용하게 해주는 써드파티 오픈소스 패키징툴</li>
			<img src="<%=cPath %>/samples/jQMppt/docs/about/hybrid.png" alt="hybrid designs" style="max-width:100%; margin-top:20px;">
		<li class="font-one"><a href="http://bit.ly/fEA6Gl" target="_blank" > 하이브리드앱을 아시나요(기사)</a></li>
		</ul>			
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>
