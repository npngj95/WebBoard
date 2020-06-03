package com.koreait.webboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.common.paging.PageCriteriaSearch;
import com.koreait.webboard.dao.AdminDAO;
import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.dao.UsersDAO;
import com.koreait.webboard.service.AdminService;
import com.koreait.webboard.vo.AdminVO;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.UsersVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private UsersDAO usersDAO;
	
	@Override
	public AdminVO adminCheck(AdminVO vo) {
		return adminDAO.adminCheck(vo);
	}
	
	@Override
	public void writeNotice(BoardVO vo) {
		boardDAO.writeNotice(vo);		
	}
	
	@Override
	public void updateNotice(BoardVO vo) {
		boardDAO.updateNotice(vo);
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
	public int usersTotalCount(PageCriteriaSearch pc) {
		return usersDAO.usersTotalCount(pc);
	}
	
	@Override
	public List<UsersVO> selectAllUsers(PageCriteriaSearch pc) {
		return usersDAO.selectAllUsers(pc);
	}
	
	@Override // 관리자가 회원을 강제탈퇴시
	public void deleteUserList(List<String> u_idList) {
		usersDAO.deleteUserList(u_idList);
	}
	
	@Override
	public int boardTotalCount(PageCriteriaSearch pc) {
		return boardDAO.boardTotalCount(pc);
	}
	
	@Override
	public List<BoardVO> selectAllBoard(PageCriteriaSearch pc) {
		return boardDAO.selectAllBoard(pc);
	}


	@Override
	public void deleteBoardList(List<String> b_numList) {
		boardDAO.deleteBoardList(b_numList);
	}
	
}
