package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.dao.UsersDAO;
import com.koreait.webboard.service.UsersService;
import com.koreait.webboard.vo.UsersVO;

@Service("usersService")
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDAO usersDAO;
	
	@Override
	public UsersVO usersCheck(UsersVO vo) {
		return usersDAO.usersCheck(vo);
	}
	
	@Override
	public UsersVO selectUsers(UsersVO vo) {
		return usersDAO.selectUsers(vo);
	}
	
	@Override
	public List<UsersVO> selectAllUsers() {
		return usersDAO.selectAllUsers();
	}
	
	@Override
	public void insertUsers(UsersVO vo) {
		usersDAO.insertUsers(vo);
	}

	@Override
	public String idCheck(String u_id) {
		return usersDAO.idCheck(u_id);
	}
	
	@Override
	public void updateUsers(UsersVO vo) {
		usersDAO.updateUsers(vo);
	}
	
	@Override
	public void updatePwd(UsersVO vo) {
		usersDAO.updatePwd(vo);
	}

	@Override // 회원이 직접 탈퇴시
	public void deleteUsers(UsersVO vo) {
		usersDAO.deleteUsers(vo);
	}

	@Override // 관리자가 회원을 강제탈퇴시
	public void deleteUsers(List<UsersVO> usersList) {
		usersDAO.deleteUsers(usersList);
	}

}
