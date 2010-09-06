package kr.pe.okjsp.sse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.MemoDao;

public class SSEServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException {
	PrintWriter out = res.getWriter();

	res.setContentType("text/event-stream");
	res.setCharacterEncoding("utf-8");

	MemoDao memoDao = new MemoDao();
	
	out.write("retry: 60000"); // 트위터와 같게 60초로 설정
	out.write("\n");
	out.write("\n");
	out.write("data: " + memoDao.getMemoCount(Integer.parseInt(req.getParameter("seq"))));
	out.flush();

	out.close();

    }

}
