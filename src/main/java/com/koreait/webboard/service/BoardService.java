package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.vo.BoardVO;

public interface BoardService {

	BoardVO selectBoard(BoardVO vo);
	
	//BoardVO 안에 정렬조건, 검색조건, 검색키워드를 포함하여 vo로 받고
	//페이징에 필요한 Limit 절의 시작Row를 start 변수에 할당
	//페이징에 필요한 Limit 절의 크기를 size 변수에 할당
	List<BoardVO> selectAllBoard(BoardVO vo, int start, int size);
	
	void insertBoard(BoardVO vo);
	
	int boardTotalCount();
	
	void updateBoard(BoardVO vo);
	
	void deleteBoard(BoardVO vo);
}
