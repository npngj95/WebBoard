package com.koreait.webboard.vo;

import java.sql.Timestamp;

public class UserVO {
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_email;
	private String u_gender;
	private Timestamp u_inputdate;
	private Timestamp u_logindate;
	private String u_status;
	private String u_email_code;

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public Timestamp getU_inputdate() {
		return u_inputdate;
	}

	public void setU_inputdate(Timestamp u_inputdate) {
		this.u_inputdate = u_inputdate;
	}

	public Timestamp getU_logindate() {
		return u_logindate;
	}

	public void setU_logindate(Timestamp u_logindate) {
		this.u_logindate = u_logindate;
	}

	public String getU_status() {
		return u_status;
	}

	public void setU_status(String u_status) {
		this.u_status = u_status;
	}

	public String getU_email_code() {
		return u_email_code;
	}

	public void setU_email_code(String u_email_code) {
		this.u_email_code = u_email_code;
	}

	@Override
	public String toString() {
		return "UserVO [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_name=" + u_name + ", u_email=" + u_email
				+ ", u_gender=" + u_gender + ", u_inputdate=" + u_inputdate + ", u_logindate=" + u_logindate
				+ ", u_status=" + u_status + ", u_email_code=" + u_email_code + "]";
	}

}
