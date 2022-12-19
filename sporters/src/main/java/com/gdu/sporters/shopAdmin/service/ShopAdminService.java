package com.gdu.sporters.shopAdmin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shop.domain.ProdCategoryDTO;
import com.gdu.sporters.shop.domain.ProdThumbnailDTO;
import com.gdu.sporters.shop.domain.ProductDTO;

public interface ShopAdminService {
	public void getProdList(HttpServletRequest request, Model model);
	public Map<String, Object> saveProdImage(MultipartHttpServletRequest multiRequest);
	public void saveProd(MultipartHttpServletRequest request, HttpServletResponse response);
	public ResponseEntity<byte[]> display(int prodNo);
	public ProductDTO getProdByNo(int prodNo);
	public void prodModify(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public void removeThumbnailByTnNo(int tnNo, HttpServletResponse response);
	public ProdThumbnailDTO getProdThumbnailByNo(int prodNo);
	public void removeProd(HttpServletRequest request, HttpServletResponse response);
	public List<ProdCategoryDTO> getCategoryList();
	public void addCategory(HttpServletRequest request);
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response);
}
