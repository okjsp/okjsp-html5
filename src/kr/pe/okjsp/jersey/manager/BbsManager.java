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
	 *  �޸𸮽�Ʈ������ ����
	 */
	private ArrayList<BbsInfoBean> getList() {
		ArrayList <BbsInfoBean> list = new ArrayList<BbsInfoBean>();
		
		String[] bbs = {"html5","techtrend","lecture","TOOL","TOOLqna","ajax","ajaxqna","bbs2","bbs1","bbs4","bbs3","weblogic","weblgqna","xmltip","xmlqna","ruby",
				"rubyqna","flex","flexqna","bbs7","docs","etc","bbs6","japanlife","bbs5","movie","howmuch","lifeqna","news","solo","recruit","engdocs",
				"krtomcat","link","goodjob","market","model2jsp","notice","okboard","useful","mac","ihaveadream","javastudy","ns","dbstudy","springstudy",
				"xf","twitter","trash"};
		String[] bbsName = {"HTML5","TECH TREND","����","������","������ QnA","JavaScript","JavaScript QnA","DB Tips","DB QnA","JSP Tips","JSP QnA","j2ee Tips",
				"j2ee QnA","XML Tips","XML QnA","Ruby on Rails","Ruby on Rails QnA","Flex","Flex QnA","�ҽ��ڷ��","�����ڷ��","��Ÿ�ڷ��","��� ���",
				"�Ϻ���¾��","�Ӹ������� ��","movie story","�󸶸��","�ǰ���","�����������","�̱��� ����","����/����/ȫ��","english bbs","����","��õ����Ʈ",
				"����ȸ��","����","��2JSPå����","��������","�ڷ�ǹ���","������ ����","�� ����","���δ� �����ڸ� ����","���α׷����ʽ��͵�",
				"�ڹ�����1��","DB���͵�","������ ���͵�","SLF","Ʈ����","«��"};
		
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
