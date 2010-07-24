package kr.pe.okjsp.sse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.member.Member;
import kr.pe.okjsp.util.DbCon;

public class SSEServlet extends HttpServlet {

  public void service(HttpServletRequest req, HttpServletResponse res)
                        throws IOException, ServletException {
    PrintWriter out = res.getWriter();

    res.setContentType("text/event-stream");
    
    res.setCharacterEncoding("utf-8");
//    res.setHeader("Cache-Control", "max-age=172800");
//    res.setHeader("Connection", "keep-alive");
//    res.setHeader("Transfer-Encoding", "Identity");

    res.flushBuffer();
    
    out.write("data: Server sends timestamp 1279969572");
    out.write("\n");
    out.write("\n");
    out.flush();
    
    out.close();
    
  } // end doPost()

}
