package kr.pe.okjsp.samples.fileUpload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AJAXUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * TODO Decoding ÇÊ¿ä 
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String fileName = request.getParameter("qqfile");
	InputStream is = request.getInputStream();
	OutputStream os = new FileOutputStream(new File(fileName));
	int read = 0;
	byte[] bytes = new byte[1024];
	while ((read = is.read(bytes)) != -1) {
	    os.write(bytes, 0, read);
	}
	is.close();
	os.flush();
	os.close();
	PrintWriter out = response.getWriter();
	out.println("{success:true}");
	out.close();
    }
}