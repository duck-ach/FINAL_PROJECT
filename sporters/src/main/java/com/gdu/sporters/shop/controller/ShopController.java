package com.gdu.sporters.shop.controller;

import java.util.List;

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
	
	@GetMapping("/shop/detail")
	public String detail(@RequestParam(value="prodNo", required=false) int prodNo, Model model) {
		model.addAttribute("product", shopService.getProductByNo(prodNo));
		return "shop/detail";
	}
	
	@ResponseBody
	@RequestMapping(value="/shop/addCart", method=RequestMethod.POST)
	public int addCart(CartDTO cart, HttpSession session) {
		int result = 0;
		
		UsersDTO loginUser = (UsersDTO)session.getAttribute("loginUser");
		if(loginUser != null) {
			cart.setUserNo(loginUser.getUserNo());
			shopService.addCart(cart);
			result = 1;
		}
		
		return result;
	}
	
	@GetMapping(value="/shop/cartList", produces="application/json")
	public String requiredLogin_getCartList(HttpServletRequest request, HttpSession session, Model model) {
		UsersDTO loginUser = (UsersDTO)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		model.addAttribute("userNo", userNo);
		shopService.getCartList(request, model);
		return "shop/cartList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cartList/sumAll", method = RequestMethod.POST)	
	public int sumAll(@RequestParam("sum") int sum) {
		return sum;
	}
	
	@ResponseBody
	@RequestMapping(value = "/shop/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "checkOne[]", required=false) List<String> checkOne, CartDTO cart) throws Exception {
		UsersDTO loginUser = (UsersDTO)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		int result = 0;
		int cartNo = 0;
		if(loginUser != null) {
			cart.setUserNo(userNo);
			for(String i : checkOne) {  
				cartNo = Integer.parseInt(i);
				cart.setCartNo(cartNo);
				shopService.deleteCart(cart);
				}   
			result = 1;
			}
		return result;  
	}
}
