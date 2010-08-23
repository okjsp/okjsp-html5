package kr.pe.okjsp.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.ListHandler;

/**
 * 메인에서 새글이 올라올시 실시간으로 내용을 보여준다
 * bbsid 가 2가 아니고 twitter 가 아니고 null이 아닌것만 조건을 걸었다...
 * (메인 소스가 구성되어 있는데로...)
 * @author hwayoung.kang
 *
 */
public class MainListServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException {
	PrintWriter out = res.getWriter();

	res.setContentType("text/event-stream");
	res.setCharacterEncoding("utf-8");

	ListHandler hand = new ListHandler();
	
	out.write("retry: 10000");
	out.write("\n");
	out.write("\n");
	try {
		int tmp = hand.getAllRecentMaxSeq();
		out.write("data: " + tmp);
	} catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	out.flush();

	out.close();

    }

}
