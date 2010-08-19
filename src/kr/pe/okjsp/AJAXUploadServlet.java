package kr.pe.okjsp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.util.CommonUtil;
import kr.pe.okjsp.util.DbCon;

public class AJAXUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DbCon dbCon = new DbCon();

	/**
	 * TODO Decoding 필요
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		fileUpload(request, response);
		
		insertOKBOARD_FILE( request );

	}

	private void insertOKBOARD_FILE(HttpServletRequest request) {
		String query = "insert into okboard_file ( fseq, seq, filename, maskname, filesize, download, sts ) " +
				//" values( 0, 0, ?, ?, ?, 0, 1 )";
			    " values( (select max(fseq)+1 from okboard_file), 0, ?, ?, ?, 0, 1 )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbCon.getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, request.getParameter("qqfile"));
			pstmt.setString(2, request.getParameter("maskname"));
			pstmt.setString(3, request.getParameter("fileSize"));
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(conn, pstmt);
		}
	}

	private void fileUpload(HttpServletRequest request,
			HttpServletResponse response) throws IOException  {
		
		String maskname = request.getParameter("maskname");

		String key2 = "UPDIR";
		String uploadBase = Navigation.getPath(key2);
		// 절대경로입니다.
		String filePath = getServletContext().getRealPath(request.getContextPath()) + 
                         uploadBase + "/" + maskname;
		
		File file = new File(filePath);
		
		FileOutputStream outputStream = null;
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		PrintWriter out = null;
		
		try{
			outputStream = new FileOutputStream(file);
			bin = new BufferedInputStream(request.getInputStream());
			bout = new BufferedOutputStream(outputStream);
			
			int bytesRead = 0;
			byte[] buffer = new byte[1024];
			while ((bytesRead = bin.read(buffer, 0, 1024)) != -1) {
				bout.write(buffer, 0, bytesRead);
			}
			
			out = response.getWriter();
			out.println("{success:true}");
			
		} finally {
			bout.close();
			bin.close();
			outputStream.close();
			out.close();
		}
	}
}