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
	private int b_recommend;
	private int b_report;
	
	//Non-Mapping Variable (정렬조건 / 검색조건 / 검색키워드)
	private String b_sort;
	private String b_searchCondition;
	private String b_searchKeyword;
	
	public String getB_sort() {
		return b_sort;
	}
	public void setB_sort(String b_sort) {
		this.b_sort = b_sort;
	}
	public String getB_searchCondition() {
		return b_searchCondition;
	}
	public void setB_searchCondition(String b_searchCondition) {
		this.b_searchCondition = b_searchCondition;
	}
	public String getB_searchKeyword() {
		return b_searchKeyword;
	}
	public void setB_searchKeyword(String b_searchKeyword) {
		this.b_searchKeyword = b_searchKeyword;
	}
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
	public int getB_recommend() {
		return b_recommend;
	}
	public void setB_recommend(int b_recommend) {
		this.b_recommend = b_recommend;
	}
	public int getB_report() {
		return b_report;
	}
	public void setB_report(int b_report) {
		this.b_report = b_report;
	}
	
	@Override
	public String toString() {
		return "BoardVO [b_num=" + b_num + ", b_category=" + b_category + ", b_writer=" + b_writer + ", b_email="
				+ b_email + ", b_title=" + b_title + ", b_content=" + b_content + ", b_regdate=" + b_regdate
				+ ", b_readcount=" + b_readcount + ", b_replycount=" + b_replycount + ", b_recommend=" + b_recommend
				+ ", b_report=" + b_report + ", b_sort=" + b_sort + ", b_searchCondition=" + b_searchCondition
				+ ", b_searchKeyword=" + b_searchKeyword + "]";
	}
}
