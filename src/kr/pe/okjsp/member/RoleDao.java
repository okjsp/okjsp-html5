package kr.pe.okjsp.member;

import java.sql.SQLException;
import java.util.ArrayList;

import kr.pe.okjsp.BaseDao;

public class RoleDao extends BaseDao {
	private static RoleDao instance = new RoleDao();

	public static RoleDao getInstance() {
		return instance;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<String> getRoles(String id) throws SQLException {
		return (ArrayList<String>) getSqlMapper().queryForList("Role.listById", id);
	}
}
