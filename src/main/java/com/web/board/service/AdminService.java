package com.web.board.service;

import com.web.board.vo.AdminVO;

public interface AdminService {
	
	void insertAdmin(AdminVO vo);
	
	AdminVO selectAdmin(AdminVO vo);
	
	void updateAdmin(AdminVO vo);
	
	void deleteAdmin(AdminVO vo);
}
