package com.gdu.sporters.shopAdmin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.shop.domain.CartDTO;
import com.gdu.sporters.shopAdmin.mapper.ShopAdminOrderMapper;

@Service
public class ShopAdminOrderServiceImpl implements ShopAdminOrderService {

	@Autowired
	private ShopAdminOrderMapper shopAdminOrderMapper;
	
	@Override
	public void getOrderList(HttpServletRequest request, Model model) {
		model.addAttribute("orderList", shopAdminOrderMapper.selectOrderList());
	}
	
}
