<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>    
<jsp:useBean id="one"  class="kr.pe.okjsp.Article" scope="request"/>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />

<%
	String cPath  = request.getContextPath();
	String bbsids = request.getParameter("bbs");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_text.css" />
<link rel="icon" type="image/x-icon" href="<%=cPath%>/img/favicon.ico" />
<script src="/html5/js/prototype.js"></script>
<title>OKJSP</title>
</head>


<script type="text/javascript">
	function getList(bbs, pg) {
	    var myAjax = new Ajax.Request(
	        "/html5/bbs/list_result.jsp",
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

	window.onload=getList('<%=bbsids%>', 0); 
</script>

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
      <div class="main-content">      
      <!-- Pagetitle -->
        <h1 class="pagetitle">게시판이름 / <%= bbsids %> [<%= list.getCnt() %>]</h1>

        <!-- Content unit - One column -->
        <!-- <h1 class="block">TEST.... </h1>  -->

        <div class="column1-unit" id='list'>
        </div>          
        <hr class="clear-contentunit" />

      </div>
      <!-- 메인 컨텐츠_끝========================================== -->
    </div>
    <!-- footer -->    
    <%@ include file="../main/footer.jsp" %>
  </div> 

</body>
</html>