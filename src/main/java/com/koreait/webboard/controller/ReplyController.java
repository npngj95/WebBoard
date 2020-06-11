package com.koreait.webboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.webboard.service.ReplyService;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	// 해당 글의 댓글 작성
	@RequestMapping("/board/writeReply")
	@ResponseBody
	public void insertReply(ReplyVO vo) {
		replyService.insertReply(vo);
	}
	
	// 해당 글의 댓글 조회
	@RequestMapping("/board/selectReply")
	@ResponseBody
	public List<ReplyVO> selectReply(BoardVO vo) {
		return replyService.selectReply(vo);
	}
	
	// 해당 글의 댓글 삭제
	@RequestMapping("/board/deleteReply")
	@ResponseBody
	public void deleteReply(ReplyVO vo) throws Exception{
		replyService.deleteReply(vo);
	}

}
