package com.gdu.sporters.shopAdmin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ShopAdminService {
	public void getProdList(HttpServletRequest request, Model model);
	public Map<String, Object> saveProdImage(MultipartHttpServletRequest multiRequest);
	public void saveProd(HttpServletRequest request, HttpServletResponse response);
}
