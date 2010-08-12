<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//ContextPath
String cPath = request.getContextPath();

%> 

<header>
	<h1 id="sitename"><a href="<%=cPath%>" title="Go to Start page">OKJSP</a></h1>
	<div id="description">Open Source Designs & HTML5</div>
	<div id="top">
		<nav>
			<ul>
				<li><a href="#" class="transition">헤더에요</a></li>
				<li><a href="#" class="transition">About</a></li>
				<li><a href="#" class="transition">Contact</a></li>
				<li><a href="#" class="transition">Support</a></li>
			</ul>
		</nav>
	</div>
</header>