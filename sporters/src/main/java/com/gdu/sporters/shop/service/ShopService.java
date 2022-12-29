package com.gdu.sporters.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.sporters.shop.domain.CartDTO;
import com.gdu.sporters.shop.domain.ProductDTO;

public interface ShopService {
	public void getProductList(HttpServletRequest request, Model model);
	public ProductDTO getProductByNo(int prodNo);
	public void addCart(CartDTO cart);
	public void getCartList(Model model);
	public void deleteCart(CartDTO cart);
	public Map<String, Object> isSameProdNo(Map<String, Object> map);
}
