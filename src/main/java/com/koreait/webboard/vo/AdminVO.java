package com.koreait.webboard.vo;

public class AdminVO {
	private String a_id;
	private String a_pwd;

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pwd() {
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}

	@Override
	public String toString() {
		return "AdminVO [a_id=" + a_id + ", a_pwd=" + a_pwd + "]";
	}
}
