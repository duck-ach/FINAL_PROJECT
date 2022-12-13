package com.gdu.sporters.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.sporters.users.domain.UsersDTO;

public interface AdminService {
	
	public int getAllUsersCount(HttpServletRequest request);
	public List<UsersDTO> getAllUsers(Model model, HttpServletRequest request);
	

}
