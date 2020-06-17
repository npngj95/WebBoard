package com.koreait.webboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSession mybatis;

	public void insertReply(ReplyVO vo) {
		mybatis.insert("ReplyDAO.insertReply", vo);
	}
	
	public List<ReplyVO> selectReply(BoardVO vo) {
		return mybatis.selectList("ReplyDAO.selectReply", vo);
	}
	
	public int deleteReply(ReplyVO vo) {
		return mybatis.delete("ReplyDAO.deleteReply", vo);
	}

}
