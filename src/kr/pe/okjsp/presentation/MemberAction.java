package kr.pe.okjsp.presentation;

import kr.pe.okjsp.domain.Member;

import com.opensymphony.xwork2.ActionSupport;

public class MemberAction extends ActionSupport {
	private static final long serialVersionUID = -175238915802463501L;

	private Member member;

	public String login() {
		return SUCCESS;
	}

	public String addMember() {
		return SUCCESS;
	}

	public String updateMember() {
		return SUCCESS;
	}

	public String deleteMember() {
		return SUCCESS;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}
