package com.koreait.webboard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.koreait.webboard.dao.UserDAO;
import com.koreait.webboard.service.UserService;
import com.koreait.webboard.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO userCheck(UserVO vo) {
		return userDAO.userCheck(vo);
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	
	
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}
	
	@Override
	public UserVO selectUser(UserVO vo) {
		return userDAO.selectUser(vo);
	}
	
	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}
	
	@Override
	public void updatePwd(UserVO vo) {
		userDAO.updatePwd(vo);
	}

	@Override // 회원이 직접 탈퇴시
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	
	
	@Override // 회원가입시 아이디 중복체크
	public String idCheck(String u_id) {
		return userDAO.idCheck(u_id);
	}

	@Override
	public void updateLoginDate(UserVO vo) {
		userDAO.updateLoginDate(vo);
	}

	@Override // 보안 메일 체크
	public int updateUserStatus(UserVO vo) {
		return userDAO.updateUserStatus(vo);
	}

}
