<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%@page import="kr.pe.okjsp.Navigation"%><html>
<%
	String cPath  = request.getContextPath();
	String bbsids = request.getParameter("bbs");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>okjsp editor</title>
<link rel="stylesheet" href="/js/jquery/jwysiwyg-0.6/jquery.wysiwyg.css" type="text/css">

<!-- <link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_setup.css" /> -->
<!--<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_text.css" />-->

<link rel="icon" type="image/x-icon" href="<%=cPath%>/img/favicon.ico" />

<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jwysiwyg-0.6/jquery.wysiwyg.js"></script>
<script type="text/javascript">
$(function() {
	$('#content').wysiwyg();
	$('#content').change(sync);
});

var sync = function() {
	var ifr = document.getElementById("contentIFrame");
	ifr.contentWindow.document.body.innerHTML=$("#content").val();
}
</script>

</head>
<body>
  <!-- Main Page Container -->
  <div class="page-container">
	
	<!-- header -->
    <%@ include file="../main/header.jsp" %>

    <!-- 상단 카테고리,검색_시작 -->
    <aside class="header-breadcrumbs">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Category-1</a></li>
        <li><a href="#">Section-1.1</a></li>
        <li><a href="#">Content-1.1.1</a></li>          
      </ul>

      <!-- Search form -->                  
      <div class="searchform">
        <form action="index.html" method="get">
          <fieldset> 
            <input name="field" class="field"  placeholder="Search..." />
            <input type="submit" name="button" class="button" value="GO!" />
          </fieldset>
        </form>
      </div>
    </aside>
    <!-- 상단 카테고리,검색_끝-->
    
    <div class="main">
      <!-- 좌측메뉴 -->
      <%@ include file="../main/left.jsp" %>
     
      <!-- 메인 컨텐츠_시작======================================= -->
					<div id="form_div">
					<form action="/write" method="post" class="form_write">
					<input name="html" id="html" value="2" type="hidden" readonly="readonly" class="write">
					
					
					<dl>
					<dt>
					<label for="bbs">bbs:</label>
					</dt>
					<dd>
					<select id="bbs" name="bbs" size="1">
					
					</select>
					<script type="text/javascript">
						document.getElementById('bbs').value = '<%= bbs %>';
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
					</form>
					
					</div>
					
					</div>
      
      </div>
      
</section>
</body>
</html>