package kr.pe.okjsp.jersey.manager;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import kr.pe.okjsp.jersey.legacy.BbsInfoBean;
import kr.pe.okjsp.jersey.legacy.MemoBean;
import kr.pe.okjsp.jersey.legacy.MemoHandler;

import com.sun.jersey.spi.resource.Singleton;

/**
 * @author topolo
 *
 */
@Singleton
@Path("/bbs")
public class BbsManager {
	
	@GET
	@Path("/list")
	@Produces("text/xml")
	public ArrayList<BbsInfoBean> getMemoListXml() {
		return getList();
	}
	

	/*
	 *  메모리스트가지고 오기
	 */
	private ArrayList<BbsInfoBean> getList() {
		ArrayList <BbsInfoBean> list = new ArrayList<BbsInfoBean>();
		
		String[] bbs = {"html5","techtrend","lecture","TOOL","TOOLqna","ajax","ajaxqna","bbs2","bbs1","bbs4","bbs3","weblogic","weblgqna","xmltip","xmlqna","ruby",
				"rubyqna","flex","flexqna","bbs7","docs","etc","bbs6","japanlife","bbs5","movie","howmuch","lifeqna","news","solo","recruit","engdocs",
				"krtomcat","link","goodjob","market","model2jsp","notice","okboard","useful","mac","ihaveadream","javastudy","ns","dbstudy","springstudy",
				"xf","twitter","trash"};
		String[] bbsName = {"HTML5","TECH TREND","강좌","개발툴","개발툴 QnA","JavaScript","JavaScript QnA","DB Tips","DB QnA","JSP Tips","JSP QnA","j2ee Tips",
				"j2ee QnA","XML Tips","XML QnA","Ruby on Rails","Ruby on Rails QnA","Flex","Flex QnA","소스자료실","문서자료실","기타자료실","사는 얘기",
				"일본사는얘기","머리식히는 곳","movie story","얼마면돼","의견좀","뉴스따라잡기","싱글의 미학","구인/구직/홍보","english bbs","번역","추천사이트",
				"좋은회사","장터","모델2JSP책관련","공지사항","자료실문답","유용한 정보","맥 정보","정부는 개발자를 위해","프로그램기초스터디",
				"자바패턴1기","DB스터디","스프링 스터디","SLF","트위터","짬통"};
		
		BbsInfoBean bbsinfo = null;
		
		int bbsListSize = bbs.length;
		for(int i=0; i < bbsListSize; i++) {
			bbsinfo = new BbsInfoBean();
			bbsinfo.setBbs(bbs[i]);
			bbsinfo.setName(bbsName[i]);
			list.add(bbsinfo);
		}
				
		return list;
	}
	
}
