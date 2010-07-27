<%@ page contentType="text/event-stream" %>
: 이 라인은 주석입니다. 3000ms 마다 Retry 됩니다.
: http://sapid.sourceforge.net/ssetest/ 의 소스를 사용 했습니다.

retry: 3000

data: Server sends timestamp <% out.print(System.currentTimeMillis());%>
