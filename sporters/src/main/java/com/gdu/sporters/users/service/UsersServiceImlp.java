package com.gdu.sporters.users.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.users.mapper.UsersMapper;
import com.gdu.sporters.util.SecurityUtil;


@PropertySource(value = {"classpath:email.properties"})
@Service
public class UsersServiceImlp implements UsersService {
	
	// 이메일을 보내는 사용자 정보
	@Value(value = "${mail.username}")
	private String username;
	@Value(value = "${mail.password}")
	private String password;
	
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
		pw = securityUtil.sha256(pw);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);
		
		UsersDTO loginUser = usersMapper.selectUsersByMap(map);
		
		// id,pw가 일치하는 회원 -> 로그인 기록 남기기 + session에 loginUser 저장
		if(loginUser != null) {
			//keepLogin(request, response);
			
			// 로그인 기록 남기기
			// int updateResult = usersMapper.up
		}
		
	}
}
