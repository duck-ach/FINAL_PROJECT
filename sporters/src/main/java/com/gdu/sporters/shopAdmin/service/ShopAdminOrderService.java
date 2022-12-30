package com.gdu.sporters.shopAdmin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.sporters.shop.domain.OrderDTO;

public interface ShopAdminOrderService {
	public void getOrderList(HttpServletRequest request, Model model);
	public void getOrderDetail(HttpServletRequest request, Model model);
	public void getOrderState(HttpServletRequest request);
	public List<OrderDTO> getGragh();
}
