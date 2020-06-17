package com.koreait.webboard.vo;

import java.sql.Timestamp;

public class ReplyVO {
	private int r_num;
	private String r_writer;
	private String r_content;
	private Timestamp r_regdate;
	private int b_num;

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Timestamp getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Timestamp r_regdate) {
		this.r_regdate = r_regdate;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	@Override
	public String toString() {
		return "ReplyVO [r_num=" + r_num + ", r_writer=" + r_writer + ", r_content=" + r_content + ", r_regdate="
				+ r_regdate + ", b_num=" + b_num + "]";
	}
}
