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
			<h3>AD</h3>
			<div class="inner">
				<a href="<%=cPath %>/main/f.jsp?http://www.innorix.com/DS/" title="대용량 파일/폴더 업로드 컴포넌트" target="innorix">
					업로드는 InnoDS
				</a><br/>
				<a href="<%=cPath %>/main/f.jsp?http://www.imaso.co.kr/" title="프로그래머를 위한 잡지" target="imaso">
					마소 Magazine
				</a><br/>
				<a href="<%=cPath %>/main/f.jsp?http://bit.ly/au0bGN" title="아이폰앱 산수의신" target="godofmath">
					아이폰앱 산수의신
				</a><br/>
				<a href="/f.jsp?http://bit.ly/cIQ7fA" title="안드로이드 개발환경 구축" target="android">
					[유료]안드로이드 개발매뉴얼1
				</a><br/>
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>LINK</h3>
			<div class="inner">
				<a href="http://cafe.naver.com/appleswing" title="애플스윙댄스카페 운동부족개발자에게 적극 추천합니다. ^^; 저는 14기 졸업했습니다." target="swing">
   					애플스윙댄스카페
   				</a><br/>
   				<a href="http://it.nodong.net/zbxe/?mid=JOBQNA01" title="회사,일터,경력 관련 이야기 it.nodong.net" target="jobqna">
   					일터Q&amp;A
   				</a>
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>sponsored by</h3>
			<div class="inner">
				<a href="http://www.80port.com/community" target="_blank" title="www.80port.com
	 				okjsp standalone 호스팅 지원, 서비스 좋습니다."> 
					<img src="http://www.okjsp.pe.kr/images/bnr_80port.gif" width="88" height="31" border="0"></a> 
				<br /> 
				<a href="/f.jsp?http://www.cubrid.com/" target="_blank" title="okjsp Database"> 
					<img src="http://www.okjsp.pe.kr/images/banner/cubrid_88x31.gif" width="88" height="31" border="0"></a> 
			</div>
	</div><!-- .box -->
	
</aside><!-- end right sidebar -->	