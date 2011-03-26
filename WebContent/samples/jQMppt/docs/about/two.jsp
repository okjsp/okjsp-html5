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
		<h1>Native apps vs Web Apps vs Hybrid Apps</h1>
	</div><!-- /header -->

	<div data-role="content">
		<ul>
			<li class="font-one">
				<a href="http://blog.vimviv.com/web-apps/native-apps-web-apps-hybrid-apps/" target="_blank" >
					Native apps vs Web Apps vs Hybrid Apps </a>
				<img src="<%=cPath %>/samples/jQMppt/docs/about/icon18_wrench_allbkg.png" 
					alt="icon designs" style="max-width:100%; margin-top:20px;" onClick="doControl('control_bb')">
			</li>
		</ul>
		<div id="control_bb" style="display:none">
			<ul>
				<li class="font-one">
					Native apps :
					<ul> 
						<li>하드웨어 기능을 충분히 활용할수 있다.</li> 
						<li>응용프로그램을 판매할수 있다.</li>
						<li>각각의 플랫폼에 맞는 개발 언어등을 습득해야 한다.</li>
						<li>그로 인한 유지보수의 문제.</li>
					</ul>
				</li>
				<li class="font-one">
					Web Apps : 
					<ul> 
						<li>개발의 편의성.</li> 
						<li>그로 인한 유지보수도 쉽다.</li>
						<li>디바이스 API에 대한 활용이 불가능.</li>
						<li>어플리케이션 판매가 불가능.</li>
					</ul>
				</li>
				<li class="font-one">
					Hybrid Apps : 
					<ul> 
						<li>웹기반!!!</li> 
						<li>개발도, 유지보수도 쉽다.</li>
						<li>디바이스 API의 활용이 가능.</li>
						<li>각각의 플랫폼을 고민할 필요가 없다</li>
					</ul>
				</li>
			
			</ul>
		</div>
		<br>
		<p class="font-one">결론은??? 
			<img src="<%=cPath %>/samples/jQMppt/docs/about/icon18_wrench_allbkg.png" alt="icon designs" style="max-width:100%; margin-top:20px;" onClick="doControl('control_aa')"> </p>
		<div id="control_aa" style="display:none">
		<p class="font-one">1. Device API를 지원하느냐?</p>
		<p class="font-one">2. 유지보수는?</p>
		<p class="font-one">2. 팔수 있느냐???</p>	
		</div>					
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>