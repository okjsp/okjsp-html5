<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="/html5/css/mf42_layout4_setup.css" />
<link rel="stylesheet" type="text/css" media="screen,projection,print" href="/html5/css/mf42_layout4_text.css" />
<link rel="icon" type="image/x-icon" href="/html5/img/favicon.ico" />
<title>OKJSP_HTML5</title>
</head>
<body>
  <!-- Main Page Container -->
  <div class="page-container">
	
	<!-- header -->
    <%@ include file="header.jsp" %>

    <!-- 상단메뉴,검색_시작 -->
    <div class="header-breadcrumbs">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Category-1</a></li>
        <li><a href="#">Section-1.1</a></li>
        <li><a href="#">Content-1.1.1</a></li>          
      </ul>

      <!-- Search form -->                  
      <div class="searchform">
        <form action="index.html" method="get">
          <fieldset>
            <input name="field" class="field"  value=" Search..." />
            <input type="submit" name="button" class="button" value="GO!" />
          </fieldset>
        </form>
      </div>
    </div>
    <!-- 상단메뉴,검색_끝-->
    
    <div class="main">
      <!-- 좌측메뉴_시작 -->
      <div class="main-navigation">

        <!-- Navigation Level 3 -->
        <div class="round-border-topright"></div>
        <h1 class="first">좌측메뉴</h1>

        <!-- Navigation with grid style -->
        <dl class="nav3-grid">
          <dt><a href="#">Navlink 11</a></dt>
          <dt><a href="#">Navlink 12</a></dt>
            <dd><a href="#">Navlink 121</a></dd>
            <dd><a href="#">Navlink 122</a></dd>
            <dd><a href="#">Navlink 123</a></dd>		
          <dt><a href="#">Navlink 13</a></dt>
          <dt><a href="#">Navlink 14</a></dt>
          <dt><a href="#">Navlink 15</a></dt>
        </dl>                        
      </div>
      <!-- 좌측메뉴_끝 -->
 
      <!-- 메인 컨텐츠_시작======================================= -->
      <div class="main-content">
        
        <!-- Pagetitle -->
        <h1 class="pagetitle">Multiflex-4 / Layout-4</h1>

        <!-- Content unit - One column -->
        <h1 class="block">1 - Column types</h1>
        <div class="column1-unit">
          <h1>Here comes the title</h1>                            
          <h3>Monday, 20 November 2006 at 20:30 GMT, by <a href="#">SiteAdmin </a></h3>
          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod tincidunt ut laoreet dolore <a href="#">magna aliquam</a> erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis. <a href="#">Read more &raquo;</a></p>
          <p class="details">| Posted by <a href="#">SiteAdmin </a> | Categories: <a href="#">General</a> | Comments: <a href="#">73</a> |</p>
          <h1><a href="">Heading h1 with link</a></h1>                            
          <h3>Heading h3</h3>
          <p>Lorem ipsum dolor sit amet, consectetuer <a href="#">adipiscing elit</a>, sed diam nonummy nibh euismod tincidunt ut laoreet dolore <a href="#">magna aliquam</a> erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis. <a href="#">Read more &raquo;</a></p>
          <p class="details">Posting details ...  </p>
        </div>          
        <hr class="clear-contentunit" />

      </div>
      <!-- 메인 컨텐츠_끝========================================== -->
                
      <!-- 우측 로그인_시작 -->
      <div class="main-subcontent">
        <div class="subcontent-unit-border-blue">
          <div class="round-border-topleft"></div><div class="round-border-topright"></div>
          <h1 class="blue">Login</h1>
          <div class="loginform">
            <form method="post" action="index.html"> 
              <p><input type="hidden" name="rememberme" value="0" /></p>
              <fieldset>
                <p><label for="username_2" class="top">User:</label><br />
                  <input type="text" name="username_2" id="username_2" tabindex="1" class="field" onkeypress="return webLoginEnter(document.loginfrm.password);" value="" /></p>
    	        <p><label for="password_2" class="top">Password:</label><br />
                  <input type="password" name="password_2" id="password_2" tabindex="2" class="field" onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);" value="" /></p>
    	        <p><input type="checkbox" name="checkbox" id="checkbox_2" class="checkbox" tabindex="3" size="1" value="" onclick="webLoginCheckRemember()" /><label for="checkbox_1" class="right">Remember me</label></p>
    	        <p><input type="submit" name="cmdweblogin" class="button" value="LOGIN"  /></p>
	            <p><a href="#" onclick="webLoginShowForm(2);return false;" id="forgotpsswd_2">Password forgotten?</a></p>
	          </fieldset>
            </form>
          </div>
        </div>
      </div>
      <!-- 우측 로그인_끝 -->        
    </div>
    <!-- footer -->    
    <%@ include file="footer.jsp" %>
  </div> 
</body>
</html>