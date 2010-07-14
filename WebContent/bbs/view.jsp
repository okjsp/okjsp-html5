<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>    
<jsp:useBean id="one"  class="kr.pe.okjsp.Article" scope="request"/>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />

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

<section id='contents'>
<%
    if (one.getId() != null) {
        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
        	alt="<%= one.getId() %>"
        	style="width:77px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
%>
    &nbsp;
    <%= one.getWriter() %>
    &nbsp;
    <%= one.getHomepage() %>
    &nbsp;
    <%= CommonUtil.showHtml(one.getSubject()) %>
    &nbsp;
    <p>
    <%=  one.getContentView()  %>
    </p>
    
    <p><%= one.getCcl_id() %></p>

	<ul><%
	  ArrayList fileList = (ArrayList) request.getAttribute("arrdf");
	  if (fileList != null) {
	    Iterator file = fileList.iterator();
	    while (file.hasNext()) {
	      DownFile df = (DownFile)file.next();
	%><li><a href="/bbs?act=DOWN&maskname=<%= df.getMaskName() %>&fileName=<%= df.getFileName() %>"><%= df.getFileName() %>
	 <%= df.getFileSize() %> Bytes (<%=df.getDownload()%>)</a></li><%
	    } // end while
	  }
	%>
	</ul>

</section>

</body>
</html>