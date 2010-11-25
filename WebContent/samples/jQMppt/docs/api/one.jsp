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
	
	
		<p class="font-one">화면기본설정</p>
		<pre class="font-two">
<code>
&#60;link rel="stylesheet"  href="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.css" /&#62;
&#60;script src="http://code.jquery.com/jquery-1.4.3.min.js"&#62;&#60;/script&#62;
&#60;script src="http://code.jquery.com/mobile/1.0a1/jquery.mobile-1.0a1.min.js"&#62;&#60;/script&#62;
</code>
		</pre>
	
	
		<p class="font-one">The mobileinit event</p>
		
		<pre class="font-two">
<code>
$(document).bind(<strong>"mobileinit"</strong>, function(){	
	//apply overrides here	
});	
</code>

<code>
기본값 구성시 사용(스크립트 파일을 별도로 분리 시켜 작성을 권고)
&#60;script src="jquery.js"&#62;&#60;/script&#62;
<strong>&#60;script src="custom-scripting.js"&#62;&#60;/script&#62;</strong>
&#60;script src="jquery-mobile.js"&#62;&#60;/script&#62;
</code>

<code>
$.mobile object를 이용하여 extend 시켜 사용	
$(document).bind("mobileinit", function(){
  $.extend(  $.mobile , {
    <strong>foo: bar</strong>
  });
});
</code>	

<code>
또는 개별적으로도 설정 가능
$(document).live("mobileinit", function(){
  <strong>$.mobile.foo = bar;</strong>
});
</code>	
<a href="http://www.okjsp.pe.kr/html5/samples/jQMppt/js/custom-scripting.js" target="_blank">소스보기</a>
		</pre>
		
	</div><!-- /content -->
	
</div><!-- /page -->

</body>
</html>