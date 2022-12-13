package com.gdu.sporters.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.sporters.users.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;
	
	@GetMapping("/users/login/form")
	public String loginForm(HttpServletRequest request, Model model) {
		model.addAttribute("url", request.getHeader("referer"));
		//model.addAttribute("apiURL", usersService.getNaverLoginApiURL(request));
		return "users/login";
	}
	
	@PostMapping("/users/login")
	public void login (HttpServletRequest request, HttpServletResponse response) {
		usersService.login(request, response);
	}
	
	@GetMapping("/users/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		usersService.logout(request, response);
		return "redirect:/";
	}
}