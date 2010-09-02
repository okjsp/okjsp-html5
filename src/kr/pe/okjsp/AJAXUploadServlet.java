package kr.pe.okjsp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.util.DbCon;

public class AJAXUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DbCon dbCon = new DbCon();

	/**
	 * TODO Decoding 필요
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// File 의 물리적 Upload
		fileUpload(request, response);
		
		// File 정보를 OKBOARD_FILE DB테이블에 Insert 한다.
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
			
			pstmt.setString(1, new String(request.getParameter("qqfile").getBytes("8859_1"),"utf-8"));	// 파일명. Ajax 를 통해 전송되어 한글 처리를 따로 한다.
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
		
		// 주석 사유 : html5 페이지의 Upload Path를 기존okjsp의 Upload Path와 같게 설정할 필요가 있어 UPDIR_HTML5 로 재설정 합니다.
		//String filePath = getServletContext().getRealPath(request.getContextPath()) + uploadBase + "/" + maskname;
		String filePath = Navigation.getPath("UPDIR_HTML5") + "/" + maskname;	// 기존OKJSP의 Upload 폴더
		
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