package com.koreait.webboard.common.paging;

public class PageCriteria {
	private int page; //현재 페이지
	private int pageSize; // 한페이지에 표시될 게시글의 수
	private int pageStart;
	
	//기본생성자 정의
	//기본 객체 생성시 초기값을 지정한다 (1 페이지에서 10개)
	public PageCriteria() {
		this.page = 1; // 사용자가 직접 정의하지 않으면 1
		this.pageSize = 10; // 페이지당 10개씩 출력
	}

	public int getPageStart() {
		pageStart = (this.page - 1) * this.pageSize;
		return (this.page - 1) * this.pageSize;
	}
	
	//현재 페이지의 getter, setter
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		//사용자의 URL직접 입력 등 잘못된 페이지로 이동시 페이지를 1로 재설정
		if(page < 1) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	
	//페이지 사이즈의 getter, setter
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
			this.pageSize = 10;
	}
	
}
