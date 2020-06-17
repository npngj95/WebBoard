package com.koreait.webboard.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.common.paging.PageMaker;
import com.koreait.webboard.service.AdminService;
import com.koreait.webboard.vo.AdminVO;
import com.koreait.webboard.vo.BoardVO;

@Controller
@SessionAttributes("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private PageMaker pageMaker;
	
	// 관리자 메인
	@RequestMapping("/admin/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	// 관리자 로그인(GET)
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminLogin() {
		return "admin/adminLogin";
	}
	// 관리자 로그인(POST)
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public String adminLogin(AdminVO vo, Model model) {
		AdminVO admin = adminService.adminCheck(vo);
		
		if(admin != null) {
			model.addAttribute("admin", admin);
			return "redirect:adminMain";
		} else {
			model.addAttribute("alert", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			return "admin/adminLogin";
		}
	}
	
	// 관리자 로그아웃
	@RequestMapping("/admin/logout")
	public String adminLogout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:login";
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 공지 관리
	@RequestMapping("/admin/managementNotice")
	public String managementNotice(Model model) {
		model.addAttribute("noticeList", adminService.selectNoticeList());
		return "admin/managementNotice";
	}
	
	// 공지 작성(GET)
	@RequestMapping(value="/admin/writeNotice", method=RequestMethod.GET)
	public String writeNotice() {		
		return "admin/writeNotice";
	}
	// 공지 작성(POST)
	@RequestMapping(value="/admin/writeNotice", method=RequestMethod.POST)
	public String writeNotice(BoardVO vo) {
		adminService.writeNotice(vo);
		return "redirect:managementNotice";
	}
	
	// 공지 수정(GET)
	@RequestMapping(value="/admin/updateNotice", method=RequestMethod.GET)
	public String updateNotice(Model model, BoardVO vo) {
		model.addAttribute("notice", adminService.selectNotice(vo));
		return "/admin/updateNotice";
	}
	// 공지 수정(POST)
	@RequestMapping(value="/admin/updateNotice", method=RequestMethod.POST)
	public String updateNotice(BoardVO vo) {
		adminService.updateNotice(vo);
		return "redirect:managementNotice";
	}
	
	// 공지 삭제(CheckBox 활용)
	@RequestMapping("/admin/deleteNoticeList")
	public String deleteNoticeList(HttpServletRequest request) {
		List<String> b_numList = new ArrayList<>();
		
		String[] tmp = request.getParameterValues("b_numList");
		for (int i = 0; i < tmp.length; i++) {
			b_numList.add(tmp[i]);
		}
		adminService.deleteNoticeList(b_numList);
		
		return "redirect:managementNotice";
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 유저 관리
	@RequestMapping("/admin/managementUser")
	public String selectAllUsers(Model model,  PageCriteria pc) {
		pageMaker.setPc(pc);
		pageMaker.setTotalCount(adminService.userTotalCount(pc));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", adminService.selectAllUser(pc));
		
		return "admin/managementUser";
	}
	
	// 유저 탈퇴(CheckBox 활용)
	@RequestMapping("/admin/deleteUserList")
	public String deleteUserList(HttpServletRequest request) {
		List<String> u_idList = new ArrayList<>();
		
		String[] tmp = request.getParameterValues("u_idList");
		for (int i = 0; i < tmp.length; i++) {
			u_idList.add(tmp[i]);
		}
		adminService.deleteUserList(u_idList);
		
		return "redirect:managementUser";
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 게시글 관리
	@RequestMapping("/admin/managementBoard")
	public String selectAllBoards(Model model, PageCriteria pc) {
		pageMaker.setPc(pc);
		pageMaker.setTotalCount(adminService.boardTotalCount(pc));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", adminService.selectAllBoard(pc));
		
		return "admin/managementBoard";
	}
	
	// 게시글 삭제(CheckBox 활용)
	@RequestMapping("/admin/deleteBoardList")
	public String deleteBoardList(HttpServletRequest request) {
		List<String> b_numList = new ArrayList<>();
		
		String[] tmp = request.getParameterValues("b_numList");
		for (int i = 0; i < tmp.length; i++) {
			b_numList.add(tmp[i]);
		}
		adminService.deleteBoardList(b_numList);
		
		return "redirect:managementBoard";
	}
}
