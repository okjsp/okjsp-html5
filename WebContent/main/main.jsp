<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
//ContextPath
String cPath = request.getContextPath();

%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_text.css" />
<link rel="icon" type="image/x-icon" href="<%=cPath%>/img/favicon.ico" />
<script type="text/javascript">

</script>
<title>OKJSP_HTML5</title>
</head>
<body>
  <!-- Main Page Container -->
  <div class="page-container">
	
	<!-- header -->
    <jsp:include page="header.jsp"></jsp:include>

    <!-- 상단 카테고리(메인에서는 새글 알림),검색_시작 -->
    <aside class="header-breadcrumbs">
      <!-- 새글알림 -->   
      <ul>
        <li>13개의 개시글이 올라왔습니다</li>
      </ul>

      <!-- 검색_시작 -->                  
      <div class="searchform">
        <form action="index.html" method="get">
          <fieldset> 
            <input name="field" class="field"  placeholder="Search..." />
            <input type="submit" name="button" class="button" value="GO!" />
          </fieldset>
        </form>
      </div>
      <!-- 검색_끝 -->
    </aside>
    <!-- 상단 카테고리,검색_끝-->
    
    <div class="main">
      <!-- 좌측메뉴 -->
      <jsp:include page="left.jsp"></jsp:include>
      
      <!-- 메인 컨텐츠_시작======================================= -->
      <div class="main-content">
        <!-- 추천 도서_시작 -->
        <div class="column1-unit">
          <h1 class="pagetitle">추천 도서</h1>
          <p/> 
	        <table border='1' bordercolor='blue' width="100%">
	          <tr>
	      		<td height="180" width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	      		<td width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	      		<td width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	      		<td width="25%"><img class="center" src="/html5/img/image.jpg" alt="Image description" title="Image title" /></td>
	          </tr>
	        </table>
          <p/>
        </div>
        <!-- 추천 도서_끝-->
 
        <!-- 공지사항_시작 -->
        <div class="column1-unit">
          <h1 class="pagetitle">공지 사항</h1>
          <p/> 
		    <table border='1' bordercolor='blue' width="100%">
	          <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
	          <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
	        </table>
	      <p/> 
        </div>
        <!-- 공지사항_끝 -->
 
        <!-- 전체게시판_시작 -->
        <div class="column1-unit">
          <h1 class="pagetitle">전체게시판</h1>
          <p/> 
			<table border='1' bordercolor='blue' width="100%">
		      <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat1</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat2</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat3</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat4</th><td>Data</td><td>Data</td><td>Data</td></tr>
		      <tr><th scope="row" height="20">Cat5</th><td>Data</td><td>Data</td><td>Data</td></tr>
			</table>
	      <p/> 
        </div>
        <!-- 전체게시판_끝 --> 
      </div>
      <!-- 메인 컨텐츠_끝========================================== -->
	  <!-- 우측 영역_메인 화면 외에는 제거 하고 작업... -->
	  <jsp:include page="right.jsp"></jsp:include> 
    </div>
    <!-- footer -->    
    <jsp:include page="footer.jsp"></jsp:include> 
  </div> 
</body>
</html>