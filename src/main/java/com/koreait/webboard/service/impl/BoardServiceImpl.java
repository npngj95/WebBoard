﻿package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.service.BoardService;
import com.koreait.webboard.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public BoardVO selectBoard(BoardVO vo) {
		return boardDAO.selectBoard(vo);
	}
	
	@Override
	public List<BoardVO> selectAllBoard(BoardVO vo, int start, int size) {
		return boardDAO.selectAllBoard(vo, start, size);
	}
	
	@Override
	public int boardTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

}
