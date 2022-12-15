package com.gdu.sporters.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gdu.sporters.users.domain.UsersDTO;

public interface AdminService {
	
	public int getAllUsersCount(HttpServletRequest request);
	public Map<String, Object> getAllUsers(HttpServletRequest request);
	public Map<String, Object> searchUsers(HttpServletRequest request);
	

}
