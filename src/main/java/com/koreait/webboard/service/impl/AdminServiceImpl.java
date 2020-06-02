package com.koreait.webboard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.webboard.dao.AdminDAO;
import com.koreait.webboard.dao.BoardDAO;
import com.koreait.webboard.dao.UsersDAO;
import com.koreait.webboard.service.AdminService;
import com.koreait.webboard.vo.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private UsersDAO usersDAO;
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminVO adminCheck(AdminVO vo) {
		return adminDAO.adminCheck(vo);
	}
	
	@Override
	public void insertAdmin(AdminVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAdmin(AdminVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAdmin(AdminVO vo) {
		// TODO Auto-generated method stub
		
	}

}
