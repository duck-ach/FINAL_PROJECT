package com.gdu.sporters.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.sporters.admin.service.AdminService;

@Controller
public class AdminController {
	
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
	
	@ResponseBody
	@PostMapping(value="/admin/userAdmin/retireUser", produces = "application/json")
	public Map<String, Object> removeUser(@RequestParam("idValueArr[]") List<String> id){
		return adminService.removeUser(id);
	}
	

}
