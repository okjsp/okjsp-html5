<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//ContextPath
String cPath = request.getContextPath();

%> 

<aside id="right"><!-- start right sidebar -->	

	<div class="box">
		<h3>Connect With Us</h3>
		<div class="inner">
			<ul>
				<li><a href="#">Twitter</a></li>
				<li><a href="#">Facebook</a></li>
			</ul>
    	</div>
	</div><!-- .box -->

	<div class="box">
		<h3>Recent Articles</h3>
		<div class="inner">
			<ul>
				<li><a href="#">How To Clean Anything</a></li>
				<li><a href="#">Get The Most Out of Widgets</a></li>
			</ul>
    	</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>Recommended</h3>
			<div class="inner">
				<br />
				<a href="#"><img src="<%=cPath%>/images/ad125.jpg" alt="" class="aligncenter" /></a>
				<br />
				<a href="#"><img src="<%=cPath%>/images/ad125.jpg" alt="" class="aligncenter" /></a>
				<br />
				<a href="#"><img src="<%=cPath%>/images/ad125.jpg" alt="" class="aligncenter" /></a>
				<br />
			</div>
	</div><!-- .box -->
	
</aside><!-- end right sidebar -->	