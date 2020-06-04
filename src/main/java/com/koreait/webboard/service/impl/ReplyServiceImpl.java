package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.dao.ReplyDAO;
import com.koreait.webboard.service.ReplyService;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<ReplyVO> selectReply(BoardVO vo) {
		return replyDAO.selectReply(vo);
	}
	
	@Override
	public void insertReply(ReplyVO vo) {
		replyDAO.insertReply(vo);
		BoardVO board = new BoardVO();
		board.setB_num(vo.getB_num());
		boardDAO.updateReplyCount(board);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		replyDAO.deleteReply(vo);
	}
	
}
