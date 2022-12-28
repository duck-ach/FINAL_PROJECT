package com.gdu.sporters.shopAdmin.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.shopAdmin.mapper.ShopAdminOrderMapper;

@Service
public class ShopAdminOrderServiceImpl implements ShopAdminOrderService {

	@Autowired
	private ShopAdminOrderMapper shopAdminOrderMapper;
	
	@Override
	public void getOrderList(HttpServletRequest request, Model model) {
		model.addAttribute("orderList", shopAdminOrderMapper.selectOrderList());
	}
	
	@Override
	public void getOrderDetail(HttpServletRequest request, Model model) {
		
		// 파라미터
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		
		// mapper로 전달할 map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		
		model.addAttribute("order", shopAdminOrderMapper.selectOrderDetailByUserNo(map));
		model.addAttribute("orderInfo", shopAdminOrderMapper.selectOrderProdDetailByUserNo(map));
		
	}
	
	@Override
	public void getOrderState(HttpServletRequest request) {
		
		// 파라미터 받기
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		String orderState = request.getParameter("orderState"); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("orderState", orderState);
		
		shopAdminOrderMapper.updateOrderState(map);
		
	}
	
}
