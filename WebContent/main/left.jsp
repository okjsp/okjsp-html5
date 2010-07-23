<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String bbs = request.getParameter("bbs");
%>

<div class="main-navigation" style='text-overflow: ellipsis;'>
  <!-- Navigation Level 3 -->
  <div id="db_results"></div>
  <div class="round-border-topright"></div>
  <h1 class="first">BBS LIST</h1>
  <!-- Navigation with grid style -->
  <dl class="nav3-grid" ondragstart="onDragStart(event)"
  						ondragenter="onDragEnter(event)" 
  						ondragover="onDragOver(event)" 
  						ondrop="onDrop(event)" id="left_menu">
  </dl>
</div>

<script type="text/javascript">
//drag and drop 이벤트 핸들러
//로컬 스토리지
//Web SQL Database
//http://slides.html5rocks.com 과 책을 함께 참조

	var left_menu = document.querySelector('#left_menu');
	//해당 게시판 url로 이동
	function jump(tmp) {
		//alert(document.getElementById('left_menu').innerHTML);
		document.location.href='/bbs?act=LIST&bbs='+tmp;
	}

	//드래그 시작시 처리
	function onDragStart(event){
		if(event.target.tagName.toLowerCase() == 'dt'){
			event.dataTransfer.setData('text',event.target.id);		//text로 하니깐 먹는다 ㅎㅎㅎ~
		}else{
			event.preventDefault();
		}
	}

	//drop이벤트 핸들러
	function onDrop(event){
		//alert(event.target.outerHTML);
		var drag_zone = event.dataTransfer.getData('text');	//옮길애 아이디(드뎌 이거 된다 ㅜㅜ_text로 하니깐 됨..)
		var drag_zone_inner = document.getElementById(drag_zone).innerHTML;					//옮길애 내용
		var dt = document.getElementById(drag_zone);

		var drop_zone = event.target.id;				//옮길곳에 있는 애 아이디
		var drop_zone_inner = document.getElementById(drop_zone).innerHTML;					//옮길곳에 있는 애 내용

		if(dt && dt.parentNode == event.currentTarget){		//과연 얘는 책이 틀린건가? 흠...
			//책에 있는 소스가 잘 안되서...걍 cross 시켰다.
			document.getElementById(drop_zone).innerHTML = '';
			document.getElementById(drop_zone).innerHTML = drag_zone_inner;
			document.getElementById(drag_zone).innerHTML = '';
			document.getElementById(drag_zone).innerHTML = drop_zone_inner;
		}

		//var id = event.dataTransfer.getData('text');
		//var dt = document.getElementById(id);
		//if(dt && dt.parentNode == event.currentTarget){
			//dt.parentNode.removeChild(dt);
			//event.currentTarget.appendChild(dt);
		//}
		event.stopPropagation();

		//로컬 스토리지 설정
		localStorage['leftmenu_storage'] = left_menu.innerHTML;
	}

	//dragover이벤트 핸들러_drop을 받아들이도록 기본 상태를 취소함
	function onDragOver(event){
		if (event.preventDefault) event.preventDefault(); // allows us to drop
	    event.dataTransfer.dropEffect = 'copy';
	    return false;
	}	

	function onDragEnter(event){
		if (event.preventDefault) event.preventDefault();
	    event.dataTransfer.dropEffect = 'copy';
	    return false;
	}

	window.onload = function (){ 
		//localStorage.clear();	//스토리지 삭제
		//로컬 스토리지 불러오기
		var tmp = localStorage['leftmenu_storage'];
		if(!(tmp == 'undefined' || tmp == '' || tmp == 'null' || tmp == null)){
			//로컬 스토리지에 데이터가 있으면 해당 데이터를 가져와서 세팅
			left_menu.innerHTML = tmp;
		}else{
			//로컬 스토리지에 데이터가 없으면 Web SQL Database로 데이터 불러오기
			var db;
			db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 200000);
			db.transaction(function(tx) {
				tx.executeSql("SELECT * FROM okboard_category", [], function(tx, result) {
					//alert(result.rows.length);
					var tmp2 = '';
					for (var i = 0, item = null; i < result.rows.length; i++) {
						item = result.rows.item(i);
						tmp2 = tmp2 + 
							'<dt draggable="true" id="'
							+ item['id']
							+'" onClick="jump(\''
							+item['id']
							+'\')" class="dtcss" >'
							+item['name']
							+'</dt>';
					}
					left_menu.innerHTML = tmp2;
				});
			});
		}
	}

</script>