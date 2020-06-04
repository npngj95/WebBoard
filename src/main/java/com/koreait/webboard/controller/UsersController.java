package com.koreait.webboard.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	// 로그인 (로그인한 후, index가 아닌 로그인을 하기 전 페이지로 돌아가게 구현) == 쿠키사용
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String prevUrl = request.getHeader("referer"); //요청된 이전 페이지의 URL을 구함
		String serverPath = request.getContextPath() + "/"; //최상위 서버 path 이름을 지정 ("/WebBoard" + "/" : subString시의 시작인덱스를 구하기위해 + "/"를 함)
		String moveUrl = prevUrl.substring(prevUrl.indexOf(serverPath)+serverPath.length()); //이동할 URL 주소를 잘라냄 
		
		if(moveUrl.equals("")) {	// localhost/{serverPath}/ 로 들어왔을 때
			moveUrl = "index";
		}
		
		response.addCookie(new Cookie("moveUrl", moveUrl)); //잘라낸 URL을 쿠키에 추가
		
		
//		----------------------
//		UsersVO vo = new UsersVO();
//		Cookie[] cookies = request.getCookies();
//		for(Cookie c : cookies) {
//			if(c.getName().equals("u_id")) vo.setU_id(c.getValue());
//			if(c.getName().equals("u_pwd")) vo.setU_pwd(c.getValue());
//			response.addCookie(c);
//			
//			
//		} 
//		
//		if() return "redirect:login";
//		else return "user/login";
//		----------------------
		
		
		return "user/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UsersVO vo, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam boolean rememberMe) {
		String moveUrl = "";
		Cookie[] cookies = request.getCookies(); //로그인 페이지에서 얻을 수 있는 모든 쿠키획득
		
		UsersVO user = usersService.usersCheck(vo);
		
		if(user != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("moveUrl")) { //이동 URL을 저장하는 쿠키일때
					moveUrl = c.getValue();
					c.setMaxAge(0); //setMaxAge(0) == 삭제될 쿠키로 설정
					response.addCookie(c); // response에 추가해서 쿠키에 설정된 옵션들 처리(삭제)
				}
			}
			model.addAttribute("users", user);
			
			
			
//			----------------------
			if(rememberMe) {
				Cookie u_id = new Cookie("u_id", user.getU_id());
				Cookie u_pwd = new Cookie("u_pwd", user.getU_pwd());
				
				u_id.setMaxAge(60*60*24*10); // 초 * 분 * 시 * 일
				u_pwd.setMaxAge(60*60*24*10); // 초 * 분 * 시 * 일
				
				response.addCookie(u_id);
				response.addCookie(u_pwd);
			}
//			----------------------
			
			
			
			
			
			return "redirect:" + moveUrl;
		} else {
			model.addAttribute("alert", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			return "user/login";
		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpServletRequest request) {
		String prevUrl = request.getHeader("referer");
		String serverPath = request.getContextPath() + "/"; 
		String moveUrl = prevUrl.substring(prevUrl.indexOf(serverPath)+serverPath.length());  

		if(moveUrl.equals("")) { // localhost/{serverPath}/ 로 들어왔을 때
			moveUrl = "index";
		}
		
		sessionStatus.setComplete();
		return "redirect:" + moveUrl;
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
	
	// 아이디 중복 체크 - Ajax처리
	@RequestMapping(value="/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String u_id) {
		return usersService.idCheck(u_id);
	}
	
	// 유저 비밀번호 체크
	@RequestMapping(value="/user/usersCheck")
	@ResponseBody
	public String usersCheck(UsersVO vo) {
		UsersVO user = usersService.usersCheck(vo);
		
		if(user != null) {
			return "1";
		} else {
			return "0";
		}
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
	public String updatePwd(UsersVO vo, HttpSession session) {
		UsersVO user = (UsersVO)session.getAttribute("users");
		user.setU_pwd(vo.getU_pwd());
		usersService.updatePwd(user);
		
		return "redirect:/user/selectUser";
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
	
	
}
