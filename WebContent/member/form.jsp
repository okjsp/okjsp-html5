<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
//ContextPath
session.removeAttribute("member");
String cPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="<%=cPath%>/css/mf42_layout4_text.css" />
<link rel="icon" type="image/x-icon" href="<%=cPath%>/img/favicon.ico" />
<style type="text/css">
</style>
<script type="text/javascript" src="<%=cPath%>/js/prototype.js"></script>
<script type="text/javascript">
  Event.observe(window, 'load', function(e) {
    Event.observe('icon-drop', 'dragover', function(e) {
      e.stopPropagation();
      e.preventDefault();
    }, true);
    Event.observe('icon-drop', 'drop', function(e) {
      e.stopPropagation();
      e.preventDefault();
      
      var files = e.dataTransfer.files;
      alert(files.length);
    }, true);
  }, true);
</script>
<title>OKJSP_HTML5</title>
</head>
<body>
  <!-- Main Page Container -->
  <div class="page-container">

    <!-- header -->
    <jsp:include page="/main/header.jsp" />

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
      <jsp:include page="/main/left.jsp" />
      
      <!-- 메인 컨텐츠_시작======================================= -->
      <div class="main-content">

        <div class="column1-unit">
          <div class="contactform">
            <form method="post" action="index.html">
              <fieldset><legend>&nbsp;okjsp.pe.kr 회원가입&nbsp;</legend>
                <p><label for="contact_email" class="left">Email:</label>
                   <input type="email" name="contact_email" id="contact_email" class="field" autofocus required /></p>
                <p><label for="contact_id" class="left">ID:</label>
                   <input type="text" name="contact_id" id="contact_id" class="field" required /></p>
                <p><label for="contact_name" class="left">Name:</label>
                   <input type="text" name="contact_name" id="contact_name" class="field" required /></p>
                <p><label for="contact_url" class="left">Website:</label>
                   <input type="text" name="contact_url" id="contact_url" class="field" /></p>
                <p><label for="contact_url" class="left">Mailling:</label>
                   <span class="item first"><input type="radio" name="contact_mailling" id="contact_mailling_y" /><label class="" for="contact_mailling_y">허용</label></span>
                   <span class="item"><input type="radio" name="contact_mailling" id="contact_mailling_n" checked /><label class="" for="contact_mailling_n">거부</label></span>
                   <span class="guide">okjsp에서 비정기적으로 발행하는 뉴스레터와 홍보메일 수신 설정입니다.</span>
                   </p>
              </fieldset>
              <fieldset><legend>&nbsp;Icon&nbsp;</legend>
                <div style="padding:10px;">
                  <p id="icon-drop" style="padding:25px; border:2px dashed #bbb; color:#bbb; display:block; border-radius:5px; font:normal normal normal 20pt/normal bold, Tahoma;"
                      ondragover="" ondragleave="">Drop files here</p>
                </div>
              </fieldset>
              <fieldset><legend>&nbsp;Info&nbsp;</legend>
                <p style="padding-left:15px;">가입시 임시비밀번호가 메일로 발송됩니다.<br>로그인 후 비밀번호를 바꿔주시기 바랍니다.</p>
              </fieldset>
            </form>
          </div>              
        </div>

      </div>
      <!-- 메인 컨텐츠_끝========================================== -->
      <!-- 우측 영역_메인 화면 외에는 제거 하고 작업... -->
      <!-- 로그인에서 우측영역 없어도 될듯. -->
      <!-- jsp:include page="/main/right.jsp" / -->
    </div>

    <!-- footer -->
    <jsp:include page="/main/footer.jsp" />
  </div>
</body>
</html>