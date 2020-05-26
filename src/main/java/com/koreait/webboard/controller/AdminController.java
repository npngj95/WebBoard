package com.koreait.webboard.controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.webboard.vo.AdminVO;

//@Controller
public class AdminController {
//	@Autowired
//	private AdminService adminService;
	
	// 관리자 페이지
	@RequestMapping("/admin/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	public String insertAdmin(AdminVO vo) {
		
		return "asdasd.jsp";
	}

	public String selectAdmin(AdminVO vo) {
		
		return "asdasd";
	}

	public String updateAdmin(AdminVO vo) {
		
		return "asdasd";
	}

	public String deleteAdmin(AdminVO vo) {
		
		return "asdasd";
	}
	
	// 관리자영역의 유저 리스트 조회와 삭제는 UserController에 있다.
}
