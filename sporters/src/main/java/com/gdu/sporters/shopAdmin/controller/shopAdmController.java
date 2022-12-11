package com.gdu.sporters.shopAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class shopAdmController {
	@GetMapping("/admin/shopIndex")
	public String index() {
		return "shopAdmin/adminShopIndex";
	}
	
	@GetMapping("/admin/prodManage")
	public String prodManage() {
		return "shopAdmin/prodManage";
	}
	
	// 상품등록
	@GetMapping("/admin/prodWrite")
	public String addProd() {
		return "shopAdmin/prodWrite";
	}
	
}
