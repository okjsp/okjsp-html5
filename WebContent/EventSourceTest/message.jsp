<%@page contentType="text/event-stream" %>
retry:2000
<% 
String [] symbles = {"one","two","three"};
for(String symble : symbles){
	int delta = (int) (Math.random() * 10);
	if(delta < 7){
		if(System.currentTimeMillis() % 2 == 0)
			delta = -delta;
System.out.println(symble+"===="+delta);
%>		
data : <%= symble %>
data : <%= delta %>
<%
	}
}
%>