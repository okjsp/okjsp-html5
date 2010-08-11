<%@ page contentType="text/event-stream" 
		 import="kr.pe.okjsp.*,
		    	    kr.pe.okjsp.util.CommonUtil,
		    	    kr.pe.okjsp.util.DateLabel,
		            java.util.*,
		            java.util.Iterator"%>
retry: 3000

data: Server sends timestamp <% out.print(System.currentTimeMillis());%>

