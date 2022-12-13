package com.gdu.sporters.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.sporters.shop.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@GetMapping(value="/shop/list", produces="application/json")
	public String list(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		shopService.getProductList(model);
		return "shop/list";
	}
	
}
