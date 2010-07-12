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
<section>
<%
	Map map = (Map)application.getAttribute("bbsInfoMap");
	if (map != null) {
%>

  <nav>
	<form name="navi" style="margin:0">
	<select id="bbsids" onchange="jump()">
	
	</select>
	
	</form>
  </nav>
<%
	}
%>   

  <section>
<%
	boolean isAdBBS = "recruit".equals(list.getBbs()) && list.getPg() < 1;
	if (isAdBBS) {
		int [] seqs = {152534, 148318};
		ArticleDao articleDao = new ArticleDao();
		for(int seq : seqs) {
			Article article = articleDao.getArticle(seq);
%>
    <header>
      <%= article.getSeq() %>
      
      <%= article.getSubject() %>
        
        <%= article.getWriter() %>
        <img src="/profile/base/default.jpg" style="width: 14px; height: 14px;" alt="<%= article.getWriter() %>"/>
        <%= article.getRead() %>
        <td class="when tiny" title="<%= article.getWhen("yy-MM-dd HH:mm") %>">
        <%= DateLabel.getTimeDiffLabel(article.getWhen()) %></td>
    </header>
    <article>
    </article>
   </section>
<%
		} // end for
	} // end if 
int oldRef = -1;  // 그룹번호가 이전과 같을 경우 그룹번호 출력 안함
while (iter.hasNext()) {
    one = (Article) iter.next();
%>
	<section>
	  <header>
    <%= one.getLev() %>    
    <% if (oldRef!=one.getRef()) out.println(one.getRef()); %>
        <a href="/seq/<%= one.getSeq() %>" >
<%= CommonUtil.showHtml(one.getSubject()) %>&nbsp; </a>
		<%= one.getWriter() %> 
<%
}%>		

<br/>
<div>
</div>
<a href='#' onclick="this.style.display = 'none';ajax_request('bbs1', '<%=list.getPg()+1%>')" id='nextBtn'>NEXT</a>