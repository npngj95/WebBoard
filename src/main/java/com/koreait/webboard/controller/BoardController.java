package com.koreait.webboard.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.common.paging.PageMaker;
import com.koreait.webboard.service.BoardService;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.UserVO;

@Controller
@SessionAttributes("url")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private PageMaker pageMaker;
	
	// Home, index
	@RequestMapping({"/", "/index"})
	public String home(Model model, PageCriteria pageCriteria) {
		pageMaker.setPc(pageCriteria);
		pageMaker.setTotalCount(boardService.boardTotalCount(pageCriteria));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", boardService.selectAllBoard(pageCriteria));
		
		// readBoard에서 index로 돌아갈 때 사용
		String url = pageMaker.makeQuery(pageCriteria.getPage()) +"&sort="+pageCriteria.getSort();
		model.addAttribute("url", url);
		
		if (pageCriteria.getPage() == 1) {
			model.addAttribute("noticeList", boardService.userSelectNoticeList());
		}
		
		return "index";
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 게시글 상세보기
	@RequestMapping("/board/readBoard")
	public String selectBoard(BoardVO vo, Model model) {
		boardService.updateReadCount(vo);
		model.addAttribute("board", boardService.selectBoard(vo));
		
		return "board/readBoard";
	}
	
	// 게시글 작성(GET)
	@RequestMapping(value="/board/writeBoard", method=RequestMethod.GET)
	public String insertBoard() {
		return "board/writeBoard";
	}
	// 게시글 작성(POST)
	@RequestMapping(value="/board/writeBoard", method=RequestMethod.POST)
	public String insertBoard(BoardVO vo) {
		boardService.insertBoard(vo);
		return "redirect:readBoard?b_num=" + vo.getB_num();
	}
	
	// 게시글 수정(GET)
	@RequestMapping(value="/board/updateBoard", method=RequestMethod.GET)
	public String updateBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.selectBoard(vo));
		return "board/updateBoard";
	}
	// 게시글 수정(POST)
	@RequestMapping(value="/board/updateBoard", method=RequestMethod.POST)
	public String updateBoard(BoardVO vo) {
		boardService.updateBoard(vo);
		return "redirect:readBoard?b_num=" + vo.getB_num();
	}
	
	// 게시글 삭제
	@RequestMapping("/board/deleteBoard")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/index";
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 게시글 좋아요 기능
	@RequestMapping("/board/updateLike")
	@ResponseBody
	public String updateLike(BoardVO vo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("user", user.getU_id());
		map.put("board", vo.getB_num());
		
		if(boardService.selectLike_log(map) < 1) {	// 아직 추천 X
			boardService.updateLike(vo, map); // 해당 글의 추천수를 1증가, 추천한 유저ID와 글번호를 하나의 Entry로 DB에 저장 
		} else { // 이미 추천했으면 if문을 수행하지 않음
			vo = boardService.selectBoard(vo);
		}
		
		return String.valueOf(vo.getB_like());
	}

	// 게시글 싫어요 기능
	@RequestMapping("/board/updateHate")
	@ResponseBody
	public String updateHate(BoardVO vo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("user", user.getU_id());
		map.put("board", vo.getB_num());
		
		if(boardService.selectLike_log(map) < 1) {	// 아직 추천 X
			boardService.updateHate(vo, map); // 해당 글의 추천수를 1증가, 추천한 유저ID와 글번호를 하나의 Entry로 DB에 저장
		} else { // 이미 추천했으면 if문을 수행하지 않음
			vo = boardService.selectBoard(vo);
		}
		
		return String.valueOf(vo.getB_hate());
	}
}
