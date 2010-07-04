package kr.pe.okjsp.service.iface;

import kr.pe.okjsp.domain.Member;

public interface MemberService {
	Object insertMember(Member member);
	
	Member getMember(String id);
}
