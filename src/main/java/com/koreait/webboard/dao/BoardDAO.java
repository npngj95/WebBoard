package com.koreait.webboard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.ReplyVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession mybatis;

	// *** 관리자 영역 ***
	// 공지 작성
	public void writeNotice(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	// 공지 상세 보기(수정 페이지)
	public BoardVO selectNotice(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.selectBoard", vo);
	}
	
	// 공지 일괄 조회
	public List<BoardVO> selectNoticeList() {
		return mybatis.selectList("BoardDAO.selectNoticeList");
	}
	
	// 공지 수정(수정 처리)
	public void updateNotice(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	// 게시글 일괄 삭제
	public void deleteBoardList(List<String> b_numList) {
		mybatis.delete("BoardDAO.deleteBoardList", b_numList);
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// *** 유저 영역 ***
	// 게시판에 공지 조회
	public List<BoardVO> userSelectNoticeList() {
		return mybatis.selectList("BoardDAO.userSelectNoticeList");
	}
	
	// 게시글 작성
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
		
	// 게시글 상세 보기
	public BoardVO selectBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.selectBoard", vo);
	}
	
	// 게시글 일괄 조회
	public List<BoardVO> selectAllBoard(PageCriteria pc) {
		return mybatis.selectList("BoardDAO.selectAllBoard", pc);
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	// 게시글 삭제
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	//==========================
	
	// 게시글 조회수 증가
	public void updateReadCount(BoardVO vo) {
		mybatis.update("BoardDAO.updateReadCount", vo);
	}
	
	// 게시글 개수 획득
	public int boardTotalCount(PageCriteria pc) {
		return mybatis.selectOne("BoardDAO.selectTotalCount", pc);
	}
	
	// 좋아요 중복 여부 확인
	public int selectLike_log(HashMap<String, Object> map) {
		return mybatis.selectOne("BoardDAO.selectLike_log", map);
	}
	
	// 좋아요 클릭 기록
	public void insertLike_log(HashMap<String, Object> map) {
		mybatis.insert("BoardDAO.insertLike_log", map);
	}
	
	// 게시글 좋아요 증가
	public void updateLike(BoardVO vo) {
		mybatis.update("BoardDAO.updateLike", vo);
	}
	
	// 게시글 싫어요 증가
	public void updateHate(BoardVO vo) {
		mybatis.update("BoardDAO.updateHate", vo);
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 댓글 입력시 글의 댓글수 + 1
	public void upReplyCount(ReplyVO vo) {
		mybatis.update("BoardDAO.upReplyCount", vo);
	}
	
	// 댓글 입력시 글의 댓글수 - 1
	public void downReplyCount(ReplyVO vo) {
		mybatis.update("BoardDAO.downReplyCount", vo);
	}
	
}
