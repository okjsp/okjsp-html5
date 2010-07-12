<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="/html5/js/prototype.js"></script>
<title>OKJSP</title>
</head>
<script type="text/javascript">
	
	function ajax_request(bbs, pg) {
	    var myAjax = new Ajax.Request(
	        "/html5/bbs",
	        {method: 'get', parameters: "act=LIST&bbs="+bbs+"&keyfield=content&keyword&pg="+pg ,
		    onComplete: ajax_response}
	    );
	}
			
	function ajax_response(originalRequest) {

			var list = $('list');
			var addlist = document.createElement('section');
			addlist.innerHTML = originalRequest.responseText;
			list.appendChild(addlist);
	}	
</script>

<body>

<a href="#" onclick="ajax_request('bbs1', '1');">ajax</a>

<section id='list'>
</section>

</body>
</html>