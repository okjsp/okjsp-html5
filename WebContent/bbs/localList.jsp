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
					  var db;
					  db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 2 * 1024 * 1024);
					  db.transaction(function(tx) {
						  tx.executeSql('CREATE TABLE IF NOT EXISTS okboard (bbsid text, seq numeric, writer text, subject text, wtime text, content text)',
								  [],
								  function(){document.getElementById('result').innerHTML='CREATE TABLE SUCCESS..';},
								  function(e){document.getElementById('result').innerHTML='CREATE TABLE ERROR:'+e.message;});
						  tx.executeSql("SELECT * FROM okboard", [], function(tx, result) {
							  if(result.rows.length == 0){
								  document.getElementById('result').innerHTML='데이터가 없습니다.';
							  }else{
								  var tmp = '';
								  for (var i = (result.rows.length-1), item = null; i >= 0; i--) {
									  item = result.rows.item(i);
									  
									  tmp += '<section><article>';

									  tmp += '<h4>';
									  tmp += ((i+1) + ' ' + item['subject']);
									  tmp += '</h4>';

									  tmp += '<h3>';
									  tmp += (item['wtime'] + ', by ' + item['writer']);
									  tmp += '</h3>';

									  tmp += '<a onClick="document.getElementById(\'contents_'+item['seq']+'\').style.display=\'block\';" style="cursor:pointer">내용보기...</a>';
									  tmp += '&nbsp;&nbsp;&nbsp;';
									  tmp += '<a onClick="document.getElementById(\'contents_'+item['seq']+'\').style.display=\'none\';" style="cursor:pointer">내용닫기...</a>';
									  tmp += '&nbsp;&nbsp;&nbsp;';
									  tmp += '<a onClick="javascript:doDelete('+item['seq']+')" style="cursor:pointer">삭제</a>';
									  tmp += ('<div id="contents_'+item['seq']+'" style="display:none">');

									  tmp += '<p><section>';
									  tmp += item['content'];
									  tmp += '</section></p>';

									  tmp += '</div>';

									  tmp += '</article></section>';
								  }
								  document.getElementById('result').innerHTML = tmp;
							  }
						  },function(e){document.getElementById('result').innerHTML='SELECT TABLE ERROR:'+e.message;});
					  });
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
	var worker = new Worker("<%=cPath%>/bbs/worker.js");
	//worker.postMessage({'seq': tmp
	//	, 'type': 'delete'}); // Send data to our worker. 
	worker.postMessage({'seq': tmp
		, 'bbs': ''
		, 'writer': ''
		, 'subject': ''
		, 'when': ''
		, 'content': ''
		, 'type': 'delete'}); // Send data to our worker.
	worker.addEventListener('message', function(e) {
	    //document.getElementById('result').textContent = e.data;
	    //alert(e.data);
	    top.location.href = '<%=cPath%>/bbs/localList.jsp';
	}, false);
}

document.getElementById('indicator').innerHTML = 
	window.navigator.onLine ? 'online' : 'offline';
</script>
</body>
</html>