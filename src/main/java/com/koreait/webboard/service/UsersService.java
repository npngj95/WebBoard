package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.vo.UsersVO;

public interface UsersService {

	UsersVO login(UsersVO vo);
	
	UsersVO selectUsers(UsersVO vo);
	
	List<UsersVO> selectAllUsers();
	
	void insertUsers(UsersVO vo);
	
	void updateUsers(UsersVO vo);
	
	//유저 개인이 사용하는 메서드
	void deleteUsers(UsersVO vo);
	
	//관리자
	void deleteUsers(List<UsersVO> usersList);
		
}
