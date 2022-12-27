package com.gdu.sporters.shopAdmin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.ProdCategoryDTO;
import com.gdu.sporters.shop.domain.ProdImageDTO;
import com.gdu.sporters.shop.domain.ProdThumbnailDTO;
import com.gdu.sporters.shop.domain.ProductDTO;

@Mapper
public interface ShopAdminCategoryMapper {
	
	// 상품 카테고리 목록
	public List<ProdCategoryDTO> selectCategoryList();
	
	// 상품 카테고리 개수
	public int selectCategoryCnt();
	
	// 상품 카테고리 추가
	public int insertCategory(ProdCategoryDTO category);
	
	// 상품 카테고리 삭제
	public int deleteCategory(int prodCategoryNo);
	
}
