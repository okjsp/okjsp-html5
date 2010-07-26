package kr.pe.okjsp.member;

import java.sql.SQLException;

import kr.pe.okjsp.BaseDao;

public class MemberDao extends BaseDao {
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public Member login(Member member) throws SQLException {
		return (Member) getSqlMapper().queryForObject("Member.login", member);
	}
}
