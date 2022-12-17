package com.gdu.sporters.admin.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminService {
	
	public int getAllUsersCount(HttpServletRequest request);
	public Map<String, Object> getAllUsers(HttpServletRequest request);
	public Map<String, Object> searchUsersbyQuery(HttpServletRequest request);
	public Map<String, Object> removeUser(List<String> id);
	

}
