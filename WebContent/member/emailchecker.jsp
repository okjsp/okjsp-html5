<%@ page contentType="application/json; charset=UTF-8" %>
<jsp:useBean id="memberHandler" class="kr.pe.okjsp.member.MemberHandler" />
{ "result": <%= !memberHandler.isEmailExist(request.getParameter("email")) %> }
