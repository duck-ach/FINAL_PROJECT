package com.gdu.sporters.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.CartDTO;
import com.gdu.sporters.shop.domain.ProductDTO;

@Mapper
public interface ShopMapper {
	public List<ProductDTO> selectProductListByMap(Map<String, Object> map);
	public int selectProductCount();
	public Map<String, Object> selectProductByNo(int prodNo);
	public int addCart(CartDTO cart);
	public Map<String, Object> selectCartList(Map<String, Object> map);
}
