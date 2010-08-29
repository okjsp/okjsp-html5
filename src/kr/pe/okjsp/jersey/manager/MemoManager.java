package kr.pe.okjsp.jersey.manager;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import kr.pe.okjsp.jersey.legacy.MemoBean;
import kr.pe.okjsp.jersey.legacy.MemoHandler;

import com.sun.jersey.spi.resource.Singleton;

/**
 * @author topolo
 *
 */
@Singleton
@Path("/memo")
public class MemoManager {
	
	@GET
	@Path("/list/{seq}")
	@Produces("text/xml")
	public ArrayList<MemoBean> getMemoListXml(@PathParam("seq") int seq) {
		return getMemoList(seq);
	}
	

	/*
	 *  메모리스트가지고 오기
	 */
	private ArrayList<MemoBean> getMemoList(int seq) {
		ArrayList <MemoBean> list = null;
		
		MemoHandler mhandler = new MemoHandler();
		
		list = mhandler.getList(seq);
				
		return list;
	}
	
}
