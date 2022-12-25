package com.gdu.sporters.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminService {
	
	public int getAllUsersCount(HttpServletRequest request);
	public Map<String, Object> getAllUsers(HttpServletRequest request);
	public Map<String, Object> searchUsersbyQuery(HttpServletRequest request);
	public Map<String, Object> removeUsers(HttpServletRequest request, Map<String, Object> parameterMap);
//	public void removeUsers(HttpServletResponse response, HttpServletRequest request ); 

}
