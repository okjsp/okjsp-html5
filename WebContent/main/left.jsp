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
  <dl class="nav3-grid">
	<dt><a href="javascript:jump('html5"      )">HTML5					</a></dt>
	<dt><a href="javascript:jump('techtrend'  )">TECH TREND				</a></dt>
	<dt><a href="javascript:jump('lecture'    )">강좌					</a></dt>
	<dt><a href="javascript:jump('TOOL'       )">개발툴					</a></dt>
	<dt><a href="javascript:jump('TOOLqna'    )">개발툴 QnA				</a></dt>
	<dt><a href="javascript:jump('ajax'       )">Ajax					</a></dt>
	<dt><a href="javascript:jump('ajaxqna'    )">Ajax QnA				</a></dt>
	<dt><a href="javascript:jump('bbs2'       )">DB Tips				</a></dt>
	<dt><a href="javascript:jump('bbs1'       )">DB QnA					</a></dt>
	<dt><a href="javascript:jump('bbs4'       )">JSP Tips				</a></dt>
	<dt><a href="javascript:jump('bbs3'       )">JSP QnA				</a></dt>
	<dt><a href="javascript:jump('weblogic'   )">j2ee Tips				</a></dt>
	<dt><a href="javascript:jump('weblgqna'   )">j2ee QnA				</a></dt>
	<dt><a href="javascript:jump('xmltip'     )">XML Tips				</a></dt>
	<dt><a href="javascript:jump('xmlqna'     )">XML QnA				</a></dt>
	<dt><a href="javascript:jump('ruby'       )">Ruby on Rails			</a></dt>
	<dt><a href="javascript:jump('rubyqna'    )">Ruby on Rails QnA		</a></dt>
	<dt><a href="javascript:jump('flex'       )">Flex					</a></dt>
	<dt><a href="javascript:jump('flexqna'    )">Flex QnA				</a></dt>
	<dt><a href="javascript:jump('bbs7'       )">소스자료실				</a></dt>
	<dt><a href="javascript:jump('docs'       )">문서자료실				</a></dt>
	<dt><a href="javascript:jump('etc'        )">기타자료실				</a></dt>
	<dt><a href="javascript:jump('bbs6'       )">사는 얘기				</a></dt>
	<dt><a href="javascript:jump('japanlife'  )">일본사는얘기			</a></dt>
	<dt><a href="javascript:jump('bbs5'       )">머리식히는 곳			</a></dt>
	<dt><a href="javascript:jump('movie'      )">movie story			</a></dt>
	<dt><a href="javascript:jump('howmuch'    )">얼마면돼				</a></dt>
	<dt><a href="javascript:jump('lifeqna'    )">의견좀...				</a></dt>
	<dt><a href="javascript:jump('news'       )">뉴스따라잡기			</a></dt>
	<dt><a href="javascript:jump('solo'       )">싱글의 미학				</a></dt>
	<dt><a href="javascript:jump('recruit'    )">구인/구직/홍보			</a></dt>
	<dt><a href="javascript:jump('engdocs'    )">english bbs			</a></dt>
	<dt><a href="javascript:jump('krtomcat'   )">번역					</a></dt>
	<dt><a href="javascript:jump('link'       )">추천사이트				</a></dt>
	<dt><a href="javascript:jump('goodjob'    )">좋은회사				</a></dt>
	<dt><a href="javascript:jump('market'     )">장터					</a></dt>
	<dt><a href="javascript:jump('model2jsp'  )">모델2JSP책관련			</a></dt>
	<dt><a href="javascript:jump('notice'     )">공지사항				</a></dt>
	<dt><a href="javascript:jump('okboard'    )">자료실문답				</a></dt>
	<dt><a href="javascript:jump('useful'     )">유용한 정보				</a></dt>
	<dt><a href="javascript:jump('mac'        )">맥 정보					</a></dt>
	<dt><a href="javascript:jump('ihaveadream')">정부는 개발자를 위해		</a></dt>
	<dt><a href="javascript:jump('javastudy'  )">프로그램기초스터디		</a></dt>
	<dt><a href="javascript:jump('ns'         )">자바패턴1기				</a></dt>
	<dt><a href="javascript:jump('dbstudy'    )">DB스터디				</a></dt>
	<dt><a href="javascript:jump('springstudy')">스프링 스터디			</a></dt>
	<dt><a href="javascript:jump('xf'         )">SLF					</a></dt>
	<dt><a href="javascript:jump('twitter'    )">트위터					</a></dt>
	<dt><a href="javascript:jump('trash'      )">짬통					</a></dt>
  </dl>                        
</div>

<script type="text/javascript">
	function jump(tmp) {
		document.location.href='/bbs?act=LIST&bbs='+tmp;
	}
</script>