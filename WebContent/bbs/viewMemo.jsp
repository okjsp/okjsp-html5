<%@page import="kr.pe.okjsp.util.HttpLinker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>
<%@ page import="kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>               
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler" />
<%
	String cPath  = request.getContextPath();
	int seq = Integer.parseInt(request.getParameter("seq"));
	int startCount = Integer.parseInt(request.getParameter("startCount"));
%>
<%
  int memoCount = 0; 	// 뎃글 갯수 (SSE 에서 비교 값으로 사용)
  ArrayList<MemoBean> memoList = new MemoHandler().getList(seq);
  Iterator memo = null;
  if (memoList != null) {
    memo = memoList.iterator();
    while (memo.hasNext()) {
	  
      MemoBean mb = (MemoBean)memo.next();
      
      if( memoCount >= startCount ) {
    	  if( memoCount != 0 ) {	// 댓글과 댓글 사이에 HR Line 을 넣는다. 이때 첫번째 댓글은 제외 시킨다.
%>
<hr style="border-top:1px solid #BBBBBB; margin: 7px;" />
<%
    	  }
%>
<div class="column1-unit"><p>

<%
    if (mb.getId() != null) {
        %><img src="http://www.okjsp.pe.kr/profile/<%= mb.getSid() %>.jpg"
        	alt="<%= mb.getId() %>"
        	style="width:33px;height:33px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
%>
<br />
<%= HttpLinker.getLinkedSource( CommonUtil.rplc(mb.getBcomment(), "\n", "<br />")) %></p>
<p><%= mb.getWriter() %>
<%= mb.getWhen("yyyy-MM-dd HH:mm:ss")%>
</p>
<input type="hidden" name="mseq" value="<%= mb.getMseq() %>">
</div>
<%  
	  }
	  memoCount ++;		// 뎃글 갯수 (SSE 에서 비교 값으로 사용)
	}
  }
%>      
<script type="text/javascript">
currentMemoCount = 7;
</script>