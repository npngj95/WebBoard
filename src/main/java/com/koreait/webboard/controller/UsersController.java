package com.koreait.webboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.koreait.webboard.service.UsersService;
import com.koreait.webboard.vo.UsersVO;

@Controller
@SessionAttributes("users") 
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/admin/userManagement")
	public String selectAllUsers(Model model) {
		model.addAttribute("usersList", usersService.selectAllUsers());
		return "admin/managementUser";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UsersVO vo, HttpSession session) {
		session.setAttribute("users", usersService.login(vo));
		return "redirect:index";
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:index";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String signUp() {
		return "redirect:index";
	}
	
	@RequestMapping(value="/user/selectUser")
	public String selectUsers(HttpSession session, UsersVO vo, Model model) {
		vo = (UsersVO) session.getAttribute("users");
		model.addAttribute("users", usersService.selectUsers(vo)); 
		return "user/selectUser";
	}
	
	@RequestMapping(value="/user/insertUser")
	public String insertUsers(UsersVO vo) {
		usersService.insertUsers(vo);
		return "redirect:/user/selectUser";
	}

	@RequestMapping(value="/user/updateUser")
	public String updateUsers(UsersVO vo) {
		usersService.updateUsers(vo);
		return "redirect:/user/selectUser";
	}

	public String deleteUsers(UsersVO vo) {
		usersService.deleteUsers(vo);
		return null;
	}

	public String deleteUsers(List<UsersVO> usersList) {
		usersService.deleteUsers(usersList);
		return null;
	}
	
}
