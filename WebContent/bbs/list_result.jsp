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
	    <h1><%= (one.getLev()==0)?"":"Re: " %><% if (oldRef!=one.getRef()) out.println(one.getRef()); %>
	    <a href="seq/<%= one.getSeq() %>" ><%= CommonUtil.showHtml(one.getSubject()) %> </a>
	    </h1>
	     
      <h3><%= DateLabel.getTimeDiffLabel(one.getWhen()) %> (<%= one.getWhen("yyyy-MM-dd HH:mm") %>), by <a href="#"><%= one.getWriter() %></a>
      <!-- <img src="profile/<%//= one.getId() %>.jpg" alt="<%//= one.getId() %>" style="width:14px;height:14px" onerror="this.src='/images/spacer.gif'">
      -->
      </h3>
      
      <p><%//=  CommonUtil.removeTag(one.getContentView()) %> &nbsp; <a href="seq/<%= one.getSeq() %>" >read more...</a></p>
      <p class="details">| Posted by <a href="#"><%= one.getWriter() %> 
      </a> | Categories: <a href="#"><%= list.getBbs() %></a> | Comments: <a href="#"><%= one.getMemo() %></a> | Read: <%=one.getRead() %> |</p>
  </article> 
</section>
<% 
}%>		
<a href='#' onclick="this.style.display = 'none';getList('<%= request.getParameter("bbs") %>', '<%=list.getPg()+1%>')" id='nextBtn'>NEXT</a>