<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,kr.pe.okjsp.util.CommonUtil,kr.pe.okjsp.*" %>
<%@ page import="kr.pe.okjsp.util.CommonUtil"%>
<%@ page import="kr.pe.okjsp.Navigation"%>
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session"/>
<jsp:useBean id="article" class="kr.pe.okjsp.Article" scope="request"/>
<%
	String cPath  = request.getContextPath();
	String bbsids = request.getParameter("bbs");

	//boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") > -1; 
	boolean isLogin = CommonUtil.getCookieLong(request, "sid") > 0;
	if (!isLogin) {
		response.sendRedirect(Navigation.getPath("LOGFORM"));
		return;
	}
	
	String masknamePrefix = CommonUtil.getMaskname();
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<link rel="stylesheet" href="/html5/js/jquery/jwysiwyg-0.5/jquery.wysiwyg.css" type="text/css" />
	<link rel="stylesheet" href="/html5/bbs/fileuploader.css" type="text/css" /><%-- File Upload 에서만 사용 --%>
	<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
	<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
	<link rel="stylesheet" href="/html5/css/okjsp2007.css.jsp" type="text/css"/>
	<!-- 기존 nas.css form_div의 dt dd등의 css스타일 선언 때문에 사용함 by raniel  -->
	<link rel="stylesheet" href="bbs.css" type="text/css">
	<link rel="icon" type="image/x-icon" href="<%=cPath%>/images/favicon.ico" />
	<script type="text/javascript" src="/html5/js/jquery/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/html5/js/jquery/jwysiwyg-0.5/jquery.wysiwyg.js"></script>
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<script type="text/javascript" src="/html5/js/okjsp.js"></script>
		
	<title>
		OKJSP 글쓰기
	</title>

	<script type="text/javascript">
	$(function() {
		$('#content').wysiwyg();
		$('#content').change(sync);
	});

	var sync = function() {
		var ifr = document.getElementById("contentIFrame");
		ifr.contentWindow.document.body.innerHTML=$("#content").val();
	};

	window.onload = function () {

		var ifr = document.getElementById("contentIFrame");
		ifr.contentWindow.document.body.innerHTML="11";
		
		var drop_area = document.getElementById('drop_area');
		// ondrag
		/*
		drop_area.ondragenter = drop_area.ondragover = function (e) {
			e.preventDefault();
			e.dataTransfer.dropEffect = 'copy';
			return false;
		}
		
		drop_area.ondrop = function(e){
			for (var i = 0; i < e.dataTransfer.files.length; i++) { 
	 
					var file = e.dataTransfer.files[i];

					 document.getElementById('filename0').files[0] = file;

			}
			  var d = document.createElement("div");
				var file = document.createElement("input");
				file.setAttribute("type", "file");
				file.setAttribute("name", "filename"+"1");
				d.appendChild(file);

				var fileListDiv = document.getElementById('fileList');
				fileListDiv.appendChild(d);
		}
		*/
	}

	</script>
</head>

<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include>
    
   	<section>
	<div id="container">
		<div id="contentinner">
   			<article>
   
		<div class="main" >
	     
			<!-- 메인 컨텐츠_시작======================================= -->
			<div id="form_div" style="float:left; padding:0px;">		
				<form name="writeForm" action="/html5/write" method="post" class="form_write" ENCTYPE="multipart/form-data">
				<input name="html" id="html" value="2" type="hidden" readonly="readonly" class="write">
				<input type="hidden" name="bbs" value="<%=CommonUtil.nchk(request.getParameter("bbs")) %>">
				<input type="hidden" name="pg" value="<%=CommonUtil.nchk(request.getParameter("pg")) %>">
				<input type="hidden" name="act" value="<%=CommonUtil.nchk(request.getParameter("act")) %>">
				<input type="hidden" name="seq" value="<%=article.getSeq() %>">
				<input type="hidden" name="ref" value="<%=article.getRef() %>">
				<input type="hidden" name="lev" value="<%=article.getLev() %>">
				<input type="hidden" name="step" value="<%=article.getStep() %>">
				<input type="hidden" name="masknamePrefix" value="<%= masknamePrefix %>">
				<input type="hidden" name="fileCount" value="0">
 				
				<dl>
				<dt>
					<label for="bbs">게시판:</label>
				</dt>
				<dd>
					<%
						Map map = (Map)application.getAttribute("bbsInfoMap");
						BbsInfoBean bib = (BbsInfoBean)(map.get(bbsids));
					%> 
					<select id="bbs" name="bbs" size="1">
					<option value='<%=CommonUtil.nchk(request.getParameter("bbs")) %>' disabled><%= bib.getName() %></option>
					</select>
					<script type="text/javascript">
						document.getElementById('bbs').value = '<%=CommonUtil.nchk(request.getParameter("bbs")) %>';
					</script>
				</dd>
				<dt>
					<label for="writer">닉네임:</label>
				</dt>
				<dd>
					<input name="writer" id="writer" class="write" placeholder="Nick Name" value="<%= article.getWriter() %>" required autofocus> ; 실명쓰지마세요!
				</dd>
				<dt>
					<label for="homepage">Homepage:</label>
				</dt>
				<dd>
					<input name="homepage" id="homepage" class="write" value="<%=article.getHomepage()%>" type='url' placeholder="http://your Homepage">
				</dd>
				<dt>
					<label for="password">비밀번호:</label>
				</dt>
				<dd>
					<input name="password" id="password" type="password" class="write" value="<%= CommonUtil.nchk(request.getParameter("password")) %>" required>
				</dd>
				<dt>
					<label for="ccl_id">CCL:</label>
				</dt>
				<dd>
				<select name="ccl_id" id="ccl_id">
					<option value="0">Copyright-저작자에게 저작권</option>
					<option value="1">CCL-저작자표시</option>
					<option value="2">CCL-저작자표시-동일조건변경허락</option>
					<option value="3">CCL-저작자표시-변경금지</option>
					<option value="4">CCL-저작자표시-비영리</option>
					<option value="5">CCL-저작자표시-비영리-동일조건변경허락</option>
					<option value="6">CCL-저작자표시-비영리-변경금지</option>
				</select>
				</dd>
				<dt>
					<label for="subject">제목:</label>
				</dt>
				<dd>
					<input name="subject" id="subject" class="write" value="<%=article.getSubject() %>" required>
				</dd>
				<dd>
					<input type="hidden" name="msgbackup" id="msgbackup">
				</dd>
				<dt>
					<label for="content">내용:</label>				
				</dt>
				<dd>
					<textarea name="content" id="content" style="width: 600px;" rows="6" class="write"></textarea>
				</dd>
				<dt>
		<%-- ###################  File Upload 시작  ################# --%>
		<div id="file-uploader-demo1" style="width: 600px; float:left;" >
				<p>Please enable JavaScript to use file uploader.</p>
				<!-- or put a simple form for upload here -->
		</div>
	    <script src="/html5/bbs/fileuploader.js" type="text/javascript"></script>
	    <script>
			var totalFileCount = 0;

	        function createUploader(){            
	            var uploader = new qq.FileUploader({
	                element: document.getElementById('file-uploader-demo1'),
	                action: '/html5/AJAXUploadServlet',
	                //allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
	                //params: { param1: 'param1' , param2: 'param2' }
	            });           
	        }

	        function getMaskname() {
		        totalFileCount++;	// 1,2,3,... 1씩 증가한다. Maskname 구성할때 Sequence 값으로 사용 된다.
		        document.writeForm.fileCount.value = totalFileCount;	// 총 첨부 파일 개수
		        
		        return '<%=masknamePrefix%>'+totalFileCount;
	        }
	        
	        // in your app create uploader as soon as the DOM is ready
	        // don't wait for the window to load  
	        window.onload = createUploader;     
	    </script>  
    	<%-- ###################  File Upload 끝  ################# --%>
    	<br/><br/><br/>
				</dt>
				<dd>
					<input id="submitButton" type="submit" value="Submit"/>
				</dd>
				</dl>
				</form>
			</div>
			
		</div>			
    
    				</article>
			</div><!-- #content-->
		</div><!-- #container-->
		<jsp:include page="../main/left.jsp"></jsp:include>
	</section>
    <!-- footer -->    
    <jsp:include page="../main/footer.jsp"></jsp:include>
    
  </div> 
	
</body>
</html>
