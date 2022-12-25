package com.gdu.sporters.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.sporters.admin.service.AdminService;

@Controller
public class UserAdminController {
	
	@Autowired
	private AdminService adminService;
	
	//adminIndex로 가기
	@GetMapping("/admin/adminIndex")
	public String index() {
		return "admin/adminIndex";
	}
	
	// userAdmin(유저관리)로 가기
	@GetMapping("/admin/userAdmin")
	public String requiredAdmin_userAdmin() {
		return "admin/userAdmin";
	}
	
	// 유저리스트 불러오기
	@ResponseBody
	@GetMapping(value="/searchAllUsers", produces="application/json; charset=UTF-8")
	public Map<String, Object> userList(HttpServletRequest request){
		return adminService.getAllUsers(request);
	}	
	
	// 검색어로 유저 불러오기
	@ResponseBody
	@GetMapping(value="/searchUsers", produces="application/json; charset=UTF-8")
	public Map<String, Object> getSearchUsers(HttpServletRequest request){
		return adminService.searchUsersbyQuery(request);
	}
	
	// 유저 탈퇴
	@ResponseBody
	@PostMapping(value="/retireUser", produces="application/json; charset=UTF-8")
	public Map<String, Object> retire(HttpServletRequest request, Map<String, Object> map) {
		return adminService.removeUsers(request, map);
	}
	


}
