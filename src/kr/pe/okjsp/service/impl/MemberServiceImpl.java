package kr.pe.okjsp.service.impl;

import java.io.Serializable;

import kr.pe.okjsp.domain.Member;
import kr.pe.okjsp.persistence.iface.MemberDao;
import kr.pe.okjsp.service.iface.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService, Serializable {
	private static final long serialVersionUID = -1336437870198163977L;

	@Autowired
	private MemberDao memberDao;

	public Object insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	public Member getMember(String id) {
		return memberDao.getMember(id);
	}
}
