package com.gdu.sporters.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gdu.sporters.admin.domain.SingoCategoryDTO;

public interface SingoService {
	
	public List<SingoCategoryDTO> getCategoryList();
	public void addCategory(HttpServletRequest request);
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response);
	public void getSingoList(HttpServletRequest request, Model model);

}
