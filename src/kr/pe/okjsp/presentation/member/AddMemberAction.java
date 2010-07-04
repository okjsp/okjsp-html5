package kr.pe.okjsp.presentation.member;

import kr.pe.okjsp.domain.Member;
import kr.pe.okjsp.service.iface.MemberService;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class AddMemberAction extends ActionSupport {
	private static final long serialVersionUID = -1527465406932098273L;

	@Autowired
	private MemberService memberService;

	private Member member;

	@Override
	public String input() {
		LogFactory.getLog(AddMemberAction.class).error(memberService);

		return INPUT;
	}

	@Override
	public String execute() {
		if (memberService.insertMember(member) != null) {
			return SUCCESS;
		}
		return ERROR;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}
