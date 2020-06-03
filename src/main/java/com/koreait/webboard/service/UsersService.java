package com.koreait.webboard.service;

import com.koreait.webboard.vo.UsersVO;

public interface UsersService {

	UsersVO usersCheck(UsersVO vo);
	
	UsersVO selectUsers(UsersVO vo);
		
	void insertUsers(UsersVO vo);
	
	String idCheck(String u_id);
	
	void updateUsers(UsersVO vo);
	
	void updatePwd(UsersVO vo);
	
	void deleteUsers(UsersVO vo);
		
}
