package com.koreait.webboard.common.paging;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
@Scope("prototype")
public class PageMaker {
	private PageCriteria pc; // page, pageSize를 포함하는 클래스를 필드변수로 가짐
	private int totalCount; // 전체 게시글의 수
	private int startBlock; // 보여지는 블록의 시작 번호
	private int endBlock; // 보여지는 블록의 마지막 번호
	private boolean prev; // 이전버튼을 누를 수 있는지 여부
	private boolean next; // 다음버튼을 누를 수 있는지 여부
	private int blockSize = 10; // 화면하단에 보여지는 블록의 개수
	private int totalBlock;
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData(); //전체 필드 변수들 세팅
					 //전체 게시글 수의 setter가 호출될 때 전체 세팅되도록 함
	}
	
	private void calcData() {
		endBlock = (int)(Math.ceil(pc.getPage() / (double)blockSize)) * blockSize;
		startBlock = (endBlock - blockSize) + 1;
		totalBlock =  (int) (totalCount / (double) pc.getPageSize());
		if(totalCount%pc.getPageSize() != 0)	totalBlock += 1;
		
		if(endBlock > totalBlock) {
			endBlock = totalBlock;
		}
		
		//1 페이지인 경우 이전(false)  
		prev = startBlock == 1 ? false : true;
		next = endBlock * pc.getPageSize() >= totalCount ? false : true;
	}
	
	// jsp에서 페이징 처리를 위해
	// 페이지에 따라 a태그를 이용해서 href 링크를 정의하는 URL경로 설정을 위해 스프링에서 지원하는 UriCommponent객체를 활용
	public String makeQuery(int page) {
		UriComponents uri = null;
		UriComponentsBuilder uriComponent = UriComponentsBuilder.newInstance().queryParam("page", page);
		
		if(((PageCriteria)pc).getKeyword() != null) {
			uriComponent.queryParam("condition", ((PageCriteria)pc).getCondition());
			uriComponent.queryParam("keyword", ((PageCriteria)pc).getKeyword());
		}
		
		uri = uriComponent.build();
		return uri.toString();
	}
	
	public PageCriteria getPc() {
		return pc;
	}

	public void setPc(PageCriteria pc) {
		this.pc = pc;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getTotalCount() {
		return totalCount;
	}
		
	@Override
	public String toString() {
		return "PageMaker [pc=" + pc + ", totalCount=" + totalCount + ", startBlock=" + startBlock + ", endBlock="
				+ endBlock + ", prev=" + prev + ", next=" + next + ", blockSize=" + blockSize + ", totalBlock="
				+ totalBlock + "]";
	}
}