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
<script type="text/javascript">

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
              <fieldset><legend>&nbsp;CONTACT DETAILS&nbsp;</legend>
                <p><label for="contact_title" class="left">Title:</label>
                   <select name="contact_title" id="contact_title" class="combo">
                     <option value="choose"> Select... </option>
                     <option value="mrs"> Mrs. </option>
                     <option value="mr"> Mr. </option>
                     <option value="dr"> Dr. </option></select></p>
                <p><label for="contact_firstname" class="left">First name:</label>
                   <input type="text" name="contact_firstname" id="contact_firstname" class="field" value="" tabindex="1" /></p>
                <p><label for="contact_familyname" class="left">Family name:</label>
                   <input type="text" name="contact_familyname" id="contact_familyname" class="field" value="" tabindex="1" /></p>
                <p><label for="contact_street" class="left">Street:</label>
                   <input type="text" name="contact_street" id="contact_street" class="field" value="" tabindex="1" /></p>
                <p><label for="contact_postalcode" class="left">Postal code:</label>
                   <input type="text" name="contact_postalcode" id="contact_postalcode" class="field" value="" tabindex="1" /></p>
                <p><label for="contact_city" class="left">City:</label>
                   <input type="text" name="contact_city" id="contact_city" class="field" value="" tabindex="1" /></p>
                <p><label for="contact_country" class="left">Country:</label>
                   <select name="contact_country" id="contact_country" class="combo">
                     <option value="choose"> Select... </option>
                     <option value="Sweden"> Sweden </option>
                     <option value="United States"> United States </option>
                     <option value="China"> China </option></select></p>
                <p><label for="contact_phone" class="left">Phone:</label>
                   <input type="text" name="contact_phone" id="contact_phone" class="field" value="" tabindex="2" /></p>
                <p><label for="contact_email" class="left">Email:</label>
                   <input type="text" name="contact_email" id="contact_email" class="field" value="" tabindex="2" /></p>
                <p><label for="contact_url" class="left">Website:</label>
                   <input type="text" name="contact_url" id="contact_url" class="field" value="" tabindex="3" /></p>
              </fieldset>
              <fieldset><legend>&nbsp;MESSAGE DETAILS&nbsp;</legend>
                <p><label for="contact_subject" class="left">Subject:</label>
                   <input type="text" name="contact_subject" id="contact_subject" class="field" value="" tabindex="4" /></p>
                <p><label for="contact_urgency" class="left">Please reply:</label>
                   <select name="contact_urgency" id="contact_urgency" class="combo">
                     <option value="choose"> Select... </option>
                     <option value="today"> Latest today </option>
                     <option value="tomorrow"> Latest tomorrow </option>
                     <option value="threedays"> Latest in 3 days </option>
                     <option value="week"> Latest in a week </option>
                     <option value="month"> Latest in a month </option></select></p>
                <p><label for="contact_message" class="left">Message:</label>
                   <textarea name="contact_message" id="contact_message" cols="45" rows="10" tabindex="5"></textarea></p>
                <p><input type="submit" name="submit" id="submit" class="button" value="Send message" tabindex="6" /></p>
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