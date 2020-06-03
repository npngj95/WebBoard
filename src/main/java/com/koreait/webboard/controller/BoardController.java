package com.koreait.webboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koreait.webboard.common.paging.PageCriteriaSearch;
import com.koreait.webboard.common.paging.PageMaker;
import com.koreait.webboard.service.BoardService;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.UsersVO;

@Controller
@SessionAttributes("url")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private PageMaker pageMaker;
	
	// Home - index
	@RequestMapping({"/", "/index"})
	public String home(Model model, PageCriteriaSearch pageCriteria) {
		pageMaker.setPc(pageCriteria);
		pageMaker.setTotalCount(boardService.boardTotalCount(pageCriteria));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", boardService.selectAllBoard(pageCriteria));
		
		// readBoard에서 index로 돌아갈 때 사용
		String url = pageMaker.makeQuery(pageCriteria.getPage()) +"&sort="+pageCriteria.getSort();
		model.addAttribute("url", url);
		
		if (pageCriteria.getPage() == 1) {
			model.addAttribute("noticeList", boardService.selectNotice());
		}
		
		return "index";
	}
	
	// 게시판 글 상세보기
	@RequestMapping("/board/readBoard")
	public String selectBoard(BoardVO vo, Model model) {
		boardService.updateReadCount(vo);
		model.addAttribute("board", boardService.selectBoard(vo));
		
		return "board/readBoard";
	}
	
	// 게시판 글 좋아요 기능
	@RequestMapping("/board/updateLike")
	@ResponseBody
	public String updateLike(BoardVO vo, HttpSession session) {
		UsersVO user = (UsersVO)session.getAttribute("users");
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("users", user.getU_id());
		map.put("board", vo.getB_num());
		
		if(boardService.selectLike_log(map) < 1) {	// 아직 추천 X
			boardService.updateLike(vo); // 해당 글의 추천수를 1증가
			boardService.insertLike_log(map); // 추천한 유저ID와 글번호를 하나의 Entry로 DB에 저장 
		} else { // 이미 추천했으면 if문을 수행하지 않음
			vo = boardService.selectBoard(vo);
		}
		
		return String.valueOf(vo.getB_like());
	}

	// 게시판 글 싫어요 기능
	@RequestMapping("/board/updateHate")
	@ResponseBody
	public String updateHate(BoardVO vo, HttpSession session) {
		UsersVO user = (UsersVO)session.getAttribute("users");
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("users", user.getU_id());
		map.put("board", vo.getB_num());
		
		if(boardService.selectLike_log(map) < 1) {	// 아직 추천 X
			boardService.updateHate(vo); // 해당 글의 추천수를 1증가
			boardService.insertLike_log(map); // 추천한 유저ID와 글번호를 하나의 Entry로 DB에 저장 
		} else { // 이미 추천했으면 if문을 수행하지 않음
			vo = boardService.selectBoard(vo);
		}
		
		return String.valueOf(vo.getB_hate());
	}
	
	// 게시판 글 쓰기
	@RequestMapping(value="/board/writeBoard", method=RequestMethod.GET)
	public String insertBoard() {
		return "board/writeBoard";
	}
	
	@RequestMapping(value="/board/writeBoard", method=RequestMethod.POST)
	public String insertBoard(BoardVO vo) {
		boardService.insertBoard(vo);
		System.out.println(vo);
		return "redirect:readBoard?b_num=" + vo.getB_num();
	}
	
	// 게시판 글 수정
	@RequestMapping(value="/board/updateBoard", method=RequestMethod.GET)
	public String updateBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.selectBoard(vo));
		return "board/updateBoard";
	}
	
	@RequestMapping(value="/board/updateBoard", method=RequestMethod.POST)
	public String updateBoard(BoardVO vo) {
		boardService.updateBoard(vo);
		return "redirect:readBoard?b_num=" + vo.getB_num();
	}
	
	// 게시판 글 삭제
	@RequestMapping("/board/deleteBoard")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/index";
	}
	
}
