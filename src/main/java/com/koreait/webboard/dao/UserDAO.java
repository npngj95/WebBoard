package com.koreait.webboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession mybatis;
	
	// *** 관리자 영역 ***

	public List<UserVO> selectAllUser(PageCriteria pc) {
		return mybatis.selectList("UserDAO.selectAllUser", pc);
	}

	// 관리자가 회원을 강제탈퇴
	public void deleteUserList(List<String> u_idList) {
		mybatis.delete("UserDAO.deleteUserList", u_idList);
	}
	
	public int userTotalCount(PageCriteria pc) {
		return mybatis.selectOne("UserDAO.selectTotalCount", pc);
	}
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	
	// *** 유저 영역 ***

	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public UserVO selectUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.selectUser", vo);
	}
	
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}
	
	public void updatePwd(UserVO vo) {
		mybatis.update("UserDAO.updatePwd", vo);
	}
	
	// 회원이 직접 탈퇴시
	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
	public UserVO userCheck(UserVO vo) {
		return mybatis.selectOne("UserDAO.userCheck", vo);
	}
	
	public String idCheck(String u_id) {
		return mybatis.selectOne("UserDAO.idCheck", u_id);
	}
	
	public void updateLoginDate(UserVO vo) {
		mybatis.update("UserDAO.updateLoginDate", vo);
	}

	public int updateUserStatus(UserVO vo) {
		return mybatis.update("UserDAO.updateUserStatus", vo);
	}
}
