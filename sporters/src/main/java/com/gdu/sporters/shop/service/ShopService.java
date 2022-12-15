package com.gdu.sporters.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.sporters.shop.domain.CartDTO;
import com.gdu.sporters.shop.domain.CartListDTO;

public interface ShopService {
	public void getProductList(HttpServletRequest request, Model model);
	public void addCart(CartDTO cart);
	public void addCartList(CartListDTO cartList);
	public Map<String, Object> getProductByNo(int prodNo);
}
