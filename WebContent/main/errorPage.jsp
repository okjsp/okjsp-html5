<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<%
String cPath = request.getContextPath(); //ContextPath

String msg = null;
int msgCode = Integer.parseInt( request.getParameter("msgCode") );
switch( msgCode )
{
	case 1 : msg = "- 죄송합니다. 본 게시판은 글쓰기 권한이 있는분만 글을 남길 수 있습니다."; break;
	default: msg = "- 서버에 문제가 발생 하였습니다.";	
}
%>

<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/member.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<title>OKJSP_HTML5</title>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../main/header.jsp" />
    <section>
        <div id="container">
            <div id="contentinner">
                <!-- 메인 컨텐츠_시작======================================= -->
                <div class="contactform">
                    <fieldset>
                    	<legend>Server Message</legend>
                        <p><%= msg %></p>
                    </fieldset>
                </div>
                <!-- 메인 컨텐츠_끝======================================= -->
            </div><!-- #content-->
        </div><!-- #container-->
        <jsp:include page="../main/left.jsp" />
    </section>
    <jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>