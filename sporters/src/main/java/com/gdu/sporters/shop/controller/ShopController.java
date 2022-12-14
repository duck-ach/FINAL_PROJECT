package com.gdu.sporters.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.sporters.shop.domain.CartDTO;
import com.gdu.sporters.shop.domain.CartListDTO;
import com.gdu.sporters.shop.service.ShopService;
import com.gdu.sporters.users.domain.UsersDTO;

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@GetMapping(value="/shop/list", produces="application/json")
	public String list(HttpServletRequest request, Model model) {
		shopService.getProductList(request, model);
		return "shop/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/shop/addCart", method=RequestMethod.POST)
	public void addCart(CartDTO cart, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("user");
		cart.setUserNo(user.getUserNo());
		
		shopService.addCart(cart);
	}
	
	@ResponseBody
	@RequestMapping(value="/shop/addCartList", method=RequestMethod.POST)
	public void addCartList(HttpServletRequest request, HttpSession session) {
		
		
		shopService.addCartList(cartList);
	}
	
	@GetMapping("/shop/detail")
	public String detail(@RequestParam(value="prodNo", required=false) int prodNo, Model model) {
		model.addAttribute("product", shopService.getProductByNo(prodNo));
		return "shop/detail";
	}
	
}
