<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>
<%@ page import="kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>               
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
        <h1 class="pagetitle">게시판이름 / <%= one.getBbs() %></h1>

        <h1 class="block"><%= CommonUtil.showHtml(one.getSubject()) %></h1> 
<%
    if (one.getId() != null) {
        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
        	alt="<%= one.getId() %>"
        	style="width:77px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
%>
        <div class="column1-unit" id='contents'>
	        <h1><%= CommonUtil.showHtml(one.getSubject()) %></h1>                            
          <h3><%= DateLabel.getTimeDiffLabel(one.getWhen()) %> (<%= one.getWhen("yyyy-MM-dd HH:mm") %>), by <a href="<%= one.getHomepage() %>"><%= one.getWriter() %> </a></h3>
          <p><%=  one.getContentView()  %></p>
          <p class="details">| Posted by <a href="<%= one.getHomepage() %>"><%= one.getWriter() %> </a> | Categories: <a href="#"> <%= one.getBbs() %></a> | Comments: <a href="#"><%= one.getRead() %></a> | CCL: <%= one.getCcl_id() %> </p>
        </div>          
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
        
       <hr class="clear-contentunit" />
       <div class="column1-unit">
      목록 / 답변 / 수정  / 삭제 / 책갈피</div>
      <hr class="clear-contentunit" />
<%
  ArrayList<MemoBean> memoList = new MemoHandler().getList(one.getSeq());
  Iterator memo = null;
  if (memoList != null) {
    memo = memoList.iterator();
    while (memo.hasNext()) {
      MemoBean mb = (MemoBean)memo.next();
%>
<div class="column1-unit"><p>

<%
    if (mb.getId() != null) {
        %><img src="http://www.okjsp.pe.kr/profile/<%= mb.getId() %>.jpg"
        	alt="<%= mb.getId() %>"
        	style="width:33px;height:33px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
%>
<%= mb.getBcomment() %></p>
<p><%= mb.getWriter() %>
<%= mb.getWhen("yyyy-MM-dd HH:mm:ss")%>
</p></div>
<%  
	}
  }
  
%>      
      <textarea name="bcomment" style="width:100%;height:80px"></textarea>
        id:<input type="text" class="memoid" name="writer"
            maxlength="50" value="<%= CommonUtil.a2k(CommonUtil.getCookie(request, "okwriter")) %>">
        pw:<input type="password" class="memopw" name="memopass" maxlength="15">
	    <input type="hidden" name="doublecheck" class="memodc" value="okjsp">
	    <br /><span style="color:#f00">IP 노출됩니다. 예민한 얘기는 올리지 않으시는 게 사이트 운영에 도움이 됩니다.
	    <br />개조심할 필요는 있으니까요. 낮말은 새, 밤말은 쥐, 인터넷말은 검색엔진</span>
        <br /><input type="submit" name="send" value="Memo">

      </div>
      
</section>
</body>
</html>