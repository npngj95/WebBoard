package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.common.paging.PageCriteriaSearch;
import com.koreait.webboard.vo.AdminVO;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.UsersVO;

public interface AdminService {
	
	AdminVO adminCheck(AdminVO vo);
	
	void writeNotice(BoardVO vo);
	
	void updateNotice(BoardVO vo);
	
	BoardVO selectNotice(BoardVO vo);
	
	List<BoardVO> selectNoticeList();
	
	int usersTotalCount(PageCriteriaSearch pc);
	
	List<UsersVO> selectAllUsers(PageCriteriaSearch pc);

	void deleteUserList(List<String> u_idList);
	
	
	int boardTotalCount(PageCriteriaSearch pc);
	
	List<BoardVO> selectAllBoard(PageCriteriaSearch pc);
	
	void deleteBoardList(List<String> b_numList);
	
}
