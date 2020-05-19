package com.web.board.service;

import java.util.List;

import com.web.board.vo.UsersVO;

public interface UsersService {

	//유저 개인이 사용하는 메서드
	void insertUsers(UsersVO vo);
	
	UsersVO selectUsers(UsersVO vo);
	
	void updateUsers(UsersVO vo);
	
	void deleteUsers(UsersVO vo);
	
	//관리자
	void deleteUsers(List<UsersVO> userList);
	
	List<UsersVO> selectAllUsers();
	
}
