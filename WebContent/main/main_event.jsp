<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="kr.pe.okjsp.*,
    	    kr.pe.okjsp.util.CommonUtil,
    	    kr.pe.okjsp.util.DateLabel,
            java.util.*,
            java.util.Iterator"
    pageEncoding="UTF-8"%>

<%
String cPath = request.getContextPath();
int seq = Integer.parseInt(request.getParameter("seq"));

Iterator iterList = null;
ListHandler list = new ListHandler();
Article one = null;
HashMap bbsInfoMap = (HashMap)application.getAttribute("bbsInfoMap");
iterList = list.getboard(seq).iterator();

if (iterList.hasNext() ) {
	one = (Article) iterList.next();
	BbsInfoBean bbsInfo = ((BbsInfoBean)(bbsInfoMap.get(one.getBbs())));
	if (bbsInfo == null) {
    	bbsInfo = new BbsInfoBean();
    }
%>	
		<td align="center" ><b>
        	<div class="ellipsis" style="width: 70px;">
        		<a href="<%=cPath%>/bbs?act=LIST&bbs=<%= one.getBbs() %>">
        			<%= bbsInfo.getName() %>
        		</a></div></b>
        </td>
        <td align="center"><b>
        	<div class="ellipsis" style="width: 180px;">
	            <a href="<%=cPath%>/seq/<%= one.getSeq() %>" target="_blank">
	            <%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
	            </a>
            </div></b>
        </td>
        <td align="center"><b>
   		<span>[<%= one.getMemo() %>]</span></b>
        </td>
        <td align="center"><b><div class="ellipsis" style="width: 50px;"><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></b></td>
        <td align="center"><b><div><%
    if (one.getId() != null) {
        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
        	alt="<%= one.getId() %>"
        	style="width:14px;height:14px"
        	onerror="this.src='<%=cPath%>/images/spacer.gif'"><%
    }
        	%></div></b></td>
        <td title="<%= one.getWhen() %>" align="center">
        <b><%= DateLabel.getTimeDiffLabel(one.getWhen()) %></b></td>
<%	
}
%>

