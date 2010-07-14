<%@ page pageEncoding="euc-kr"
    import="kr.pe.okjsp.util.CommonUtil, java.util.Iterator,
            kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>
<%@page import="java.util.Map"%>
<%@page import="kr.pe.okjsp.BbsInfoBean"%>
<%@page import="java.util.Arrays"%>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler"/>
<jsp:setProperty name="list" property="*" />
<script type="text/javascript">
	
	function ajax_request(bbs, pg) {
	    var myAjax = new Ajax.Request(
	        "/html5/bbs",
	        {method: 'get', parameters: "act=LIST&bbs="+bbs+"&keyfield=content&keyword&pg="+pg ,
		    onComplete: ajax_response}
	    );
	}
			
	function ajax_response(originalRequest) {

			var list = $('list');
			var addlist = document.createElement('section');
			addlist.innerHTML = originalRequest.responseText;
			list.appendChild(addlist);
	}	
</script>
<%
    response.setContentType("text/html");

	Iterator iter = list.getList().iterator();
	Article one = null;
%>
<%@page import="kr.pe.okjsp.ArticleDao"%><html>
<%
int oldRef = -1;  // 그룹번호가 이전과 같을 경우 그룹번호 출력 안함
while (iter.hasNext()) {
    one = (Article) iter.next();
%>

<section>
  <article>
    <%= (one.getLev()==0)?"":"Re: " %> 
    &nbsp;
    <% if (oldRef!=one.getRef()) out.println(one.getRef()); %>
    &nbsp;
    <a href="seq/<%= one.getSeq() %>" >
    <%= CommonUtil.showHtml(one.getSubject()) %> </a>
    &nbsp;
    [ <%= one.getMemo() %> ]
    &nbsp;
    <%= one.getWriter() %>
    &nbsp;
   <%
    if (one.getId() != null) {
        %><img src="profile/<%= one.getId() %>.jpg"
        	alt="<%= one.getId() %>"
        	style="width:14px;height:14px"
        	onerror="this.src='/images/spacer.gif'"><%
    }%> 
    &nbsp;
    <%= one.getRead() %>
    &nbsp;
    <a title="<%= one.getWhen("yy-MM-dd HH:mm") %>">
    <%= DateLabel.getTimeDiffLabel(one.getWhen()) %> </a>
  </article> 
</section>
<% 
}%>		

<br/>
<a href='#' onclick="this.style.display = 'none';ajax_request('<%= request.getParameter("bbs") %>', '<%=list.getPg()+1%>')" id='nextBtn'>NEXT</a>