package com.koreait.webboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.webboard.service.BoardService;
import com.koreait.webboard.service.ReplyService;
import com.koreait.webboard.vo.BoardVO;

//@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replySerivce;
	
	public String insertBoard(BoardVO vo) {
		
		return null;
	}
	
	public String selectBoard(BoardVO vo, Model model) {
		
		
		return "asdnkl.do";
	}
	
	public String boardTotalCount() {
		
		return null;
	}
	
	//BoardVO 안에 정렬조건, 검색조건, 검색키워드를 포함하여 vo로 받고
	//페이징에 필요한 Limit 절의 시작Row를 start 변수에 할당
	//페이징에 필요한 Limit 절의 크기를 size 변수에 할당
	public String selectAllBoard(BoardVO vo, int start, int size) {
		
		return null;
	}
	
	public String updateBoard(BoardVO vo) {
		
		return null;
	}
	
	public String deleteBoard(BoardVO vo) {
		
		return null;
	}
}
