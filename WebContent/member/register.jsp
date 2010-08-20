<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
    errorPage = "/error.jsp"
%><jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="page" />
    <jsp:useBean id="memberHandler" class="kr.pe.okjsp.member.MemberHandler" scope="page" />
    <jsp:setProperty name="member" property="*" />
<body>
<% 
    String cPath = application.getRealPath("");
    String msg = memberHandler.changeInfo(member, request.getParameter("pact"), cPath);
    if ("수정했습니다.".equals(msg)) {
        session.setAttribute("member", member);
    }
%><%= msg %>
<% 
  if("delete".equals(request.getParameter("pact"))) { 
    kr.pe.okjsp.util.CommonUtil.setCookie(response, "okid", "", 0);
    session.invalidate();
  } else { %><br>
<a href="login.jsp" target="_self">login</a>
<% } %>
<br>
<a href="http://www.okjsp.pe.kr/html5" target="_top">Home</a>
<!-- jsp:include page="/googleAnalytics.jsp" / -->
</body>