package com.koreait.webboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.koreait.webboard.service.UsersService;
import com.koreait.webboard.vo.UsersVO;

@Controller
@SessionAttributes("users") 
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	// 관리자 - 유저 정보보기
	@RequestMapping("/admin/userManagement")
	public String selectAllUsers(Model model) {
		model.addAttribute("usersList", usersService.selectAllUsers());
		return "admin/managementUser";
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UsersVO vo, HttpSession session, Model model) {
		UsersVO user = usersService.login(vo);
		
		if(user != null) {
			session.setAttribute("users", usersService.login(vo));
			return "redirect:index";
		} else {
			model.addAttribute("alert", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			return "user/login";
		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:index";
	}
	
	// 회원가입
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "user/signUp";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String insertUsers(UsersVO vo) {
		usersService.insertUsers(vo);	
		return "redirect:index";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String u_id) {
		return usersService.idCheck(u_id);
	}
	
	// 유저 정보 조회
	@RequestMapping(value="/user/selectUser")
	public String selectUsers(HttpSession session, UsersVO vo, Model model) {
		vo = (UsersVO) session.getAttribute("users");
		model.addAttribute("users", usersService.selectUsers(vo)); 
		return "user/selectUser";
	}
	
	// 유저 비밀번호 수정
	@RequestMapping(value="/user/updatePwd", method=RequestMethod.GET)
	public String updatePwd() {
		return "user/updatePwd";
	}
	
	@RequestMapping(value="/user/updatePwd", method=RequestMethod.POST)
	public String updatePwd(UsersVO vo) {
		return "user/updatePwd";
	}
	
	// 유저 정보수정
	@RequestMapping(value="/user/updateUser", method=RequestMethod.GET)
	public String updateUser() {
		return "user/updateUser";
	}
	
	@RequestMapping(value="/user/updateUser", method=RequestMethod.POST)
	public String updateUsers(UsersVO vo) {
		usersService.updateUsers(vo);
		return "redirect:/user/selectUser";
	}
	
	@RequestMapping("/user/deleteUser")
	public String deleteUsers(UsersVO vo, SessionStatus sessionStatus) {
		usersService.deleteUsers(vo);
		sessionStatus.setComplete();
		
		return "redirect:/index";
	}

	public String deleteUsers(List<UsersVO> usersList) {
		usersService.deleteUsers(usersList);
		return null;
	}
	
}
