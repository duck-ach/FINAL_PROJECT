package com.gdu.sporters.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminService {
	
	public int getAllUsersCount(HttpServletRequest request);
	public Map<String, Object> getAllUsers(HttpServletRequest request);
	public Map<String, Object> searchUsersbyQuery(HttpServletRequest request);
	public void removeUser(int userNo, HttpServletRequest request, HttpServletResponse response);
	

}
