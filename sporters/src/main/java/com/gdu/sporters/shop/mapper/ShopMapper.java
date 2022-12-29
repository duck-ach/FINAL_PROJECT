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
	public ProductDTO selectProductByNo(int prodNo);
	public int addCart(CartDTO cart);
	public List<CartDTO> selectCartListByMap(Map<String, Object> map);
	public int deleteCart(CartDTO cart);
	public CartDTO selectProdNo(Map<String, Object> map);
}
