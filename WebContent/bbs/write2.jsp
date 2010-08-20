<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	long sid = CommonUtil.getCookieLong(request, "sid");
	String id = CommonUtil.getCookie(request, "okid");
	String bbs = CommonUtil.nchk(request.getParameter("bbs"), "perf");
	
	if(sid == 0) {
		response.sendRedirect(Navigation.getPath("LOGFORM")+"?returnPath=/site2009/editor.jsp?bbs="+bbs);
		return; 
	}
*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%@page import="kr.pe.okjsp.Navigation"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>okjsp editor</title>

<link rel="stylesheet" href="/html5/js/jquery/jwysiwyg-0.5/jquery.wysiwyg.css" type="text/css">
<link rel="stylesheet" href="/html5/css/okjsp2007.css.jsp" type="text/css">

<script type="text/javascript" src="/html5/js/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/html5/js/jquery/jwysiwyg-0.5/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="/html5/js/okjsp.js"></script>
<script type="text/javascript">
$(function() {
	$('#content').wysiwyg();
	$('#content').change(sync);
});

var sync = function() {
	var ifr = document.getElementById("contentIFrame");
	ifr.contentWindow.document.body.innerHTML=$("#content").val();
}

window.onload = function () {
	 
	var drop_area = document.getElementById('drop_area');

	// ondrag
	/*
	drop_area.ondragenter = drop_area.ondragover = function (e) {
		e.preventDefault();
		e.dataTransfer.dropEffect = 'copy';
		return false;
	}
	
	drop_area.ondrop = function(e){
		for (var i = 0; i < e.dataTransfer.files.length; i++) { 
 
				var file = e.dataTransfer.files[i];

				 document.getElementById('filename0').files[0] = file;

		}
		  var d = document.createElement("div");
		 	var file = document.createElement("input");
		 	file.setAttribute("type", "file");
		 	file.setAttribute("name", "filename"+"1");
		 	d.appendChild(file);

		 	var fileListDiv = document.getElementById('fileList');
		 	fileListDiv.appendChild(d);
	}
}
*/
</script>

</head>
<body class="yui-skin-sam">

<div style="float:left">

</div>

<div id="form_div">
<form action="/html5/write" method="post" class="form_write" ENCTYPE="multipart/form-data">
<input name="html" id="html" value="2" type="hidden" readonly="readonly" class="write">


<dl>
<dt>
<label for="bbs">bbs:</label>
</dt>
<dd>
<select id="bbs" name="bbs" size="1">
<option value='twitter'>twitter</option>
</select>
<script type="text/javascript">
	document.getElementById('bbs').value = 'twitter';
</script>
</dd>
<dt>
<label for="writer">Writer:</label>
</dt>
<dd>
<input name="writer" id="writer" class="write">
</dd>
<dt>
<label for="homepage">homepage:</label>
</dt>
<dd>
<input name="homepage" id="homepage" class="write">
</dd>
<dt>
<label for="password">password:</label>
</dt>
<dd>
<input name="password" id="password" type="password" class="write">
</dd>
<dt>
<label for="ccl_id">CCL:</label>
</dt>
<dd>
<select name="ccl_id" id="ccl_id">
	<option value="0">Copyright-저작자에게 저작권</option>
	<option value="1">CCL-저작자표시</option>
	<option value="2">CCL-저작자표시-동일조건변경허락</option>
	<option value="3">CCL-저작자표시-변경금지</option>
	<option value="4">CCL-저작자표시-비영리</option>
	<option value="5">CCL-저작자표시-비영리-동일조건변경허락</option>
	<option value="6">CCL-저작자표시-비영리-변경금지</option>
</select>
</dd>
<dt>
<label for="subject">Subject:</label>
</dt>
<dd>
<input name="subject" id="subject" class="write">
</dd>
<dd>
<input type="hidden" name="msgbackup" id="msgbackup">
<textarea name="content" id="content" rows="6" class="write">
</textarea>
</dd>
<dd>
<input id="submitButton" type="submit" value="Submit"/>
</dd>
</dl>
파일업로드 : 
<input type="file" name="filename0" id='filename0' multiple><br>
<div id='fileList'></div>
<p id="drop_area" style="border: 2px dashed #ddd;padding: 10px;margin-bottom: 2em;"> 
					or drag and drop files here
</p>  
</form>
</div>
				<ul id="file_list"> 
					<li class="no_items">선택된 파일이 없습니다.</li> 
				</ul> 
	<script>
	// view-source:http://robertnyman.com/html5/fileapi/fileapi.html 
	(function () {
		var filesUpload = document.getElementById("filename0"),
			dropArea = document.getElementById("drop_area"),
			fileList = document.getElementById("file_list");
		
		function traverseFiles (files) {
			var li,
				file,
				fileInfo;
			fileList.innerHTML = "";
				
			for (var i=0, il=files.length; i<il; i++) {
				li = document.createElement("li");
				file = files[i];
				fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
				fileInfo += "<div><strong>Size:</strong> " + file.size + " bytes</div>";
				fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
				li.innerHTML = fileInfo;
				fileList.appendChild(li);
			};
		};
		
		filesUpload.onchange = function () {
			traverseFiles(this.files);
		};
		
		dropArea.ondragenter = function () {
			return false;
		};
		
		dropArea.ondragover = function () {
			return false;
		};
		
		dropArea.ondrop = function (evt) {
			traverseFiles(evt.dataTransfer.files);
			return false;
		};
		
	})();
				</script> 
</body>
</html>
 