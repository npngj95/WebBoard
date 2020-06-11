package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

public interface ReplyService {
	
	void insertReply(ReplyVO vo);

	List<ReplyVO> selectReply(BoardVO vo);
	
	void deleteReply(ReplyVO vo) throws Exception;
	
}
