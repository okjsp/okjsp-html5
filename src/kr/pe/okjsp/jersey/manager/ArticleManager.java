package kr.pe.okjsp.jersey.manager;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import kr.pe.okjsp.jersey.legacy.Article;
import kr.pe.okjsp.jersey.legacy.ArticleDao;
import kr.pe.okjsp.jersey.legacy.ListHandler;

import com.sun.jersey.spi.resource.Singleton;

/**
 * @author topolo
 *
 */
@Singleton
@Path("/article")
public class ArticleManager {
	
	
	@GET
	@Path("/list/{bbs}")
	@Produces("text/xml")
	public ArrayList<Article> getListXml(@PathParam("bbs") String bbs) {
		return getList(bbs);
	}
	
	@GET
	@Path("/{seq}")
	@Produces("text/xml")
	public Article getArtcleXml(@PathParam("seq") int seq) {
		return getArticle(seq);
	}
	
	
	/*
	 * 게시판 글 리스트
	 */
	private ArrayList<Article> getList(String bbs) {
		ArrayList <Article> list = null; 
        
		ListHandler lhandler = new ListHandler();
		try {
			lhandler.setBbs(bbs);
			list = lhandler.getList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/*
	 *  글가지고 오기
	 */
	private Article getArticle(int seq) {
		Article article = null;
		if (seq == 0) seq = 155904;
		ArticleDao dao = new ArticleDao();
		
		try {
			article =  dao.getArticle(seq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return article;
	}
	
}
