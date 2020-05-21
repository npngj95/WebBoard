package com.koreait.webboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.vo.ReplyVO;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSession mybatis;

	public List<ReplyVO> selectReply(ReplyVO vo) {
		return mybatis.selectList("ReplyDAO.selectReply", vo);
	}
	
	public void insertReply(ReplyVO vo) {
		mybatis.insert("ReplyDAO.insertReply", vo);
	}

	public void updateReply(ReplyVO vo) {
		mybatis.update("ReplyDAO.updateReply", vo);
	}

	public void deleteReply(ReplyVO vo) {
		mybatis.delete("ReplyDAO.deleteReply", vo);
	}

}
