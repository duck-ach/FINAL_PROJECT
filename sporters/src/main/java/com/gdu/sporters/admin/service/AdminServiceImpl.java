package com.gdu.sporters.admin.service;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.admin.mapper.AdminMapper;
import com.gdu.sporters.util.SecurityUtil;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private SecurityUtil securityUtil;
	
	@Override
	public int getAllUsersCount(HttpServletRequest request) {
		request.setAttribute("usersCnt", adminMapper.selectAllUsersCount());
		return adminMapper.selectAllUsersCount();
	}
	
	@Override
	public Map<String, Object> getAllUsers(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", adminMapper.selectAllUsers());
		return map;
	}
	
	@Override
	public void searchUsers(HttpServletRequest request, Model model) {
		Map<String, Object> modelMap = model.asMap();
		request = (HttpServletRequest) modelMap.get("request");
		String column = request.getParameter("column");
		String searchText = securityUtil.preventXSS(request.getParameter("searchText"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("searchText", searchText);
		
		model.addAttribute("searchText", searchText);
		model.addAttribute("column", column);
	}

//	@Override
//	public List<UsersDTO> getAllUsers(HttpServletRequest request) {
//		model.addAttribute("usersList", adminMapper.selectAllUsers());
//		return adminMapper.selectAllUsers();
//	}

}
