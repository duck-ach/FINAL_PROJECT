package com.gdu.sporters.shopAdmin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.CartDTO;
import com.gdu.sporters.shop.domain.OrderDTO;

@Mapper
public interface ShopAdminOrderMapper {
	public List<OrderDTO> selectOrderList();
	public OrderDTO selectOrderDetailByUserNo(Map<String, Object> map);
	public List<CartDTO> selectOrderProdDetailByUserNo(Map<String, Object> map);
	public int updateOrderState(Map<String, Object> map);
}
