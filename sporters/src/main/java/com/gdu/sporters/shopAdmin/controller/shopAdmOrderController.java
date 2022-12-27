package com.gdu.sporters.shopAdmin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.sporters.shopAdmin.service.ShopAdminOrderService;

@Controller
public class shopAdmOrderController {

	@Autowired
	private ShopAdminOrderService shopAdminOrderService;
	
	@GetMapping("/shopAdmin/orderManage")
	public String shopOrderManage(HttpServletRequest request, Model model) {
		shopAdminOrderService.getOrderList(request, model);
		return "shopAdmin/orderManage";
	}
	
}
