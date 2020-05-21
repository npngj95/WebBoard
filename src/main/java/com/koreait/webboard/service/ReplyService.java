package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.vo.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> selectReply(ReplyVO vo);
	
	void insertReply(ReplyVO vo);
	
	void updateReply(ReplyVO vo);
	
	void deleteReply(ReplyVO vo);
	
}
