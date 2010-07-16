<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Login</title>
</head>
<body>
  <form action="<%= Navigation.getPath("SECURE_DOMAIN") %>/jsp/member/login2.jsp/member/login2.jsp" method="post">
    <input name="returnPath" type="hidden" value="<%= CommonUtil.nchk(request.getParameter("returnPath"), "/") %>">
    <input name="id" required>
    <input name="password" type="password" required>
    <input type="submit">
  </form>
</body>
</html>