package com.koreait.webboard.service;

import com.koreait.webboard.vo.UserVO;

public interface UserService {

	UserVO userCheck(UserVO vo);

	void insertUser(UserVO vo);
	UserVO selectUser(UserVO vo);
	void updateUser(UserVO vo);
	void updatePwd(UserVO vo);
	void deleteUser(UserVO vo);
		
	String idCheck(String u_id);
	void updateLoginDate(UserVO vo);
	int updateUserStatus(UserVO vo);
}
