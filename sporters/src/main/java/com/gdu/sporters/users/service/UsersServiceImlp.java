package com.gdu.sporters.users.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.gdu.sporters.users.mapper.UsersMapper;
import com.gdu.sporters.users.util.SecurityUtil;


@PropertySource(value = {"classpath:email.properties"})
@Service
public class UsersServiceImlp implements UsersService {
	
	// 이메일을 보내는 사용자 정보
	@Value(value = "${mail.username}")
	private String username;
	
	@Autowired
	private UsersMapper usersMapper;
	
	@Autowired
	private SecurityUtil securityUtil;

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터
		String url = request.getParameter("url");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// pw 암호화
		pw = SecurityUtil.
		
	}
}
