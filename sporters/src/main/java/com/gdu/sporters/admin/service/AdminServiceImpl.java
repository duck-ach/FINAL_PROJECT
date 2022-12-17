package com.gdu.sporters.admin.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.sporters.admin.mapper.AdminMapper;
import com.gdu.sporters.users.domain.RetireUsersDTO;
import com.gdu.sporters.users.domain.UsersDTO;
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
	public Map<String, Object> searchUsersbyQuery(HttpServletRequest request) {
		
		String column = request.getParameter("column");
		String searchText = securityUtil.preventXSS(request.getParameter("searchText"));
		System.out.println(column);
		System.out.println(searchText);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("searchText", searchText);
		List<UsersDTO> users = adminMapper.selectUsersByQuery(map);
		System.out.println(users);
		map.put("users", users);
		return map;
		
	}
	
	@Transactional
	@Override
	public Map<String, Object> removeUser(List<String> id) {
		
		List<RetireUsersDTO> retireUserList = new ArrayList<RetireUsersDTO>();
		UsersDTO user;
		int count = id.size();
		for (int i = 0; i < count; i++) {
			RetireUsersDTO retireUser = RetireUsersDTO.builder()
					.retireUserId(id.get(i))
					.retireJoinDate(user.getJoinDate())
					.build();
			retireUserList.add(retireUser);
					
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("idList", id);
		result.put("retireUserList", retireUserList);
		
		result.put("isRemove", commentMapper.deleteComment(commentNo) == 1);
		return result;
	}
		

//	@Override
//	public List<UsersDTO> getAllUsers(HttpServletRequest request) {
//		model.addAttribute("usersList", adminMapper.selectAllUsers());
//		return adminMapper.selectAllUsers();
//	}

}
