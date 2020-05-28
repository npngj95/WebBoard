﻿package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.dao.ReplyDAO;
import com.koreait.webboard.service.ReplyService;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public List<ReplyVO> selectReply(BoardVO vo) {
		return replyDAO.selectReply(vo);
	}
	
	@Override
	public void insertReply(ReplyVO vo) {
		replyDAO.insertReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		replyDAO.deleteReply(vo);
	}

}
