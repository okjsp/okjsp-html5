package kr.pe.okjsp.persistence;

import java.util.List;

import kr.pe.okjsp.domain.Member;

public interface MemberDao {
	Object insertMember(Member member);

	Member getMember(String id);

	List<Member> searchMember();

	int updateMember(Member member);

	int deleteMember(String id);
}
