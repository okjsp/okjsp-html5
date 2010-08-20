<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bbs = request.getParameter("bbs");
%>

<div class="main-navigation" style='text-overflow: ellipsis;'>
  <!-- Navigation Level 3 -->
  <div class="round-border-topright"></div>
  <h1 class="first">BBS LIST</h1>
  <!-- Navigation with grid style -->
  <dl class="nav3-grid" ondragstart="onDragStart(event)"
  						ondragenter="onDragEnter(event)" 
  						ondragover="onDragOver(event)" 
  						ondrop="onDrop(event)" 
  						ondragleave="onDragLeave(event)"    id="left_menu">
  </dl>
</div>

<script>
//drag and drop 이벤트 핸들러
//로컬 스토리지
//Web SQL Database
//http://slides.html5rocks.com 과 책을 함께 참조

	var left_menu = document.querySelector('#left_menu');
	//해당 게시판 url로 이동
	function jump(tmp) {
		//alert(document.getElementById('left_menu').innerHTML);
		document.location.href='/html5/bbs?act=LIST&bbs='+tmp;
	}

	//드래그 시작시 처리
	function onDragStart(event){
		if(event.target.tagName.toLowerCase() == 'dt'){
			event.dataTransfer.setData('text',event.target.id);		//text로 하니깐 먹는다 ㅎㅎㅎ~
			document.getElementById(event.target.id).className = 'hovering';
		}else{
			event.preventDefault();
		}
	}

	//drop이벤트 핸들러
	function onDrop(event){
		var drag_zone = event.dataTransfer.getData('text');	//옮길애 아이디(드뎌 이거 된다 ㅜㅜ_text로 하니깐 됨..)
		var drag_zone_inner = document.getElementById(drag_zone).outerHTML;					//옮길애 내용
		var dt = document.getElementById(drag_zone);

		var drop_zone = event.target.id;				//옮길곳에 있는 애 아이디
		var drop_zone_inner = document.getElementById(drop_zone).outerHTML;					//옮길곳에 있는 애 내용

		//alert(drag_zone_inner+"--"+drop_zone_inner);

		if(dt && dt.parentNode == event.currentTarget){		//과연 얘는 책이 틀린건가? 흠...
			//책에 있는 소스가 잘 안되서...걍 cross 시켰다.
			//document.getElementById(drop_zone).innerHTML = '';
			document.getElementById(drop_zone).outerHTML = drag_zone_inner;
			//document.getElementById(drag_zone).innerHTML = '';
			document.getElementById(drag_zone).outerHTML = drop_zone_inner;

			document.getElementById(drop_zone).className = 'dtcss';
			document.getElementById(drag_zone).className = 'dtcss';
		}

		//var id = event.dataTransfer.getData('text');
		//var dt = document.getElementById(id);
		//if(dt && dt.parentNode == event.currentTarget){
			//dt.parentNode.removeChild(dt);
			//event.currentTarget.appendChild(dt);
		//}
		event.stopPropagation();

		//로컬 스토리지 설정_내가 옮겨놓은 메뉴 그대로 저장하기 위해...
		localStorage['leftmenu_storage'] = left_menu.innerHTML;
	}

	//dragover이벤트 핸들러_drop을 받아들이도록 기본 상태를 취소함
	function onDragOver(event){
		if (event.preventDefault) event.preventDefault(); // allows us to drop
	    event.dataTransfer.dropEffect = 'copy';
	    document.getElementById(event.target.id).className = 'hovering';
	    return false;
	}	

	function onDragEnter(event){
		if (event.preventDefault) event.preventDefault();
	    event.dataTransfer.dropEffect = 'copy';
	    document.getElementById(event.target.id).className = 'hovering';
	    return false;
	}

	//drag가 지나가고 난 뒤 발생
	function onDragLeave(event){
		if (event.preventDefault) event.preventDefault();
	    event.dataTransfer.dropEffect = 'copy';
	    document.getElementById(event.target.id).className = 'dtcss';
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
			db = openDatabase("okjsp_sqlite", "1.0", "okjsp_sqlite", 2 * 1024 * 1024);
			db.transaction(function(tx) {
				tx.executeSql('CREATE TABLE IF NOT EXISTS okboard_category ( seq  numeric, id text, name text)');
				tx.executeSql("SELECT * FROM okboard_category", [], function(tx, result) {
					var tmp2 = '';
					if(result.rows.length == 0){
						//그냥 해보고 싶었어여 ㅎㅎㅎ~
						tx.executeSql("insert into okboard_category(seq,id,name) values(1,'html5'       ,'HTML5')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(2,'techtrend'   ,'TECH TREND')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(3,'lecture'     ,'강좌')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(4,'TOOL'        ,'개발툴')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(5,'TOOLqna'     ,'개발툴 QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(6,'ajax'        ,'Ajax')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(7,'ajaxqna'     ,'Ajax QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(8,'bbs2'        ,'DB Tips')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(9,'bbs1'        ,'DB QnA')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(10,'bbs4'       ,'JSP Tips')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(11,'bbs3'       ,'JSP QnA')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(12,'weblogic'   ,'j2ee Tips')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(13,'weblgqna'   ,'j2ee QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(14,'xmltip'     ,'XML Tips')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(15,'xmlqna'     ,'XML QnA')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(16,'ruby'       ,'Ruby on Rails')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(17,'rubyqna'    ,'Ruby on Rails QnA')	");
						tx.executeSql("insert into okboard_category(seq,id,name) values(18,'flex'       ,'Flex')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(19,'flexqna'    ,'Flex QnA')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(20,'bbs7'       ,'소스자료실')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(21,'docs'       ,'문서자료실')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(22,'etc'        ,'기타자료실')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(23,'bbs6'       ,'사는 얘기')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(24,'japanlife'  ,'일본사는얘기')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(25,'bbs5'       ,'머리식히는 곳')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(26,'movie'      ,'movie story')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(27,'howmuch'    ,'얼마면돼')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(28,'lifeqna'    ,'의견좀...')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(29,'news'       ,'뉴스따라잡기')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(30,'solo'       ,'싱글의 미학')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(31,'recruit'    ,'구인/구직/홍보')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(32,'engdocs'    ,'english bbs')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(33,'krtomcat'   ,'번역')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(34,'link'       ,'추천사이트')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(35,'goodjob'    ,'좋은회사')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(36,'market'     ,'장터')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(37,'model2jsp'  ,'모델2JSP책관련')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(38,'notice'     ,'공지사항')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(39,'okboard'    ,'자료실문답')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(40,'useful'     ,'유용한 정보')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(41,'mac'        ,'맥 정보')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(42,'ihaveadream','정부는 개발자를 위해')");
						tx.executeSql("insert into okboard_category(seq,id,name) values(43,'javastudy'  ,'프로그램기초스터디')	");
						tx.executeSql("insert into okboard_category(seq,id,name) values(44,'ns'         ,'자바패턴1기')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(45,'dbstudy'    ,'DB스터디')			");
						tx.executeSql("insert into okboard_category(seq,id,name) values(46,'springstudy','스프링 스터디')		");
						tx.executeSql("insert into okboard_category(seq,id,name) values(47,'xf'         ,'SLF')					");
						tx.executeSql("insert into okboard_category(seq,id,name) values(48,'twitter'    ,'트위터')				");
						tx.executeSql("insert into okboard_category(seq,id,name) values(49,'trash'      ,'짬통')				");
					}
					tx.executeSql("SELECT * FROM okboard_category", [], function(tx, result) {
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
			});
		}





		



















		
	}

</script>