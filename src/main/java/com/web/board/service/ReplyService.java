package com.web.board.service;

import java.util.List;

import com.web.board.vo.ReplyVO;

public interface ReplyService {
	
	void insertReply(ReplyVO vo);
	
	List<ReplyVO> selectReply(ReplyVO vo);
	
	void updateReply(ReplyVO vo);
	
	void deleteReply(ReplyVO vo);
	
}
