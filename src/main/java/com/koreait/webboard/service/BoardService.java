package com.koreait.webboard.service;

import java.util.HashMap;
import java.util.List;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.vo.BoardVO;

public interface BoardService {

	List<BoardVO> userSelectNoticeList();
	
	void insertBoard(BoardVO vo);
	List<BoardVO> selectAllBoard(PageCriteria pc);
	BoardVO selectBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	
	int boardTotalCount(PageCriteria pc);
	void updateReadCount(BoardVO vo);
	int selectLike_log(HashMap<String, Object> map);
	void updateLike(BoardVO vo, HashMap<String, Object> map);
	void updateHate(BoardVO vo, HashMap<String, Object> map);
	
}
