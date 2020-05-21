package com.koreait.webboard.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession mybatis;

	public BoardVO selectBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.selectBoard", vo);
	}
	
	public List<BoardVO> selectAllBoard(BoardVO vo, int start, int size) {
		return mybatis.selectList("BoardDAO.selectAllBoard", vo, new RowBounds(start, size));
	}

	public int boardTotalCount() {
		return mybatis.selectOne("BoardDAO.selectTotalCount");
	}
	
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

}
