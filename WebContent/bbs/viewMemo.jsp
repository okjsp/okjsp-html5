<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
System.out.println("#####################" + memoCount + "::" + startCount);
	  
      MemoBean mb = (MemoBean)memo.next();
      
      if( memoCount >= startCount ) {
%>
<div class="column1-unit"><p>

<%
    if (mb.getId() != null) {
        %><img src="http://www.okjsp.pe.kr/profile/<%= mb.getId() %>.jpg"
        	alt="<%= mb.getId() %>"
        	style="width:33px;height:33px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
%>
<%= mb.getBcomment() %></p>
<p><%= mb.getWriter() %>
<%= mb.getWhen("yyyy-MM-dd HH:mm:ss")%>
</p></div>
<%  
	  }
	  memoCount ++;		// 뎃글 갯수 (SSE 에서 비교 값으로 사용)
	}
  }
%>      
<script type="text/javascript">
currentMemoCount = 7;
</script>