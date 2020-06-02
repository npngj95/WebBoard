package com.koreait.webboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.koreait.webboard.service.AdminService;
import com.koreait.webboard.vo.AdminVO;

@Controller
@SessionAttributes("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
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

}
