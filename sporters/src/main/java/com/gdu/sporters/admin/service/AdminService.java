package com.gdu.sporters.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {
	
	public int getAllUsersCount(HttpServletRequest request);
	public Map<String, Object> getAllUsers(HttpServletRequest request);
	public void searchUsers(HttpServletRequest request, Model model);
	

}
