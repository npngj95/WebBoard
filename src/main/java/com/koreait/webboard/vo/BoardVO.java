package com.koreait.webboard.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int b_num;
	private String b_category;
	private String b_writer;
	private String b_email;
	private String b_title;
	private String b_content;
	private Timestamp b_regdate;
	private int b_readcount;
	private int b_replycount;
	private int b_like;
	private int b_hate;

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_email) {
		this.b_email = b_email;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Timestamp getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_readcount() {
		return b_readcount;
	}

	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}

	public int getB_replycount() {
		return b_replycount;
	}

	public void setB_replycount(int b_replycount) {
		this.b_replycount = b_replycount;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}

	public int getB_hate() {
		return b_hate;
	}

	public void setB_hate(int b_hate) {
		this.b_hate = b_hate;
	}

	@Override
	public String toString() {
		return "BoardVO [b_num=" + b_num + ", b_category=" + b_category + ", b_writer=" + b_writer + ", b_email="
				+ b_email + ", b_title=" + b_title + ", b_content=" + b_content + ", b_regdate=" + b_regdate
				+ ", b_readcount=" + b_readcount + ", b_replycount=" + b_replycount + ", b_like=" + b_like + ", b_hate="
				+ b_hate + "]";
	}

}
