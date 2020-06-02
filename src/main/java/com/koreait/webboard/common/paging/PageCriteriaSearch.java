package com.koreait.webboard.common.paging;

public class PageCriteriaSearch extends PageCriteria {
	private String condition;
	private String keyword;
	private String sort="b_regdate";

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "PageCriteriaSearch [condition=" + condition + ", keyword=" + keyword + ", sort=" + sort
				+ ", toString()=" + super.toString() + "]";
	}

}
