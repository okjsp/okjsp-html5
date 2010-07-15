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
    	<input name="id" required>
    	<input name="password" type="password" required>
    	<input type="search">
    	<input type="date">
    	<input list="browsers">
		<datalist id="browsers">
			<option value="Safari">
			<option value="Internet Explorer">
			<option value="Opera">
			<option value="Firefox">
		</datalist>
    	<input type="submit">
    </form>
</body>
</html>