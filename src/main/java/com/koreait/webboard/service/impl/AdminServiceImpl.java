package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.dao.AdminDAO;
import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.dao.UserDAO;
import com.koreait.webboard.service.AdminService;
import com.koreait.webboard.vo.AdminVO;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.UserVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public AdminVO adminCheck(AdminVO vo) {
		return adminDAO.adminCheck(vo);
	}

//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	@Override
	public void writeNotice(BoardVO vo) {
		boardDAO.writeNotice(vo);		
	}
	
	@Override
	public BoardVO selectNotice(BoardVO vo) {
		return boardDAO.selectNotice(vo);
	}
	
	@Override
	public List<BoardVO> selectNoticeList() {
		return boardDAO.selectNoticeList();
	}
	
	@Override
	public void updateNotice(BoardVO vo) {
		boardDAO.updateNotice(vo);
	}
	
	@Override
	public void deleteNoticeList(List<String> b_numList) {
		boardDAO.deleteBoardList(b_numList);
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	@Override
	public List<UserVO> selectAllUser(PageCriteria pc) {
		return userDAO.selectAllUser(pc);
	}
	
	@Override // 관리자가 회원을 강제탈퇴시
	public void deleteUserList(List<String> u_idList) {
		userDAO.deleteUserList(u_idList);
	}
	
	@Override
	public int userTotalCount(PageCriteria pc) {
		return userDAO.userTotalCount(pc);
	}
	
//────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	
	
	@Override
	public List<BoardVO> selectAllBoard(PageCriteria pc) {
		return boardDAO.selectAllBoard(pc);
	}

	@Override
	public void deleteBoardList(List<String> b_numList) {
		boardDAO.deleteBoardList(b_numList);
	}
	
	@Override
	public int boardTotalCount(PageCriteria pc) {
		return boardDAO.boardTotalCount(pc);
	}
	
}
