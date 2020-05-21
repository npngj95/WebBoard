package com.koreait.webboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
		
	// Home - index
	@RequestMapping("/index")
	public String home() {
		return "index";
	}
	
	// 관리자 페이지
	@RequestMapping("/admin/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	// 유저 페이지
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "user/signUp";
	}
	
	@RequestMapping(value="/user/updatePwd", method=RequestMethod.GET)
	public String updatePwd() {
		return "user/updatePwd";
	}
	
	@RequestMapping(value="/user/updateUser", method=RequestMethod.GET)
	public String updateUser() {
		return "user/updateUser";
	}
	
	// 게시판 페이지
	@RequestMapping(value="/board/writeBoard", method=RequestMethod.GET)
	public String writeBoard() {
		return "board/writeBoard";
	}
	
}
