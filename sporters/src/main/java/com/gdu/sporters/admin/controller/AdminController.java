package com.gdu.sporters.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.sporters.admin.service.AdminService;
import com.gdu.sporters.users.domain.UsersDTO;

public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//adminIndex로 가기
	@GetMapping("/admin/adminIndex")
	public String requiredAdmin_adminIndex() {
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
	public List<UsersDTO> list(Model model, HttpServletRequest request){
		return adminService.getAllUsers(model, request);
	}

}
