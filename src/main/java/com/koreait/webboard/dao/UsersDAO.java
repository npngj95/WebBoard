package com.koreait.webboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.vo.UsersVO;

@Repository
public class UsersDAO {
	@Autowired
	private SqlSession mybatis;

	public UsersVO login(UsersVO vo) {
		return mybatis.selectOne("UsersDAO.login", vo);
	}
	
	public UsersVO selectUsers(UsersVO vo) {
		return mybatis.selectOne("UsersDAO.selectUsers", vo);
	}
	
	public List<UsersVO> selectAllUsers() {
		return mybatis.selectList("UsersDAO.selectAllUsers");
	}
	
	public void insertUsers(UsersVO vo) {
		mybatis.insert("UsersDAO.insertUsers", vo);
	}
	
	public String idCheck(String u_id) {
		return mybatis.selectOne("UsersDAO.idCheck", u_id);
	}

	public void updateUsers(UsersVO vo) {
		mybatis.update("UsersDAO.updateUsers", vo);
	}

	// 회원이 직접 탈퇴시
	public void deleteUsers(UsersVO vo) {
		mybatis.delete("UsersDAO.deleteUsers", vo);
	}

	// 관리자가 회원을 강제탈퇴시
	public void deleteUsers(List<UsersVO> usersList) {
		mybatis.delete("UsersDAO.deleteUsersList", usersList);
	}

}
