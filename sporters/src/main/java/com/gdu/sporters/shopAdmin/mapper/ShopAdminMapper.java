package com.gdu.sporters.shopAdmin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.ProdImageDTO;
import com.gdu.sporters.shop.domain.ProductDTO;

@Mapper
public interface ShopAdminMapper {
	
	// 상품목록가져오기
	public int selectProdListCount();
	public List<ProductDTO> selectProdListAllByPage(Map<String, Object> map);
	
	// 상품상세보기
	public ProductDTO selectProdByNo(int prodNo);
	
	// 상품등록하기
	public int insertProdImage(ProdImageDTO prodImage);
	public int insertProd(ProductDTO product);
	
}
