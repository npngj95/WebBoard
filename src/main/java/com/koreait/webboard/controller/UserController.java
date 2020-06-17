package com.koreait.webboard.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.koreait.webboard.common.mail.MailAuthKeyGenerator;
import com.koreait.webboard.common.mail.MailHandler;
import com.koreait.webboard.service.UserService;
import com.koreait.webboard.vo.UserVO;

@Controller
@SessionAttributes("user") 
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender mailSender;
	
	// 유저 로그인(GET) : 로그인한 후, index가 아닌 로그인을 하기 전 페이지로 돌아가게 구현 <쿠키 사용>
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(Model model ,HttpServletRequest request, HttpServletResponse response) {
		String moveUrl = "index";
		
		// ------ prevPage ------
		if(request.getHeader("referer") != null) {
			String prevUrl = request.getHeader("referer"); //요청된 이전 페이지의 URL을 구함
			String serverPath = request.getContextPath() + "/"; //최상위 서버 path 이름을 지정 ("/WebBoard" + "/" : subString시의 시작인덱스를 구하기위해 + "/"를 함)
			moveUrl = prevUrl.substring(prevUrl.indexOf(serverPath)+serverPath.length()); //이동할 URL 주소를 잘라냄 
		}
		response.addCookie(new Cookie("moveUrl", moveUrl)); //잘라낸 URL을 쿠키에 추가
		
		// ------ rememberMe ------
		String rememberId = null;
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies) {
			if(c.getName().equals("rememberId")) {
				rememberId = c.getValue();
				response.addCookie(c);
				break;
			}
		}
		model.addAttribute("rememberId", rememberId);
		
		return "user/login";
	}
	
	// 유저 로그인(POST)
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "false") boolean rememberMe) {
		String moveUrl = "";
		Cookie[] cookies = request.getCookies(); //로그인 페이지에서 얻을 수 있는 모든 쿠키획득
		
		UserVO user = userService.userCheck(vo);
		
		if(user != null) {
			if(user.getU_status().equals("inactivate")) {
				// 메일 인증하는 페이지를 하나 만들어 그쪽으로 가게 return
				model.addAttribute("authUser", user);
				
				return "user/authEmailCode"; // url이 login으로 그대로 남음
			} else {
				
				for(Cookie c : cookies) {
					if(c.getName().equals("moveUrl")) { //이동 URL을 저장하는 쿠키일때
						moveUrl = c.getValue();
						c.setMaxAge(0); //setMaxAge(0) == 삭제될 쿠키로 설정
						response.addCookie(c); // response에 추가해서 쿠키에 설정된 옵션들 처리(삭제)
						break;
					}
				}
				
				userService.updateLoginDate(user);
				model.addAttribute("user", user);
				
				if(rememberMe) {
					Cookie cookie = new Cookie("rememberId", user.getU_id());
					cookie.setMaxAge(60*60*24*10); // 초 * 분 * 시 * 일
					response.addCookie(cookie);
				} else {
					for(Cookie c : cookies) {
						if(c.getName().equals("rememberId")) {						
							c.setMaxAge(0);
							response.addCookie(c);
							break;
						}
					}
				}
				
				return "redirect:" + moveUrl;
			}
		} else {
			model.addAttribute("alert", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			return "user/login";
		}
	}
	
	@RequestMapping("/authEmailCode")
	public String authEmailCode(Model model, UserVO vo) {
		int result = userService.updateUserStatus(vo);
			
		model.addAttribute("result", result);
		model.addAttribute("authUser", vo);
		
		return "user/authEmailCode";
	}
	
	// 유저 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpServletRequest request) {
		String prevUrl = request.getHeader("referer");
		String serverPath = request.getContextPath() + "/"; 
		String moveUrl = prevUrl.substring(prevUrl.indexOf(serverPath)+serverPath.length());  
		
		sessionStatus.setComplete();
		
		if(moveUrl.equals("")) { // localhost/{serverPath}/ 로 들어왔을 때
			moveUrl = "index";
		}
		
		return "redirect:" + moveUrl;
	}
	
	// 유저 회원가입(GET)
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String signUp() {
		return "user/signUp";
	}
	// 유저 회원가입(POST)
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public String insertUser(UserVO vo) throws Exception {
		String mailAuthKeyCode =  new MailAuthKeyGenerator().executeGenerate(); 
		
		try {
			MailHandler mailHandler = new MailHandler(mailSender) ;
			
			mailHandler.setSuject("WebBoard 회원가입 인증 코드");
			mailHandler.setText("이메일 인증 코드 : " + mailAuthKeyCode);
			mailHandler.setFrom("WebBoard", "WebBoard운영자");
			mailHandler.setTo(vo.getU_email());

			vo.setU_email_code(mailAuthKeyCode);
			userService.insertUser(vo);
			
			mailHandler.send();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:index";
	}
	
	// 유저 정보 조회
	@RequestMapping(value="/user/selectUser")
	public String selectUser(HttpSession session, UserVO vo, Model model) {
		vo = (UserVO) session.getAttribute("user");
		model.addAttribute("user", userService.selectUser(vo)); 
		return "user/selectUser";
	}
	
	// 유저 비밀번호 수정(GET)
	@RequestMapping(value="/user/updatePwd", method=RequestMethod.GET)
	public String updatePwd() {
		return "user/updatePwd";
	}
	// 유저 비밀번호 수정(POST)
	@RequestMapping(value="/user/updatePwd", method=RequestMethod.POST)
	public String updatePwd(UserVO vo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");
		user.setU_pwd(vo.getU_pwd());
		userService.updatePwd(user);
		
		return "redirect:/user/selectUser";
	}
	
	// 유저 정보 수정(GET)
	@RequestMapping(value="/user/updateUser", method=RequestMethod.GET)
	public String updateUser() {
		return "user/updateUser";
	}
	// 유저 정보 수정(POST)
	@RequestMapping(value="/user/updateUser", method=RequestMethod.POST)
	public String updateUser(UserVO vo) {
		userService.updateUser(vo);
		return "redirect:/user/selectUser";
	}
	
	// 유저 회원 탈퇴
	@RequestMapping("/user/deleteUser")
	public String deleteUser(UserVO vo, SessionStatus sessionStatus) {
		userService.deleteUser(vo);
		sessionStatus.setComplete();
		
		return "redirect:/index";
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 아이디 중복 체크
	@RequestMapping(value="/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String u_id) {
		return userService.idCheck(u_id);
	}
	
	// 유저 비밀번호 체크
	@RequestMapping(value="/user/userCheck")
	@ResponseBody
	public String userCheck(UserVO vo) {
		UserVO user = userService.userCheck(vo);
		
		if(user != null) {
			return "1";
		} else {
			return "0";
		}
	}
}
