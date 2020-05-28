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
	
	@RequestMapping("/board/selectReply")
	@ResponseBody
	public List<ReplyVO> selectReply(BoardVO vo) {
		return replyService.selectReply(vo);
	}
	
	@RequestMapping("/board/insertReply")
	public void insertReply(ReplyVO vo) {
		replyService.insertReply(vo);
	}

	@RequestMapping("/board/deleteReply")
	public void deleteReply(ReplyVO vo) {
		replyService.deleteReply(vo);
	}

}
