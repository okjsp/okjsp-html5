<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//ContextPath
String cPath = request.getContextPath();

%> 
<script>
	var lNextWindowId = 1;	// Chatting Popup 이 항상 새로운 이름으로 열리도록하는 구분값

	// OKJSP Chatting Popup
	function openSubWindow() {
		window.open(
		"<%=cPath%>/chat/chat.jsp",
		"chatWindow" + lNextWindowId,
		"width=900,height=550,left=" + (50 + lNextWindowId * 30) + ",top=" + (50 + lNextWindowId * 25)
	);
		lNextWindowId++;
		if( lNextWindowId > 10 ) {
			lNextWindowId = 1;
		}
	}
</script>

<aside id="right"><!-- start right sidebar -->	

	<div class="box">
		<h3>Login</h3>
		<div class="inner">
			
		  <c:if test="${empty member}">
	        <form method="post" action="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/login2.jsp"> 
	          <p><input type="hidden" name="returnPath" value="http://localhost:8080/html5" /></p>
	          <p><label for="username_2" class="top">ID:</label><br />
	            <input type="text" name="id" id="username_2" tabindex="1" class="field" required placeholder="input ID"></p>
	          <p><label for="password_2" class="top">Password:</label><br />
	            <input type="password" name="password" id="password_2" tabindex="2" class="field" required></p>
	          <p><input type="submit" class="button" value="LOGIN"  /></p>
	          <p>
	          <a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/member/form.jsp" id="forgotpsswd_2"><input type="button" id="forgotpsswd_2" class="button" value="회원가입" /></a>
	          </p>
	        </form>
	      </c:if>
	      <c:if test="${!empty member}">
	        <fieldset class="member">
	          <p><a href="#">${member.id} /info</a></p>
	          <p><a href="#">Logout</a></p>
	          <p><a href="#">책갈피</a></p>
	        </fieldset>
	      </c:if>
			
			
			
			
    	</div>
	</div><!-- .box -->

	<div class="box">
		<h3>Chatting</h3>
		<div class="inner">
			<p><a href="javascript:openSubWindow();">Chatting Popup</a></p>
    	</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>광고1</h3>
			<div class="inner">
				<a href="#"><img src="<%=cPath%>/images/ad125.jpg" alt="" class="aligncenter" /></a>
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>광고2</h3>
			<div class="inner">
				<a href="#"><img src="<%=cPath%>/images/ad125.jpg" alt="" class="aligncenter" /></a>
			</div>
	</div><!-- .box -->
	
</aside><!-- end right sidebar -->	