<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//ContextPath
String cPath = request.getContextPath();
%> 

<header>
	<h1 id="sitename"><a href="<%=cPath%>" title="Go to Start page">OKJSP</a></h1>
	<div id="description">java, jsp, eclipse & HTML5
	</div>
	<div id="top">
		<nav>
			<ul>
				<li><a href="<%=cPath%>/bbs?act=LIST&bbs=notice" class="transition">공지사항</a></li>
				<li><a href="<%=cPath%>/member/agreement.jsp" class="transition">개인정보취급방침</a></li>
				<li><a href="<%=cPath%>/seq/137659" class="transition">광고문의</a></li>
			</ul>
		</nav>
		<div class="search">
			<form name="searchf1" method="get" target="okjspsearch"
			action="http://www.google.com/search"
			onsubmit="searchf1.q.value='site:okjsp.pe.kr '+searchf1.qt.value;"> 
				<input name="q" value="site:okjsp.pe.kr " type="hidden"> 
				<input name="qt" value="" type="text" class="field"> 
				<input value="GOOGLE" type="submit" class="button_two"></form> 
		</div>
	</div>
</header>