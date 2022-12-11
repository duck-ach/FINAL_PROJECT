package com.gdu.sporters.users.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.sporters.users.domain.UsersDTO;

public interface UsersService {
	
	public void login(HttpServletRequest request, HttpServletResponse response);
	public void keepLogin(HttpServletRequest request, HttpServletResponse response);
	public void logout(HttpServletRequest request, HttpServletResponse response);
	
	
	// 네이버 아이디 로그인
	public String getNaverLoginApiURL(HttpServletRequest request);
	public UsersDTO getNaverLoginTokenNProfile(HttpServletRequest request);


}
