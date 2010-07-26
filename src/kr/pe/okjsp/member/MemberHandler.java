package kr.pe.okjsp.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.builder.ToStringBuilder;

public class MemberHandler {

	public int doLogin(HttpServletRequest request, Member member) {
		try {
			Member m = MemberDao.getInstance().login(member);
			if (m != null && m.getSid() > 0) {
				m.setRole(RoleDao.getInstance().getRoles(m.getId()));

				System.out.println(ToStringBuilder.reflectionToString(m));

				request.getSession().setAttribute("member", m);
				return 1;
			}
			else {
				throw new RuntimeException("회원정보가 잘못 입력되었습니다.");
			}
		}
		catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}
}
