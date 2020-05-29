package com.koreait.webboard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession mybatis;

//	public List<BoardVO> selectAllBoard(BoardVO vo, int start, int size) {
//		return mybatis.selectList("BoardDAO.selectAllBoard", vo, new RowBounds(start, size));
//	}
	
	public List<BoardVO> selectAllBoard(PageCriteria pc) {
		return mybatis.selectList("BoardDAO.selectAllBoard", pc);
	}
	
	public int boardTotalCount() {
		return mybatis.selectOne("BoardDAO.selectTotalCount");
	}
	
	public BoardVO selectBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.selectBoard", vo);
	}
	
	public void updateReadCount(BoardVO vo) {
		mybatis.update("BoardDAO.updateReadCount", vo);
	}
	
	public int selectLike_log(HashMap<String, Object> map) {
		return mybatis.selectOne("BoardDAO.selectLike_log", map);
	}
	
	public void insertLike_log(HashMap<String, Object> map) {
		mybatis.insert("BoardDAO.insertLike_log", map);
	}
	
	public void updateLike(BoardVO vo) {
		mybatis.update("BoardDAO.updateLike", vo);
	}
	
	public void updateHate(BoardVO vo) {
		mybatis.update("BoardDAO.updateHate", vo);
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
