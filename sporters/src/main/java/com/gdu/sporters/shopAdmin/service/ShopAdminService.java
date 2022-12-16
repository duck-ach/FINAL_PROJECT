package com.gdu.sporters.shopAdmin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shop.domain.ProductDTO;

public interface ShopAdminService {
	public void getProdList(HttpServletRequest request, Model model);
	public Map<String, Object> saveProdImage(MultipartHttpServletRequest multiRequest);
	public void saveProd(MultipartHttpServletRequest request, HttpServletResponse response);
	public ResponseEntity<byte[]> display(int attachNo);
	public ProductDTO getProdByNo(int prodNo);
	public void prodModify(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
}
