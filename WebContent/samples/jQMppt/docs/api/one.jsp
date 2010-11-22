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
		<h1>기본 설정</h1>
	</div><!-- /header -->

	<div data-role="content">
		<p class="font-one">The mobileinit event</p>
		<pre class="font-two">
<code>
$(document).bind("mobileinit", function(){	
			//apply overrides here	
});	
</code>
		</pre>
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>