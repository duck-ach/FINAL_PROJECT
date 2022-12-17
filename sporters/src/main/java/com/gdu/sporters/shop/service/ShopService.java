package com.gdu.sporters.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.sporters.shop.domain.CartDTO;

public interface ShopService {
	public void getProductList(HttpServletRequest request, Model model);
	public Map<String, Object> getProductByNo(int prodNo);
	public void addCart(CartDTO cart);
	public void getCartList(HttpServletRequest request, Model model);
}
