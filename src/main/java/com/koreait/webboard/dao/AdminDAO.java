package com.koreait.webboard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.vo.AdminVO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession mybatis;
	
	// 관리자 확인
	public AdminVO adminCheck(AdminVO vo) {
		return mybatis.selectOne("AdminDAO.adminCheck", vo);
	}
	
}
