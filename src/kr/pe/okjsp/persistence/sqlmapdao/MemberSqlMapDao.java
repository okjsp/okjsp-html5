package kr.pe.okjsp.persistence.sqlmapdao;

import java.util.List;

import kr.pe.okjsp.domain.Member;
import kr.pe.okjsp.persistence.iface.MemberDao;

import org.springframework.stereotype.Repository;

@Repository
public class MemberSqlMapDao extends BaseSqlMapDao implements MemberDao {

	public Object insertMember(Member member) {
		return insert("Member.insert", member);
	}

	public Member getMember(String id) {
		return (Member) queryForObject("Member.getById", id);
	}

	@SuppressWarnings("unchecked")
	public List<Member> searchMember() {
		return queryForList("Member.list");
	}

	public int updateMember(Member member) {
		return update("Member.update", member);
	}

	public int deleteMember(String id) {
		return delete("Member.deleteById", id);
	}
}
