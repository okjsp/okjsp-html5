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
		<h1>Rhodes</h1>
	</div><!-- /header -->

	<div data-role="content">
		<img src="<%=cPath %>/samples/jQMppt/docs/api/rho.png" alt="rho" style="max-width:100%; margin-top:20px;">
		<img src="<%=cPath %>/samples/jQMppt/docs/api/rho_2.png" alt="rho_2" style="max-width:100%; margin-top:20px;">
		<ul>
			<li class="font-one"><a href="http://rhomobile.com/" target="_blank">Rhodes</a></li>
			<li class="font-one"><a href="http://docs.rhomobile.com/" target="_blank">Document</a></li>
			<li class="font-one">Open Source License : 
				<a href="http://opensource.org/licenses/mit-license" target="_blank">MIT</a>
			</li>
			
			<li class="font-one">Rhodes : 개발</li>
			<li class="font-one">RhoSync : Enterprise Application Data를 사용할수 있게 해주는 모바일 동기화 서버. 
				해당정보는 사용자의 로컬장치에 저장되고, 연결이 끊긴경우 사용이 가능함.
			</li>
			<li class="font-one">RhoGallery : 어플리케이션과 데이터를 관리하는 모바일 어플리케이션 관리 솔루션 호스팅</li>
			<li class="font-one">
				<a href="http://www.rhohub.com/" target="_blank">RhoHub</a> : 로컬 SDK를 설치하지 않고 온라인으로 작성. 
					협업 개발을 가능하게 함. RhoSync 서버를 호스팅 제공</li>				
			<li class="font-one">free</li>
			<li class="font-one">Framework target : Embedded applications</li>
			<li class="font-one">개발언어 : HTML, Javascript, Ruby</li>
			<li class="font-one">지원플랫폼 : iOS, Android, BlackBerry, Symbian, Windows Mobile 
			</li>			
		</ul>
	
	
	
	
	

		
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>