package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.dao.ReplyDAO;
import com.koreait.webboard.service.ReplyService;
import com.koreait.webboard.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public List<ReplyVO> selectReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void insertReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

}
