<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//ContextPath
String cPath = request.getContextPath();
%> 
 
<html lang="ko" manifest="/html5/bbs/cache.manifest">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="chrome=1" />
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" />
<title>OKJSP_HTML5</title>
</head>

<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include>
	<section>
		<div id="container">
			<div id="contentinner">
	   			<article> 
	   			<!-- 메인 컨텐츠_시작======================================= -->
	   			<section>
					<h1>로컬 저장 게시판</h1>
					<br/>
					The network is: <span id="indicator">(state unknown)</span>
					<br/>
					<script>
					window.applicationCache.addEventListener('updateready', function() {
						window.applicationCache.swapCache();
					}, false);
					var err_type = '';
					var err_msg = '';
					window.applicationCache.addEventListener('error', function(e) {
						//alert(e.message);
						err_type = 'error';
						err_msg = e.message;
					}, false);
					if(err_type == ''){
						var worker = new Worker("<%=cPath%>/bbs/worker2.js");
						worker.postMessage({'seq': ''
							, 'type': ''});
						worker.addEventListener('message', function(e) {
							if(e.data == 'DELETE'){
								top.location.href = '<%=cPath%>/bbs/localList.jsp';
							}else{
								document.getElementById('result').innerHTML = decodeURI(e.data);
							}
						    
						}, false);
						worker.addEventListener('error', function(e) {
						    document.getElementById('result').innerHTML = '[database]error : [Line : ' + e.lineno + ']'
					         '[in : ' + e.filename + ']' + '[' + e.message + ']' ;
						}, false);
					}else{
						document.getElementById('result').innerHTML = '[cache error]'+err_msg;
					}
					
					</script>
					<div id="result"></div>
				</section>
				<!-- 메인 컨텐츠_끝========================================== -->
				</article>
			</div><!-- #content-->
		</div><!-- #container--> 
		<jsp:include page="../main/left.jsp"></jsp:include>
	</section>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
<script>
function doDelete(tmp){
	//var worker2 = new Worker("<%=cPath%>/bbs/worker.js");
	worker.postMessage({'seq': tmp
		, 'type': 'delete'}); // Send data to our worker.

}

document.getElementById('indicator').innerHTML = 
	window.navigator.onLine ? 'online' : 'offline';
</script>
</body>
</html>