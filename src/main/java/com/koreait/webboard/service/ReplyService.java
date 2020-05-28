package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> selectReply(BoardVO vo);
	
	void insertReply(ReplyVO vo);
	
	void deleteReply(ReplyVO vo);
	
}
