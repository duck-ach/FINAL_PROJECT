package com.gdu.sporters.shopAdmin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.OrderDTO;

@Mapper
public interface ShopAdminOrderMapper {
	public List<OrderDTO> selectOrderList();
}
