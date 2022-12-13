package com.gdu.sporters.users.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.gdu.sporters.users.domain.SleepUsersDTO;
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
	

	
// 아이디 중복 확인
	@Override
	public Map<String, Object> checkSameId(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("isUser", usersMapper.selectUsersByMap(map) != null);
		result.put("isRetireUser", usersMapper.selectRetireUsersById(id) != null);
		return result;
	}
	
// 이메일 중복 확인
	@Override
	public Map<String, Object> checkSameEmail(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("isUser", usersMapper.selectUsersByMap(map) != null);
		return result;
	}
	
	
	
// 로그인
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
			keepLogin(request, response);
			request.getSession().setAttribute("loginUser", loginUser);
			
			// 로그인 기록 남기기
			int updateResult = usersMapper.updateAccessLog(id);
			if(updateResult == 0) {
				usersMapper.insertAccessLog(id);
			}
			
			// 로그인페이지 이전 페이지로
			try {
				response.sendRedirect(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// id, pw 불일치 하면 로그인페이지로 
		else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('일치하는 회원 정보가 없습니다.');");
				out.println("locaion.href='" + request.getContextPath() + "';");
				out.println("</script>");
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
// 로그인유지	
	@Override
	public void keepLogin(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String keepLogin = request.getParameter("keepLogin");
		
		// 로그인유지 체크 유무
		if(keepLogin != null) {
			String sessionId = request.getSession().getId();
			Cookie cookie = new Cookie("keppLogin", sessionId);
			cookie.setMaxAge(60 * 60 * 24 * 14);	// 로그인 유지기간 14일
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
			
			UsersDTO users = UsersDTO.builder()
					.id(id)
					.sessionId(sessionId)
					.sessionLimitDate(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 14))
					.build();
			usersMapper.updateSessionInfo(users);
		}
		else {
			// keppLogin 쿠키 제거
			Cookie cookie =  new Cookie("keepLogin", "");
			cookie.setMaxAge(0);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}
	}

// 로그아웃	
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		
		Cookie cookie = new Cookie("keepLogin", "");
		cookie.setMaxAge(0);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
	}
	
	@Override
	public UsersDTO getUsersBySessionId(Map<String, Object> map) {
		return usersMapper.selectUsersByMap(map);
	}
	
	
@Override
	public SleepUsersDTO getSleepUsersById(String id) {
		return usersMapper.selectSleepUserById(id);
	}
	
	
	
	
	
}
