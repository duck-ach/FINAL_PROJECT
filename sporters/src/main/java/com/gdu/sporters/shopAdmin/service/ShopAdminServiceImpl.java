package com.gdu.sporters.shopAdmin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.sporters.shopAdmin.mapper.ShopAdminMapper;

@Service
public class ShopAdminServiceImpl {

	@Autowired
	private ShopAdminMapper shopAdminMapper;
	
}
