package com.koreait.webboard.service;

import java.util.List;

import com.koreait.webboard.common.paging.PageCriteria;
import com.koreait.webboard.vo.AdminVO;
import com.koreait.webboard.vo.BoardVO;
import com.koreait.webboard.vo.UserVO;

public interface AdminService {
	
	AdminVO adminCheck(AdminVO vo);
	
	
	void writeNotice(BoardVO vo);
	BoardVO selectNotice(BoardVO vo);
	List<BoardVO> selectNoticeList();
	void updateNotice(BoardVO vo);
	void deleteNoticeList(List<String> b_numList);
	
	
	List<UserVO> selectAllUser(PageCriteria pc);
	void deleteUserList(List<String> u_idList);
	int userTotalCount(PageCriteria pc);
	
	
	List<BoardVO> selectAllBoard(PageCriteria pc);
	void deleteBoardList(List<String> b_numList);
	int boardTotalCount(PageCriteria pc);
	
}
