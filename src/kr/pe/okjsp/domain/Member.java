package kr.pe.okjsp.domain;

import java.io.Serializable;

public class Member implements Serializable {
	private static final long serialVersionUID = 5746836969712170384L;

	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
