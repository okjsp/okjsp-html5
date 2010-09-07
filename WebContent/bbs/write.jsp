<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	String masknamePrefix = CommonUtil.getMaskname();	// 첨부파일의 maskname 구성에 씌인다.
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<link rel="stylesheet" href="/html5/js/jquery/jwysiwyg-0.5/jquery.wysiwyg.css" type="text/css" />
	<link rel="stylesheet" href="/html5/bbs/fileuploader.css" type="text/css" /><%-- File Upload 에서만 사용 --%>
	<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
	<!-- 기존 nas.css form_div의 dt dd등의 css스타일 선언 때문에 사용함 by raniel  -->
	<link rel="icon" type="image/x-icon" href="<%=cPath%>/images/favicon.ico" />
	<script type="text/javascript" src="/html5/js/jquery/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/html5/js/jquery/jwysiwyg-0.5/jquery.wysiwyg.js"></script>
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<script type="text/javascript" src="/html5/js/okjsp.js"></script>
		
	<title>OKJSP_HTML5</title>

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
	};

	var okNotification;	// notification 객체가 assign된다. 5초후 자동 Close를 위해 Global 변수로 선언.
	function validationField() {

		var frm = document.writeForm;
		var errorMsg = "- 주황색 컬럼과 [내용]은 필수 입력 입니다.";

		if( frm.checkValidity() )	// frm의 값이 모두 정상이면, return 시켜 버린다.
			return;

		if(!!window.webkitNotifications) { // 브라우저에서 WebkitNotifications 을 지원 하는 경우 (현재 Chrome 만 지원)
			if(window.webkitNotifications.checkPermission() == 0 ){ //사용자 승인 여부 확인하기 (0:승인 , 1:승인전, 2:거부)
				var picture 	= 'http://www.okjsp.pe.kr/profile/kenu.jpg'; 
				var titleStr 	= '필수 입력 값이 입력되지 않았습니다';
				var bodyStr 	= errorMsg;
				okNotification 	= window.webkitNotifications.createNotification(picture, titleStr, bodyStr);

				okNotification.ondisplay = function() {
					window.setTimeout("okNotification.cancel();", 5 * 1000);	// 5초후 자동 Close 된다.
				};
				okNotification.show();
				
			} else if(window.webkitNotifications.checkPermission() == 2)  {	//사용자 승인 여부 확인하기 (0:승인 , 1:승인전, 2:거부)
				alert( errorMsg + " (Web Notifications 기능이 [차단] 되어 있습니다.)" );
			} else {	// 미승인 상태
				window.webkitNotifications.requestPermission(); // 승인요청
			}
		} else {	// 브라우저에서 WebkitNotifications 을 지원하지 않는 경우 (ex> Safari)
			alert( errorMsg );
		}
	}

	</script>
</head>

<body>
<div id="wrapper">
	<jsp:include page="../main/header.jsp"></jsp:include>
   	<section style="font-size:14px">
		<div id="container">
			<div id="contentinner">
			<!-- 메인 컨텐츠_시작======================================= -->
   				
  				<form name="writeForm" action="/html5/write" method="post" class="form_write" >
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
					
					<article>
						게시판:
						<%
							Map map = (Map)application.getAttribute("bbsInfoMap");
							BbsInfoBean bib = (BbsInfoBean)(map.get(bbsids));
						%>
						<select id="bbs" name="bbs" size="1" class="field">
						<option value='<%=CommonUtil.nchk(request.getParameter("bbs")) %>' disabled><%= bib.getName() %></option>
						</select>
						<script>
							document.getElementById('bbs').value = '<%=CommonUtil.nchk(request.getParameter("bbs")) %>';
						</script>
					</article>
					<br/>
					<article>
						닉네임:
						<input name="writer" id="writer" class="field" placeholder="Nick Name" value="<%= article.getWriter() %>" required> (실명쓰지마세요)
					</article>
					<br/>
					<article>
						Homepage:
						<input name="homepage" id="homepage" class="field" value="<%=article.getHomepage()%>" type='url' placeholder="http://your Homepage" style="width:500px ">
					</article>
					<br/>
					<article>
  						비밀번호:
  						<input name="password" id="password" type="password" class="field" value="<%= CommonUtil.nchk(request.getParameter("password")) %>" required>
  					</article>
  					<br/>
					<article>
  						CCL:
  						<select name="ccl_id" id="ccl_id" class="field" st>
							<option value="0">Copyright-저작자에게 저작권</option>
							<option value="1">CCL-저작자표시</option>
							<option value="2">CCL-저작자표시-동일조건변경허락</option>
							<option value="3">CCL-저작자표시-변경금지</option>
							<option value="4">CCL-저작자표시-비영리</option>
							<option value="5">CCL-저작자표시-비영리-동일조건변경허락</option>
							<option value="6">CCL-저작자표시-비영리-변경금지</option>
						</select>
  					</article>
  					<br/>
					<article>
						제목:
						<input name="subject" id="subject" class="field" value="<%=article.getSubject() %>" required style="width:500px ">
						<input type="hidden" name="msgbackup" id="msgbackup">
					</article>
					<br/>
					<article>
						내용:<br/>
						<textarea name="content" id="content" style="width: 600px;" rows="6" class="write" required><%=article.getContent()%></textarea>
					</article>
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
				                sizeLimit: 1024 * 1024 * 200	// 200MB 까지 첨부 가능.
				                								// sizeLimit 이  모든 브라우져에서 가능한 것은 아니다.(Safari5/Chrome5 에서 성공. IE8에서 실패. 나머지 테스트 필요)
				                //allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],	// 첨부파일의 확장자 제한
				                //params: { param1: 'param1' , param2: 'param2' }	// 기타 Parameter 를 Servlet 으로 던져야 할때 사용한다.
				            });
				        }
			
				        function getMaskname() {
					        totalFileCount++;	// Maskname 구성할때 Sequence 값으로 사용 된다.
					        document.writeForm.fileCount.value = totalFileCount;	// 총 첨부 파일 개수 (Servlet 에서 첨부파일 개수 파악에 쓰인다.)
			
					        return '<%=masknamePrefix%>'+totalFileCount;
				        }
			
				        window.onload = createUploader;
				    </script>
			    	<%-- ###################  File Upload 끝  ################# --%>
  					<br/><br/><br/>
					<article align="center">
						<input id="submitButton" type="submit" value="저장" class="button_two" style="width:100px" onClick="validationField();" />
					</article>
					<br/><br/>
				</form>
			<!-- 메인 컨텐츠_시작======================================= -->    			
			</div><!-- #contentinner-->
		</div><!-- #container-->
		<jsp:include page="../main/left.jsp"></jsp:include>
	</section>
    <!-- footer -->    
    <jsp:include page="../main/footer.jsp"></jsp:include> 
</div>	
</body>
</html>
