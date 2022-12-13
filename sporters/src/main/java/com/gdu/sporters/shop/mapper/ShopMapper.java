package com.gdu.sporters.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.ProductDTO;

@Mapper
public interface ShopMapper {
	public List<ProductDTO> selectProductListByMap(Map<String, Object> map);
	public int selectProductCount();
}
