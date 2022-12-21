package com.gdu.sporters.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@ResponseBody
	@GetMapping(value="/users/checkSameNickname", produces="application/json")
	public Map<String, Object> checkSameNickname(String nickname){
		return usersService.isSameNickname(nickname);
	}
	
	@GetMapping("/users/agree/form")
	public String agreeForm() {
		return "users/agree";
	}
	
	@ResponseBody
	@GetMapping(value="/users/sendAuthCode", produces="application/json")
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
		System.out.println("access_token : " + access_token);
		UsersDTO profile = usersService.getNaverLoginProfile(access_token);
		System.out.println("profile : " + profile);
		UsersDTO naverUser = usersService.getNaverUserById(profile.getId());
		System.out.println(naverUser);
		
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
	
	
	@GetMapping("/users/sleep/display")
	public String sleepDisplay() {
		return "users/sleep";
	}
	
	@PostMapping("/users/comeback")
	public void comeback(HttpServletRequest request, HttpServletResponse response) {
		usersService.comebackUser(request, response);
	}
	
	@GetMapping("/users/mypage")
	public String requiredLogin_mypage() {
		return "users/mypage";
	}
	
	@GetMapping("/users/modify/info")
	public String editInfo() {
		return "users/modifyinfo";
	}

	@PostMapping("/users/modify/info")
	public void requiredLogin_modifyInfo(HttpServletRequest request, HttpServletResponse response) {
		usersService.modifyInfo(request, response);
	}
	
	@GetMapping("/users/modify/pw")
	public String editPw() {
		return "users/modifypw";
	}
	
	@PostMapping("/users/modify/pw")
	public void requiredLogin_modifyPW(HttpServletRequest request, HttpServletResponse response) {
		usersService.modifyPw(request, response);
	}
	
	@GetMapping("/users/withdraw")
	public String withdraw() {
		return "users/withdraw";
	}
	
	@PostMapping("/users/withdraw")
	public void withdraw(HttpServletRequest request, HttpServletResponse response) {
		usersService.withdraw(request, response);
	}
	
	@GetMapping("/users/check/form")
	public String requiredLogin_checkForm() {
		return "users/check";
	}
	
	@ResponseBody
	@PostMapping(value="/users/check/pw", produces="application/json")
	public Map<String, Object> requiredLogin_checkPw(HttpServletRequest request) {
		return usersService.confirmPassword(request);
	}
	

// 아이디찾기
	@GetMapping("/users/findId/form")
	public String findIdForm() {
		return "users/findId";
	}
	
	@ResponseBody
	@PostMapping(value="/users/findId", produces="application/json")
	public Map<String, Object> findId(@RequestBody Map<String, Object> map){
		return usersService.findUser(map);
	}
	
	
// 비번찾기	
	@GetMapping("/users/findPw/form")
	public String findPwForm() {
		return "users/findPw";
	}
	
	@ResponseBody
	@PostMapping(value="/users/findPw", produces="application/json")
	public Map<String, Object> findPw(@RequestBody Map<String, Object> map){
		return usersService.findUser(map);
	}
	
	// 임시비번전송
	@ResponseBody
	@PostMapping(value="/users/sendTemporaryPassword", produces="application/json")
	public Map<String, Object> memberSendEmailTemporaryPassword(UsersDTO user){
		return usersService.sendTemporaryPassword(user);
	}
	
	
	
	
	
	
}
