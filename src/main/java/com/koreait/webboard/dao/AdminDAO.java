package com.koreait.webboard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.vo.AdminVO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession mybatis;
	
	public AdminVO adminCheck(AdminVO vo) {
		return mybatis.selectOne("AdminDAO.adminCheck", vo);
	}

	public void insertAdmin(AdminVO vo) {
		mybatis.insert("UsersDAO.insertAdmin", vo);
	}

	public void updateAdmin(AdminVO vo) {
		mybatis.update("AdminDAO.updateAdmin", vo);
	}

	public void deleteAdmin(AdminVO vo) {
		mybatis.delete("AdminDAO.deleteAdmin", vo);
	}
	
}
