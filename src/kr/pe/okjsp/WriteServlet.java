package kr.pe.okjsp;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.util.CommonUtil;
import kr.pe.okjsp.util.DbCon;

import com.oreilly.servlet.MultipartRequest;

public class WriteServlet extends HttpServlet {

	private static final long serialVersionUID = 4181913566227354988L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException {
		String bbs;
		
	    bbs = writeWithFiles(req, res);
	    
		String togo = "/html5/bbs?act=LIST&bbs=" + bbs + "&pg=0";
		res.sendRedirect(togo);

	} // end doPost()


	private String writeWithFiles(HttpServletRequest req,
			HttpServletResponse res) throws IOException {

		// 주석 사유 : okjsp2007의 경로와 일치시키기 위함
        // String uploadDir = getServletContext().getRealPath(req.getContextPath())+Navigation.getPath("UPDIR");
		String uploadDir = Navigation.getPath("UPDIR_HTML5"); //디렉토리 확인 과정 (절대경로)
		
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            boolean mkdirs = dir.mkdirs();
            if (!mkdirs) {
            	throw new IOException("can't create dir");
            }
        }
        
		
		Article article = null;
		String id = CommonUtil.getCookie(req, "okid");
		long sid = CommonUtil.getCookieLong(req, "sid");
		try {
			int seq = 0, ref = 0, lev = 0, step = 0;
			String writer = req.getParameter("writer");
			String bbs = req.getParameter("bbs");
			String content = req.getParameter("content");
			String email = req.getParameter("email");
			String subject = req.getParameter("subject");
			String homepage = req.getParameter("homepage");
			String password = req.getParameter("password");
			String html = req.getParameter("html");
			String ccl_id = req.getParameter("ccl_id");
			String ip = req.getRemoteAddr();
			
			//id 
		    boolean isLogin = sid > 0 && !"".equals(writer);
		    if (!isLogin) {
		        res.sendRedirect(Navigation.getPath("LOGFORM"));
		        return null;
		    }
// Multipart 가 들어가면 무조건 8859_1로 변함 ㅡ.ㅡ
			article =
				new Article(
					bbs,
					seq,
					ref,
					step,
					lev,
					id,
					sid,
					writer,
					subject,
					content,
					password,
					email,
					homepage,
					0,
					null,
					html,
					ip, ccl_id);

			int cnt = 0;
			
		} catch (Exception e) {
			System.out.println("WriteServlet:" + CommonUtil.a2k(e.toString()));
		}

		if (hasNothing(article)) {
			throw new SecurityException("no content");
		}
		
		/*
			db 입력
		*/
		DbCon dbCon = new DbCon();
		Connection conn = null;
		ArticleDao articleDao = new ArticleDao();
		
		String act = req.getParameter("act");
		
		try {

			conn = dbCon.getConnection();
			conn.setAutoCommit(false);

			
			String[] delFiles = null;

			int seq = 0;
			if ("MODIFY".equals(act)) {
				seq = Integer.parseInt(req.getParameter("seq"));
				delFiles = req.getParameterValues("delFile");
				article.setSeq(seq);
			}

			if ("REPLY".equals(act)) {
				article.setSeq(articleDao.getSeq(conn));
				article.setRef(Integer.parseInt(req.getParameter("ref")));
				article.setLev(Integer.parseInt(req.getParameter("lev")));
				article.setStep(
						Integer.parseInt(req.getParameter("step")));
				articleDao.reply(conn, article);

			} else if ("MODIFY".equals(act)) {
				articleDao.modify(conn, article);
				articleDao.deleteFiles(conn, delFiles);
			} else {
				article.setSeq(articleDao.getSeq(conn));
				article.setRef(articleDao.getNewRef(conn, article.getBbs()));
				articleDao.write(conn, article);
			}

			int fileCount = Integer.parseInt(req.getParameter("fileCount"));
			if( fileCount > 0 )	// 첨부파일이 있는 경우
				articleDao.updateOKBOARD_FILE(conn, article.getSeq(), req.getParameter("masknamePrefix"), fileCount); // okboard_file 테이블의 seq값을 Update 한다.
			
			conn.commit();
		} catch (Exception e) {
			System.out.println("WriteServlet err:" + CommonUtil.a2k(e.toString()));
		} finally {
			dbCon.close(conn, null);
		}

		/*
			트위터 글쓰기 추가 
			2010.03.25 윤정부[Coma] 수정 : 수정시 트위터 전송 안되게 처리함.
			act 변수 위치 변경하였음.
		*/
		if(!"MODIFY".equals(act) && !"REPLY".equals(act))
		{
			new TwitterUpdate().doUpdate(article, req);
		}
		
		return article.getBbs();
	}

	public boolean hasNothing(Article article) {
		boolean hasNothing = article.getSubject() == null
				|| "".equals(article.getSubject().trim())
				|| article.getContent() == null
				|| "".equals(article.getContent().trim())
				|| article.getBbs() == null
				|| "".equals(article.getBbs().trim())
				;
		return hasNothing;
	}

}
