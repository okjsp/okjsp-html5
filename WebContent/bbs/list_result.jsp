<%@ page pageEncoding="euc-kr"
    import="kr.pe.okjsp.util.CommonUtil, java.util.Iterator,
            kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>
<%@page import="java.util.Map"%>
<%@page import="kr.pe.okjsp.BbsInfoBean"%>
<%@page import="java.util.Arrays"%>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler"/>
<jsp:setProperty name="list" property="*" />
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
	    <h4><%= (one.getLev()==0)?"":"Re: " %><% if (oldRef!=one.getRef()) out.println(one.getRef()); %>
	    <a href="seq/<%= one.getSeq() %>" target="_blank" ><%= CommonUtil.showHtml(one.getSubject()) %> </a>
	    </h4>
	     
      <h3><%= DateLabel.getTimeDiffLabel(one.getWhen()) %> (<%= one.getWhen("yyyy-MM-dd HH:mm") %>), by <a href="#"><%= one.getWriter() %></a>
			<%
				    if (one.getId() != null) {
				        %><img src="http://www.okjsp.pe.kr/profile/<%= one.getId() %>.jpg"
				        	alt="<%= one.getId() %>"
				        	style="width:17px" align="bottom"
				        	><%
				    }else { %> <img src="http://www.okjsp.pe.kr/profile/images/spacer.gif" > <% } %>
      </h3>
      
      <p>&nbsp; <a onClick="document.getElementById('contents_<%=one.getSeq()%>').style.display='block';" style='cursor:pointer'>read more...</a></p>
			<div id='contents_<%=one.getSeq()%>' style='display:none'>
			<p><%= one.getContentView() %></p>
			<br/>
			<p>&nbsp; <a onClick="document.getElementById('contents_<%=one.getSeq()%>').style.display='none';" style='cursor:pointer'>내용 닫기...</a></p>
			</div>
      <p class="details">| Posted by <a href="#"><%= one.getWriter() %> 
      </a> | Categories: <a href="#"><%= list.getBbs() %></a> | Comments: <a href='#' onlick="parent.getMemo('<%=one.getSeq()%>')"><%= one.getMemo() %></a> | Read: <%=one.getRead() %> |</p>
  </article>
</section>
<% 
}%>		

<% 
		int pageTotal = ( list.getCnt() - 1 ) / list.getPageSize();	//전체페이지
		if ( pageTotal > list.getPg()  ) {
%>
<center><h4> 
<input type='button' class='button_two' id='nextBtn' value='다음페이지' onclick="this.style.display='none';getList('<%= request.getParameter("bbs") %>', '<%=list.getPg()+1%>')" />
</h4></center>
<%
	}
%>