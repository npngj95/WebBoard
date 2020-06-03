package com.koreait.webboard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.common.paging.PageCriteriaSearch;
import com.koreait.webboard.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession mybatis;

	// *** 관리자 영역 ***
	
	public void deleteBoardList(List<String> b_numList) {
		mybatis.delete("BoardDAO.deleteBoardList", b_numList);
	}
	
	public void writeNotice(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	public void updateNotice(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	public BoardVO selectNotice(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.selectBoard", vo);
	}
	
	public List<BoardVO> selectNoticeList() {
		return mybatis.selectList("BoardDAO.selectNoticeList");
	}
	
	// *** 유저 영역 ***
	
	public List<BoardVO> selectAllBoard(PageCriteriaSearch pc) {
		return mybatis.selectList("BoardDAO.selectAllBoard", pc);
	}
	
	public int boardTotalCount(PageCriteriaSearch pc) {
		return mybatis.selectOne("BoardDAO.selectTotalCount", pc);
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

	public List<BoardVO> selectNotice() {
		return mybatis.selectList("BoardDAO.selectNotice");
	}
}
