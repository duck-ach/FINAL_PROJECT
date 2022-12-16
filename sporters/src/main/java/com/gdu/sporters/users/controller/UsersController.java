package com.gdu.sporters.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.parser.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.users.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;
	
	
	@GetMapping("/users/login/form")
	public String loginForm(HttpServletRequest request, Model model) {
		model.addAttribute("url",  request.getHeader("referer"));
		//model.addAttribute("url",  request.getRequestURL());
		model.addAttribute("apiURL", usersService.getNaverLoginApiURL(request));
		return "users/login";
	}
	
	@PostMapping("/users/login")
	public void login(HttpServletRequest request, HttpServletResponse response) {
		usersService.login(request, response);
	}
	
	@GetMapping("/users/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		usersService.logout(request, response);
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping(value="/users/checkSameId", produces="application/json")
	public Map<String, Object> checkSameId(String id){
		return usersService.isSameId(id);
	}
	
	@ResponseBody
	@GetMapping(value="/users/checkSameEmail", produces="application/json")
	public Map<String, Object> checkSameEmail(String email){
		return usersService.isSameEmail(email);
	}
	
	@GetMapping("/users/agree/form")
	public String agreeForm() {
		return "users/agree";
	}
	
	@ResponseBody
	@GetMapping(value="/users/sendAuthCode", produces=org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> sendAuthCode(String email){
		return usersService.sendAuthCode(email);
	}
	
	@PostMapping("/users/join")
	public void join(HttpServletRequest request, HttpServletResponse response) {
		usersService.join(request, response);
	}
	
	@GetMapping("/users/join/write")
	public String joinWrite(@RequestParam(required=false) String location
			              , @RequestParam(required = false) String marketing
			              , Model model) {
		model.addAttribute("location", location);
		model.addAttribute("marketing", marketing);
		return "users/join";
	}
	
	@GetMapping("/users/naver/login")
	public String naverLogin(HttpServletRequest request, Model model) {
		String access_token = usersService.getNaverLoginToken(request);
		UsersDTO profile = usersService.getNaverLoginProfile(access_token);
		UsersDTO naverUser = usersService.getNaverUserById(profile.getId());
		
		if(naverUser == null) {
			model.addAttribute("profile", profile);
			return "users/naver_join";
		} else {
			usersService.naverLogin(request, naverUser);
			return "redirect:/";
		}
	}
	
	@PostMapping("/users/naver/join")
	public void naverJoin(HttpServletRequest request, HttpServletResponse response) {
		usersService.naverJoin(request, response);
	}
	
}
