package kr.pe.okjsp.presentation.member;

import org.springframework.beans.factory.annotation.Autowired;

import kr.pe.okjsp.domain.Member;
import kr.pe.okjsp.service.iface.MemberService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = -175238915802463501L;

	@Autowired
	private MemberService memberService;

	private Member member;

	@Override
	public String execute() {
		Member expected = memberService.getMember(member.getId());
		if (expected == null) {
			return INPUT;
		}
		if (!member.getPassword().equals(expected.getPassword())) {
			return INPUT;
		}

		ActionContext.getContext().getSession().put("INFO", expected);

		return SUCCESS;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}
