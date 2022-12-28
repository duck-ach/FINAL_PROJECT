package com.gdu.sporters.shopAdmin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ShopAdminOrderService {
	public void getOrderList(HttpServletRequest request, Model model);
	public void getOrderDetail(HttpServletRequest request, Model model);
}
