package com.koreait.webboard.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.common.paging.PageCriteriaSearch;
import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.service.BoardService;
import com.koreait.webboard.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> selectAllBoard(PageCriteriaSearch pc) {
		return boardDAO.selectAllBoard(pc);
	}
	
	@Override
	public int boardTotalCount(PageCriteriaSearch pc) {
		return boardDAO.boardTotalCount(pc);
	}
	
	@Override
	public BoardVO selectBoard(BoardVO vo) {
		return boardDAO.selectBoard(vo);
	}
	
	@Override
	public void updateReadCount(BoardVO vo) {
		boardDAO.updateReadCount(vo);
	}
	
	@Override
	public int selectLike_log(HashMap<String, Object> map) {
		return boardDAO.selectLike_log(map);
	}
	
	@Override
	public void insertLike_log(HashMap<String, Object> map) {
		boardDAO.insertLike_log(map);
	}
	
	@Override
	public void updateLike(BoardVO vo) {
		boardDAO.updateLike(vo);
	}
	
	@Override
	public void updateHate(BoardVO vo) {
		boardDAO.updateHate(vo);
	}
	
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public List<BoardVO> selectNotice() {
		return boardDAO.selectNotice();
	}

}
