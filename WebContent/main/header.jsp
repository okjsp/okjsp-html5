<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li><a href="<%=cPath%>/bbs?act=LIST&amp;bbs=notice" class="transition">공지사항</a></li>
				<li><a href="<%=cPath%>/member/agreement.jsp" class="transition">개인정보취급방침</a></li>
				<li><a href="<%=cPath%>/seq/137659" class="transition">광고문의</a></li>
			</ul>
		</nav>
		<div class="search">
			<input type="checkbox" onclick="doChange()" id="change"><span class="changeFont">기존 사이트로 변환</span><br/><br/>
			<form name="searchf1" method="get" target="okjspsearch"
			action="http://www.google.com/search"
			onsubmit="searchf1.q.value='site:okjsp.pe.kr '+searchf1.qt.value;"> 
				<input name="q" value="site:okjsp.pe.kr " type="hidden"> 
				<input name="qt" value="" type="text" class="field"> 
				<input value="GOOGLE" type="submit" class="button_two"></form> 
		</div>
	</div>
</header>

<script>
function doChange(){
	if(document.getElementById('change').checked == true){
		if(confirm('기존사이트로 다시 복귀하시기 원하십니까?') == true){
			deleteCookie( 'urlChangeOKSJSP' );
			//로컬과 서버 설정 주의~!!!
			top.location.href = 'http://www.okjsp.pe.kr';
		}
	}
}

</script>