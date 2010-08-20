<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
//ContextPath
session.removeAttribute("member");
String cPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<style type="text/css">
#preview { padding:10px 10px 0 10px; }
#icon-drop { margin-bottom: 15px; padding: 25px; border: 2px dashed #bbb; color: #bbb; border-radius: 5px; font: normal normal normal 20pt/normal bold, Tahoma; }
#icon-drop.drop { border-color: red !important; }
#icon { margin-bottom: 15px; padding: 25px; border: 2px dashed #bbb; color: #bbb; display: none; border-radius: 5px; font: normal normal normal 20pt/normal bold, Tahoma; }
#icon img { max-width: 320px; }
</style>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery.ndd.js"></script>
<script>
  $(document).ready(function() {
    $('#icon-drop').droppable(
        'Files',
        function() {
          $(this).addClass('drop');
        },
        function() {
          $(this).removeClass('drop');
        },
        function(e) {
          e.stopPropagation();
          e.preventDefault();

          var files = e.dataTransfer.files;
          if (files.length != 1) {
              return;
          }

          var file = files[0];
          if (!file.type.match(/image.*/)) {
            return;
          }

          var img = document.createElement('img');
          img.file = file;

          var xhr = new XMLHttpRequest();
          xhr.open('post', 'upload.jsp', true);
          xhr.onreadystatechange = function() {
            if (this.readyState != 4) {
              return;
            }
            var responseJSON = eval('(' + this.responseText + ')');
            $('#icon').hide().empty();
            $('<img src="' + responseJSON['path'] + '">').appendTo('#icon')
              .load(function() {
                $(this).css({opacity: 0});
            	$('#icon').slideDown(600, function() {
                  $('#icon img').animate({opacity: 1}, 1200);
            	});
              });
          };
          xhr.setRequestHeader('Content-Type', 'multipart/form-data');
          xhr.setRequestHeader('X-File-Name', file.fileName);
          xhr.setRequestHeader('X-File-Size', file.fileSize);
          xhr.send(file);
        }
      );
  });
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
                <div id="preview">
                  <div id="icon-drop">Drop the image</div>
                  <div id="icon"></div>
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