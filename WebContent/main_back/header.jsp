<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//ContextPath
String cPath = request.getContextPath();

%>    
<header class="header">
	<!-- 타이틀_시작 -->
	<hgroup class="header-top">
		<div class="round-border-topleft"></div>
		<div class="round-border-topright"></div>
		
		<!-- Sitelogo and sitename --> <a class="sitelogo" href="<%=cPath%>" title="Home"></a>
		<div class="sitename">
			<h1><a href="<%=cPath%>" title="Go to Start page">OKJSP</a></h1>
			<h2>Open Source Designs & HTML5</h2>
		</div>
		
		<!-- Navigation Level 0 -->
		<div class="nav0">
			<ul>
				<li><a href="#" title="English"><img
					src="/html5/img/flag_greatbritain.png" alt="Image description" /></a></li>
				<li><a href="#" title="Deutsch"><img
					src="/html5/img/flag_germany.png" alt="Image description" /></a></li>
				<li><a href="#" title="Svenska"><img
					src="/html5/img/flag_sweden.png" alt="Image description" /></a></li>
			</ul>
		</div>
		
		<!-- Navigation Level 1 -->
		<div class="nav1">
			<ul>
				<li><a href="#" title="Who we are">Links</a></li>
				<li><a href="#" title="Send us a message">Contact</a></li>
				<li><a href="#" title="Send us a message">Impressum</a></li>
			</ul>
		</div>
	</hgroup>
	<!-- 타이틀_끝-->
	<!-- 상단메뉴_시작 -->
	<div class="header-bottom"><!-- Navigation Level 2 (Drop-down menus) -->
		<nav class="nav2"><!-- Navigation item -->
			<ul>
				<li><a href="<%=cPath%>">홈</a></li>
			</ul>
			
			<!-- Navigation item -->
			<ul>
				<li><a href="#">Page Layouts</a>
					<ul>
						<li><a href="mf42_layout1.html">Layout-1</a></li>
						<li><a href="mf42_layout2.html">Layout-2</a></li>
						<li><a href="mf42_layout3.html">Layout-3</a></li>
						<li><a href="mf42_layout4.html">Layout-4</a></li>
						<li><a href="mf42_layout5.html">Layout-5</a></li>
					</ul>
				</li>
			</ul>
			<ul>
				<li><a href="#">Page Layouts</a>
					<ul>
						<li><a href="mf42_layout1.html">Layout-1</a></li>
						<li><a href="mf42_layout2.html">Layout-2</a></li>
						<li><a href="mf42_layout3.html">Layout-3</a></li>
						<li><a href="mf42_layout4.html">Layout-4</a></li>
						<li><a href="mf42_layout5.html">Layout-5</a></li>
					</ul>
				</li>
			</ul>
			<ul>
				<li><a href="#">Page Layouts</a>
					<ul>
						<li><a href="mf42_layout1.html">Layout-1</a></li>
						<li><a href="mf42_layout2.html">Layout-2</a></li>
						<li><a href="mf42_layout3.html">Layout-3</a></li>
						<li><a href="mf42_layout4.html">Layout-4</a></li>
						<li><a href="mf42_layout5.html">Layout-5</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
	<!-- 상단메뉴_끝 -->
</header>