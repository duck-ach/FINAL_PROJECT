package com.gdu.sporters.userSupport.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface QnaService {
	
	public void findAllQnaList(HttpServletRequest request, Model model);
}
