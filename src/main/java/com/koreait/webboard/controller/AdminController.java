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

import com.koreait.webboard.common.paging.PageCriteriaSearch;
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
	
	// 관리자 페이지 (매핑이 필요함)
	@RequestMapping("/admin/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	// 관리자 페이지
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminLogin() {
		
		return "admin/adminLogin";
	}
	
	// 관리자 페이지
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

	@RequestMapping(value="/admin/logout", method=RequestMethod.GET)
	public String selectUsers(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:login";
	}
	
	@RequestMapping("/admin/managementNotice")
	public String managementNotice(Model model) {
		
		model.addAttribute("noticeList", adminService.selectNoticeList());
		
		return "admin/managementNotice";
	}
	
	@RequestMapping(value="/admin/writeNotice", method=RequestMethod.GET)
	public String writeNotice() {		
		return "admin/writeNotice";
	}
	
	@RequestMapping(value="/admin/writeNotice", method=RequestMethod.POST)
	public String writeNotice(BoardVO vo) {
		adminService.writeNotice(vo);
		
		return "redirect:managementNotice";
	}
	
	@RequestMapping(value="/admin/updateNotice", method=RequestMethod.GET)
	public String updateNotice(Model model, BoardVO vo) {
		model.addAttribute("notice", adminService.selectNotice(vo));
		
		return "/admin/updateNotice";
	}
	
	@RequestMapping(value="/admin/updateNotice", method=RequestMethod.POST)
	public String updateNotice(BoardVO vo) {
		adminService.updateNotice(vo);
		
		return "redirect:managementNotice";
	}
	
	
	@RequestMapping("/admin/deleteNoticeList")
	public String deleteNoticeList(HttpServletRequest request) {
		List<String> b_numList = new ArrayList<>();
		
		String[] tmp = request.getParameterValues("b_numList");
		
		for (int i = 0; i < tmp.length; i++) {
			b_numList.add(tmp[i]);
		}
		
		adminService.deleteBoardList(b_numList);
		
		return "redirect:managementNotice";
	}
	
	
	@RequestMapping("/admin/managementUser")
	public String selectAllUsers(Model model,  PageCriteriaSearch pc) {
		pageMaker.setPc(pc);
		pageMaker.setTotalCount(adminService.usersTotalCount(pc));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", adminService.selectAllUsers(pc));
		
		return "admin/managementUser";
	}
	
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
	
	@RequestMapping("/admin/managementBoard")
	public String selectAllBoards(Model model, PageCriteriaSearch pc) {
		pageMaker.setPc(pc);
		pageMaker.setTotalCount(adminService.boardTotalCount(pc));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", adminService.selectAllBoard(pc));
		
		return "admin/managementBoard";
	}
	
	
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
