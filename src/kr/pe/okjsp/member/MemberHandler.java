package kr.pe.okjsp.member;

import javax.servlet.ServletContext;

public class MemberHandler {

	public int doLogin(Member member) {
		try {
			MemberDao.getInstance().login(member);

			if (member.getSid() > 0) {
				return 1;
			}
			else {
				return 2;
			}
		}
		catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}
}
