<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<h3>광고</h3>
		<div class="inner" align="center">
			<a href="<%=cPath %>/main/f.jsp?http://open.egovframe.go.kr/seminar/20100723.html" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/egovframe.gif"
				alt="전자정부 표준프레임워크 egovframe"
			></a>
			<a href="<%=cPath %>/main/f.jsp?http://www.adoberia.co.kr/iwt/blog/blog.php?tn=flex&id=468&src=image&kw=00003B" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/welove_134x60.gif"
			alt="WE Love the Web, Flash, HTML5, Choice"
			></a>
			<a href="<%=cPath %>/main/f.jsp?http://www.apptalk.tv" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/apptalk_134x60.jpg"
				alt="http://www.okjsp.pe.kr세상의 모든 앱을 영상으로. 앱의 모든 것, 앱톡"
			></a>
			<a href="<%=cPath %>/main/f.jsp?http://www.devgear.co.kr/" target="_blank"
			><img src="http://www.okjsp.pe.kr/images/banner/embarcadero_134x60.gif"
				alt="개발도구의 명가, 이제는 튜닝입니다."
			></a>
    	</div>
	</div><!-- .box -->

	<div class="box">
		<h3>Chatting</h3>
		<div class="inner">
			<p align="center"><a href="javascript:openSubWindow();">Chatting Popup</a></p>
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
				<a href="<%=cPath %>/main/f.jsp?http://bit.ly/cIQ7fA" title="안드로이드 개발환경 구축" target="android">
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
			<div class="inner" align="center">
				<a href="http://www.80port.com/community" target="_blank" title="www.80port.com
	 				okjsp standalone 호스팅 지원, 서비스 좋습니다."> 
					<img src="http://www.okjsp.pe.kr/images/bnr_80port.gif" width="88" height="31" border="0"></a> 
				<br /> 
				<a href="<%=cPath %>/main/f.jsp?http://www.cubrid.com/" target="_blank" title="okjsp Database"> 
					<img src="http://www.okjsp.pe.kr/images/banner/cubrid_88x31.gif" width="88" height="31" border="0"></a> 
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>Maso Widget</h3>
			<div class="inner" id="imaso_div" align="center">
				<script type="text/javascript">
				<!--
				imaso_ad_client = "pub-31415924";
				//-->
				</script> 
				<script type="text/javascript" src="http://widget.imaso.co.kr/pagead/show_ads.js"></script>  
			</div>
	</div><!-- .box -->
	
	<div class="box">
			<h3>동맹사이트</h3>
			<div class="inner" align="center">
				<a href="http://simples.kr/" target="_blank"> 
					<img src="http://www.okjsp.pe.kr/images/bnr_simples.png" alt="simples.kr"></a>
			</div>
	</div><!-- .box -->
	
</aside><!-- end right sidebar -->	