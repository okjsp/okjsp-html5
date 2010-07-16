<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String bbs = request.getParameter("bbs");
%>

<div class="main-navigation">
  <!-- Navigation Level 3 -->
  <div class="round-border-topright"></div>
  <h1 class="first">BBS LIST</h1>
  <!-- Navigation with grid style -->
  <dl class="nav3-grid" ondragstart="onDragStart(event)"
  						ondragenter="onDragEnter(event)" 
  						ondragover="onDragOver(event)" 
  						ondrop="onDrop(event)" >
  						
    <dt draggable="true" id='html5'         onClick="jump('html5'       )" class="dtcss">HTML5              </dt>
    <dt draggable="true" id='techtrend'     onClick="jump('techtrend'   )" class="dtcss">TECH TREND         </dt>
    <dt draggable="true" id='lecture'       onClick="jump('lecture'     )" class="dtcss">강좌                   </dt>
    <dt draggable="true" id='TOOL'          onClick="jump('TOOL'        )" class="dtcss">개발툴             </dt>
    <dt draggable="true" id='TOOLqna'       onClick="jump('TOOLqna'     )" class="dtcss">개발툴 QnA         </dt>
    <dt draggable="true" id='ajax'          onClick="jump('ajax'        )" class="dtcss">Ajax                   </dt>
    <dt draggable="true" id='ajaxqna'       onClick="jump('ajaxqna'     )" class="dtcss">Ajax QnA               </dt>
    <dt draggable="true" id='bbs2'          onClick="jump('bbs2'        )" class="dtcss">DB Tips                </dt>
    <dt draggable="true" id='bbs1'          onClick="jump('bbs1'        )" class="dtcss">DB QnA             </dt>
    <dt draggable="true" id='bbs4'          onClick="jump('bbs4'        )" class="dtcss">JSP Tips           </dt>
    <dt draggable="true" id='bbs3'          onClick="jump('bbs3'        )" class="dtcss">JSP QnA                </dt>
    <dt draggable="true" id='weblogic'      onClick="jump('weblogic'    )" class="dtcss">j2ee Tips          </dt>
    <dt draggable="true" id='weblgqna'      onClick="jump('weblgqna'    )" class="dtcss">j2ee QnA               </dt>
    <dt draggable="true" id='xmltip'        onClick="jump('xmltip'      )" class="dtcss">XML Tips           </dt>
    <dt draggable="true" id='xmlqna'        onClick="jump('xmlqna'      )" class="dtcss">XML QnA                </dt>
    <dt draggable="true" id='ruby'          onClick="jump('ruby'        )" class="dtcss">Ruby on Rails       </dt>
    <dt draggable="true" id='rubyqna'       onClick="jump('rubyqna'     )" class="dtcss">Ruby on Rails QnA   </dt>
    <dt draggable="true" id='flex'          onClick="jump('flex'        )" class="dtcss">Flex                   </dt>
    <dt draggable="true" id='flexqna'       onClick="jump('flexqna'     )" class="dtcss">Flex QnA               </dt>
    <dt draggable="true" id='bbs7'          onClick="jump('bbs7'        )" class="dtcss">소스자료실         </dt>
    <dt draggable="true" id='docs'          onClick="jump('docs'        )" class="dtcss">문서자료실         </dt>
    <dt draggable="true" id='etc'           onClick="jump('etc'         )" class="dtcss">기타자료실         </dt>
    <dt draggable="true" id='bbs6'          onClick="jump('bbs6'        )" class="dtcss">사는 얘기          </dt>
    <dt draggable="true" id='japanlife'     onClick="jump('japanlife'   )" class="dtcss">일본사는얘기           </dt>
    <dt draggable="true" id='bbs5'          onClick="jump('bbs5'        )" class="dtcss">머리식히는 곳      </dt>
    <dt draggable="true" id='movie'         onClick="jump('movie'       )" class="dtcss">movie story            </dt>
    <dt draggable="true" id='howmuch'       onClick="jump('howmuch'     )" class="dtcss">얼마면돼               </dt>
    <dt draggable="true" id='lifeqna'       onClick="jump('lifeqna'     )" class="dtcss">의견좀...          </dt>
    <dt draggable="true" id='news'          onClick="jump('news'        )" class="dtcss">뉴스따라잡기           </dt>
    <dt draggable="true" id='solo'          onClick="jump('solo'        )" class="dtcss">싱글의 미학            </dt>
    <dt draggable="true" id='recruit'       onClick="jump('recruit'     )" class="dtcss">구인/구직/홍보     </dt>
    <dt draggable="true" id='engdocs'       onClick="jump('engdocs'     )" class="dtcss">english bbs         </dt>
    <dt draggable="true" id='krtomcat'      onClick="jump('krtomcat'    )" class="dtcss">번역                   </dt>
    <dt draggable="true" id='link'          onClick="jump('link'        )" class="dtcss">추천사이트         </dt>
    <dt draggable="true" id='goodjob'       onClick="jump('goodjob'     )" class="dtcss">좋은회사               </dt>
    <dt draggable="true" id='market'        onClick="jump('market'      )" class="dtcss">장터                   </dt>
    <dt draggable="true" id='model2jsp'     onClick="jump('model2jsp'   )" class="dtcss">모델2JSP책관련     </dt>
    <dt draggable="true" id='notice'        onClick="jump('notice'      )" class="dtcss">공지사항               </dt>
    <dt draggable="true" id='okboard'       onClick="jump('okboard'     )" class="dtcss">자료실문답         </dt>
    <dt draggable="true" id='useful'        onClick="jump('useful'      )" class="dtcss">유용한 정보            </dt>
    <dt draggable="true" id='mac'           onClick="jump('mac'         )" class="dtcss">맥 정보                </dt>
    <dt draggable="true" id='ihaveadream'   onClick="jump('ihaveadream' )" class="dtcss">정부는 개발자를 위해</dt>
    <dt draggable="true" id='javastudy'     onClick="jump('javastudy'   )" class="dtcss">프로그램기초스터디 </dt>
    <dt draggable="true" id='ns'            onClick="jump('ns'          )" class="dtcss">자바패턴1기            </dt>
    <dt draggable="true" id='dbstudy'       onClick="jump('dbstudy'     )" class="dtcss">DB스터디               </dt>
    <dt draggable="true" id='springstudy'   onClick="jump('springstudy' )" class="dtcss">스프링 스터디      </dt>
    <dt draggable="true" id='xf'            onClick="jump('xf'          )" class="dtcss">SLF                    </dt>
    <dt draggable="true" id='twitter'       onClick="jump('twitter'     )" class="dtcss">트위터             </dt>
    <dt draggable="true" id='trash'         onClick="jump('trash'       )" class="dtcss">짬통                   </dt>
  </dl>
</div>

<script type="text/javascript">
	//잘 안되네 쩝.....
	//구글에서 작업.....
	//event.dataTransfer 관련 로직이 잘 먹고 있지 않음....
	var aaaa = '';
	function jump(tmp) {
		document.location.href='/bbs?act=LIST&bbs='+tmp;
	}

	//드래그 시작시 처리
	function onDragStart(event){
		//alert('onDragStart : '+event.target.id);
		if(event.target.tagName.toLowerCase() == 'dt'){
			//event.dataTransfer.setData("listItemId",event.target.id);
			//event.dataTransfer.setData("text/uri-list",event.target.id);
			event.dataTransfer.setData("URL",event.target.id);
			aaaa = event.target.id;
		}else{
			event.preventDefault();
		}
	}

	//drop이벤트 핸들러
	function onDrop(event){
		//var id = event.dataTransfer.getData('listItemId');		//값을 가져오지 못하는 문제로....
		//var id = event.dataTransfer.getData('text/uri-list');
		//var id = event.dataTransfer.getData('URL');
		var id = aaaa;
		var dt = document.getElementById(id);
		if(dt && dt.parentNode == event.currentTarget){		//과연 얘는 책이 틀린건가? 아니면 내가 우연히 맞은건가? 흠..
			dt.parentNode.removeChild(dt);
			event.currentTarget.appendChild(dt);
		}
		event.stopPropagation();
	}

	//dragover이벤트 핸들러_드롭을 받아들이도록 기본 상태를 취소함
	function onDragOver(event){
		//alert('onDragOver');
		event.preventDefault();
	}	

	//dataTransfer에 들어있는 데이터 타입이 'listItemId'를 포함했을때만 드래그를 받아들임
	function onDragEnter(event){
		var d_types = event.dataTransfer.types;
		for(var i=0 ; i<d_types.length ; i++){
			//if(types[i] == 'listItemId'){
			//if(types[i] == 'text/uri-list'){
			if(d_types[i] == 'URL'){
				//alert('2onDragEnter : '+types[i]);
				event.preventDefault();
				return;
			}
		}
	}


</script>