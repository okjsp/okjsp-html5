<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//ContextPath
String cPath = request.getContextPath();

%> 

<footer>
	<div style="text-align:center"> 
		<a href="<%=cPath %>/main/f.jsp?http://www.imaso.co.kr/"
		 title="국내 마지막 남은 개발자를 위한 잡지" target="_blank"> 
		 <img src="http://www.okjsp.pe.kr/images/banner/maso_seminar.gif" border="0"></a> 
	</div> 

	<div id="copyright">
		<span>
		  본 사이트는 크롬 6.0에 최적화 되어 있습니다
		  &copy; 2010 All rights reserved <a href="<%=cPath%>">http://www.okjsp.pe.kr/html5</a></span>
	</div>
</footer>