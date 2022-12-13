package com.gdu.sporters.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.gdu.sporters.admin.mapper.AdminMapper;
import com.gdu.sporters.users.domain.UsersDTO;

public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public int getAllUsersCount(HttpServletRequest request) {
		request.setAttribute("usersCnt", adminMapper.selectAllUsersCount());
		return adminMapper.selectAllUsersCount();
	}

	@Override
	public List<UsersDTO> getAllUsers(Model model, HttpServletRequest request) {
		model.addAttribute("UsersList", adminMapper.selectAllUsers());
		return adminMapper.selectAllUsers();
	}

}
