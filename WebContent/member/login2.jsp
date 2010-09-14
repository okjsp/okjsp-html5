<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.pe.okjsp.util.DomainUtil, kr.pe.okjsp.util.CommonUtil, kr.pe.okjsp.Navigation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="memberHandler" class="kr.pe.okjsp.member.MemberHandler" />
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session" />
<jsp:setProperty name="member" property="*" />
<%--
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
    pageContext.setAttribute("returnPath", DomainUtil.getFixedURL(request.getParameter("returnPath")));
    int daysOfCookieRemain = 60 * 24 * 90;
    CommonUtil.setCookie(response, "sid", Long.toString(member.getSid()), daysOfCookieRemain);
    CommonUtil.setCookie(response, "okid", member.getId(), daysOfCookieRemain);
%>
    <p>${member.id}님 반갑습니다.</p>
<%
  }
%>
</c:catch>

${except.message}
<c:if test="${!empty returnPath}">
<p><a href="${returnPath}">${returnPath}</a></p>
</c:if>
<c:if test="${empty returnPath}">
<a href="#" onclick="history.go(-2)">뒤로</a>
</c:if>
</body>
</html>
--%>
<c:catch var="except">
<%
  if (memberHandler.doLogin(member) == 1) {
    pageContext.setAttribute("returnPath", DomainUtil.getFixedURL(request.getParameter("returnPath")));
    int daysOfCookieRemain = 60 * 24 * 90;
    CommonUtil.setCookie(response, "sid", Long.toString(member.getSid()), daysOfCookieRemain);
    CommonUtil.setCookie(response, "okid", member.getId(), daysOfCookieRemain);
  }
%>
</c:catch>
<c:if test="${!empty except}">
  <% session.removeAttribute("member"); %>
</c:if>
<%
  String cPath = request.getContextPath();
	//로그인 에러로 수정_HOME_URL이 잘 먹히지 않는 관계로...
  /*String returnPath = pageContext.getAttribute("returnPath") != null ?
      (String) pageContext.getAttribute("returnPath") : Navigation.getPath("HOME_URL");*/
  String returnPath = "";  
  if("".equals(returnPath) || returnPath == null){
	  returnPath = Navigation.getPath("HOME_URL");
  }else{
	  returnPath = (String)pageContext.getAttribute("returnPath");
  }
        
  response.sendRedirect(returnPath);
%>
