package com.gdu.sporters.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.sporters.shop.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@GetMapping("/shop/list")
	public String index() {
		return "shop/list";
	}
	
}
