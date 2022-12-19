package com.gdu.sporters.shopAdmin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.shop.domain.ProdCategoryDTO;
import com.gdu.sporters.shop.domain.ProdImageDTO;
import com.gdu.sporters.shop.domain.ProdThumbnailDTO;
import com.gdu.sporters.shop.domain.ProductDTO;

@Mapper
public interface ShopAdminMapper {
	
	// 상품목록가져오기
	public int selectProdListCount();
	public List<ProductDTO> selectProdListAllByPage(Map<String, Object> map);
	
	// 상품이미지 조회하기
	public List<ProdImageDTO> selectProdImageList();
	public List<ProdImageDTO> selectProdImageListByNo(int prodNo);
	
	// 상품상세보기
	public ProductDTO selectProdByNo(int prodNo);
	public ProductDTO selectProdByNoThumbnail(int prodNo);
	public int deleteProdImage(String filesystem);
	
	// 상품 썸네일 불러오기
	public ProdThumbnailDTO selectProdThumbnailListByNo(int prodNo);
	
	// 상품 썸네일 수정하기 
	public int updateThumbnail(ProdThumbnailDTO prodThumbnail);
	
	// 상품등록하기
	public int insertProdImage(ProdImageDTO prodImage);
	public int insertProd(ProductDTO product);
	public int insertThumbnail(ProdThumbnailDTO thumbnail);
	
	// 상품수정하기
	public int updateProd(ProductDTO product);
	
	// 상품삭제하기
	public int deleteProd(int prodNo);
	
	// 상품 카테고리 목록
	public List<ProdCategoryDTO> selectCategoryList();
	
	// 상품 카테고리 개수
	public int selectCategoryCnt();
	
	// 상품 카테고리 추가
	public int insertCategory(ProdCategoryDTO category);
	
	// 상품 카테고리 삭제
	public int deleteCategory(int prodCategoryNo);
}
