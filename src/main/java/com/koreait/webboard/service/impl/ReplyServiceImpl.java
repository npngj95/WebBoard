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
		boardDAO.upReplyCount(vo);		//board테이블 댓글수 증가
		replyDAO.insertReply(vo);		//댓글테이블에 댓글 삽입
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		boardDAO.downReplyCount(vo);	//board테이블 댓글수 감소 (서브쿼리 사용)
		replyDAO.deleteReply(vo);		//댓글테이블에 댓글 삭제
	}
	
}
