package kr.pe.okjsp.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MemberHandler {

	public int doLogin(Member member) {
		try {
			MemberDao.getInstance().login(member);
			return 0;
		}
		catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	public static void main(String[] args) throws Exception {
		Class.forName("cubrid.jdbc.driver.CUBRIDDriver");

		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection("jdbc:cubrid:www.okjsp.pe.kr:33000:db_test:::", "dba", "okpass");
			stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select old_password(password) from okmember");
			rs.next();
			
			System.out.println(rs.getString(1));
		}
		finally {
			stmt.close();
			conn.close();
		}
	}
}
