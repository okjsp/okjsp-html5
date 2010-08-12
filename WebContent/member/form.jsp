<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<%@ page errorPage="error.jsp"
    import="kr.pe.okjsp.*,
            kr.pe.okjsp.util.CommonUtil,
            kr.pe.okjsp.util.DateLabel,
            java.util.*,
            java.util.Iterator"
%>
<head>
<%
//ContextPath
String cPath = request.getContextPath();

%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 크롬  프레임 설정 -->
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/style.css" media="screen" /> 
<link rel="stylesheet" type="text/css" href="<%=cPath%>/css/print.css" media="print" />
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<style type="text/css">
.contactform {
	width: 418px;
	margin: 2.0em 0 0 0;
	padding: 10px 10px 0 10px;
	border: solid 1px #C8C8C8;
	background-color: #F2F2F2;
	margin-bottom: 20px;
}

.contactform fieldset {
	padding: 20px 0 10px 0 !important /*Non-IE6*/;
	padding: 0 /*IE6*/;
	margin: 0 0 20px 0;
	border: solid 1px #DCDCDC;
}

.contactform fieldset legend {
	margin: 0 0 0 5px !important /*Non-IE*/;
	margin: 0 0 20px 5px /*IE6*/;
	padding: 0 2px 0 2px;
	color: #505050;
	font-weight: bold;
	font-size: 1em;
}

.contactform label.left {
	float: left;
	width: 100px;
	margin: 0 0 0 10px;
	padding: 2px;
	font-size: .9em;
}

.contactform input.field {
	width: 275px;
	padding: 2px;
	border: solid 1px #C8C8C8;
	font-size: 100%;
}

.contactform span.guide {
	float: left;
	width: 275px;
	display: block;
	color: #646464;
	font-size: .9em;
}

.contactform span.item {
	float: left;
	color: #5A5A5A;
	font-size: 100%;
	vertical-align: middle;
	padding-left: .9em;
}

.contactform span.item label {
	margin: 0 0 0 3px !important;
}

.contactform span.item.first {
	padding-left: 0;
}

.contactform #profile {
	padding: 10px 10px 0 10px;
}

.contactform #profile-drop {
	margin-bottom: 15px;
	padding: 25px;
	border: 2px dashed #bbb;
	color: #bbb;
	border-radius: 5px;
	font: normal normal normal 20pt/normal bold, Tahoma;
}

.contactform #profile-drop.droppable {
	border-color: red !important;
}

.contactform #preview {
	margin-bottom: 15px;
	padding: 25px;
	border: 2px dashed #bbb;
	color: #bbb;
	display: none;
	border-radius: 5px;
	font: normal normal normal 20pt/normal bold, Tahoma;
}

.contactform #preview img {
	max-width: 320px;
}
</style>
<title>OKJSP</title>
<script type="text/javascript" src="<%=cPath%>/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#profile-drop').bind({
        dragover: function(e) {
            var dataTransfer = e.originalEvent.dataTransfer;
            if (dataTransfer.types) {
                var accepted = false;
                for (var i = 0; i < dataTransfer.types.length; i++) {
                    if ('Files' == dataTransfer.types[i]) {
                        accepted = true;
                        break;
                    }
                }
                if (!accepted) {
                    return;
                }
            }
            dataTransfer.dropEffect = 'copy'; 
            e.preventDefault();
            $(this).addClass('droppable');
        },
        dragleave: function(e) {
            setTimeout(function() {
                $(e.target).removeClass('droppable');
            }, 100);
        },
        drop: function(e) {
            setTimeout(function() {
                $(e.target).removeClass('droppable');
            }, 50);

            var files = e.originalEvent.dataTransfer.files;
            if (files.length != 1) {
                return;
            }

            var file = files[0];
            if (!file.type.match(/image.*/)) {
                return;
            }

            var img = document.createElement('img');
            img.file = file;

            var xhr = new XMLHttpRequest();
            xhr.open('post', 'upload.jsp', true);
            xhr.onreadystatechange = function() {
                if (this.readyState != 4) {
                    return;
                }
                var responseJSON = eval('(' + this.responseText + ')');
                $('#preview').hide().empty();
                $('<img src="' + responseJSON['path'] + '">').appendTo('#preview')
                    .load(function() {
                        $(this).css({opacity: 0});
                        $('#preview').slideDown(600, function() {
                            $('#preview img').animate({opacity: 1}, 1200);
                        });
                    });
            };
            xhr.setRequestHeader('Content-Type', 'multipart/form-data');
            xhr.setRequestHeader('X-File-Name', file.fileName);
            xhr.setRequestHeader('X-File-Size', file.fileSize);
            xhr.send(file);
            
            e.preventDefault();
        }
    });
});
</script>
</head>
<body>
<div id="log" style="position: absolute; left: 0; top: 0;"></div>
<div id="wrapper">

    <jsp:include page="../main/header.jsp" />

    <section>
        <div id="container">
            <div id="content">
                <!-- 메인 컨텐츠_시작======================================= -->
                    <div class="contactform">
                        <form method="post" action="index.html">
                            <fieldset><legend>&nbsp;okjsp.pe.kr 회원가입&nbsp;</legend>
                                <p><label for="contact_email" class="left">Email:</label>
                                     <input type="email" name="contact_email" id="contact_email" class="field" autofocus required /></p>
                                <p><label for="contact_id" class="left">ID:</label>
                                     <input type="text" name="contact_id" id="contact_id" class="field" required /></p>
                                <p><label for="contact_name" class="left">Name:</label>
                                     <input type="text" name="contact_name" id="contact_name" class="field" required /></p>
                                <p><label for="contact_url" class="left">Website:</label>
                                     <input type="text" name="contact_url" id="contact_url" class="field" /></p>
                                <p><label for="contact_url" class="left">Mailling:</label>
                                     <span class="item first"><input type="radio" name="contact_mailling" id="contact_mailling_y" /><label class="" for="contact_mailling_y">허용</label></span>
                                     <span class="item"><input type="radio" name="contact_mailling" id="contact_mailling_n" checked /><label class="" for="contact_mailling_n">거부</label></span>
                                     <span class="guide">okjsp에서 비정기적으로 발행하는 뉴스레터와 홍보메일 수신 설정입니다.</span>
                                     </p>
                            </fieldset>
                            <fieldset><legend>&nbsp;Icon&nbsp;</legend>
                                <div id="profile">
                                    <div id="profile-drop">Drop the image</div>
                                    <div id="preview"></div>
                                </div>
                            </fieldset>
                            <fieldset><legend>&nbsp;Info&nbsp;</legend>
                                <p style="padding-left:15px;">가입시 임시비밀번호가 메일로 발송됩니다.<br>로그인 후 비밀번호를 바꿔주시기 바랍니다.</p>
                            </fieldset>
                        </form>
                    </div>
                <!-- 메인 컨텐츠_끝======================================= -->
            </div><!-- #content-->
        </div><!-- #container-->

        <jsp:include page="../main/left.jsp" />

        <jsp:include page="../main/right.jsp" />
    
    </section>

    <jsp:include page="../main/footer.jsp" />

</div><!-- #wrapper -->
<!-- Free template created by http://freehtml5templates.com -->
</body>
</html>
