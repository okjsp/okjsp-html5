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
		<h1>features</h1>
	</div><!-- /header -->

	<div data-role="content">
		<p class="font-one"><a href="http://blog.vimviv.com/web-apps/native-apps-web-apps-hybrid-apps/" target="_blank" >
		Native apps vs Web Apps vs Hybrid Apps </a> </p>
		<br>
		<p class="font-one">결론은??? 
			<img src="<%=cPath %>/samples/jQMppt/docs/about/icon18_wrench_allbkg.png" alt="hybrid designs" style="max-width:100%; margin-top:20px;" onClick="doControl('control_aa')"> </p>
		<div id="control_aa" style="display:none">
		<p class="font-one">1. Device API를 지원하느냐?</p>
		<p class="font-one">2. 팔수 있느냐???</p>	
		</div>					
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>