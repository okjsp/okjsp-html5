package kr.pe.okjsp.member;

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
}
