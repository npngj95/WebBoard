package com.koreait.webboard.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.service.BoardService;
import com.koreait.webboard.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	// 게시판에서 보여지는 공지글 (
	@Override
	public List<BoardVO> userSelectNoticeList() {
		return boardDAO.userSelectNoticeList();
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	
	@Override
	public List<BoardVO> selectAllBoard(PageCriteria pc) {
		return boardDAO.selectAllBoard(pc);
	}
	
	@Override
	public BoardVO selectBoard(BoardVO vo) {
		return boardDAO.selectBoard(vo);
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
	public int boardTotalCount(PageCriteria pc) {
		return boardDAO.boardTotalCount(pc);
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	
	
	@Override
	public void updateReadCount(BoardVO vo) {
		boardDAO.updateReadCount(vo);
	}
	
	@Override
	public int selectLike_log(HashMap<String, Object> map) {
		return boardDAO.selectLike_log(map);
	}
	
	@Override
	@Transactional
	public void updateLike(BoardVO vo, HashMap<String, Object> map) {
		boardDAO.updateLike(vo);
		boardDAO.insertLike_log(map);
	}
	
	@Override
	@Transactional
	public void updateHate(BoardVO vo, HashMap<String, Object> map) {
		boardDAO.updateHate(vo);
		boardDAO.insertLike_log(map);
	}

}