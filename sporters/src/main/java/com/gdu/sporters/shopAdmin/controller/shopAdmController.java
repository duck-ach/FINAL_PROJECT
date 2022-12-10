package com.gdu.sporters.shopAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class shopAdmController {
	@GetMapping("/admin/shopIndex")
	public String index() {
		return "shopAdmin/adminShopIndex";
	}
}
