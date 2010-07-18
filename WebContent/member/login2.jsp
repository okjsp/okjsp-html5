<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.DomainUtil, kr.pe.okjsp.util.CommonUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="memberHandler" class="kr.pe.okjsp.member.MemberHandler" />
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login</title>
</head>
<body>
<c:catch var="except">
<%
  if (memberHandler.doLogin(member) == 1) {
    pageContext.setAttribute("returnPath", DomainUtil.getFixedURL(request.getParameter("requestPath")));
    int daysOfCookieRemain = 60 * 24 * 90;
    CommonUtil.setCookie(response, "sid", Long.toString(member.getSid()), daysOfCookieRemain);
    CommonUtil.setCookie(response, "okid", member.getId(), daysOfCookieRemain);
%>
    <p>${member.id}´Ô ¹Ý°©½À´Ï´Ù.</p>
    <p><a href="${returnPath}">${returnPath }</a></p>
<%
  }
%>
</c:catch>

${except}
<a href="#" onclick="history.go(-2)">µÚ·Î</a>
</body>
</html>