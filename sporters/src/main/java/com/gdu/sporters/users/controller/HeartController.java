package com.gdu.sporters.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.sporters.users.service.HeartService;

@RestController // @Controller + @ResponseBody
public class HeartController {

	@Autowired
	private HeartService heartService;
	
	@GetMapping(value="/heart/getHeartCheck", produces="application/json")
	public Map<String, Object> getHeartCheck(HttpServletRequest request){
		return heartService.getHeartCheck(request);
	}
	
	@GetMapping(value="/heart/getHeartCount", produces="application/json")
	public Map<String, Object> getHeartCount(int userNo){
		return heartService.getHeartCount(userNo);
	}
	
	@GetMapping(value="/heart/markLike", produces="application/json")
	public Map<String, Object> mark(HttpServletRequest request){
		return heartService.markLike(request);
	}
	
	// 싫어요
	@GetMapping(value="/heart/markhate", produces="application/json")
	public Map<String, Object> markhate(HttpServletRequest request){
		return heartService.markhate(request);
	}
	
	@GetMapping(value="/heart/getHateCount", produces="application/json")
	public Map<String, Object> getHateCount(int userNo){
		return heartService.getHateCount(userNo);
	}
	
//	// 좋아요
//	@ResponseBody
//	@GetMapping("/heart/pickLove")
//	public String updateLove(int userNo) {
//		heartService.updateLove(userNo);
//		return "ok";
//	}
//	
//	// 좋아요취소
//	@ResponseBody
//	@GetMapping("/heart/cancelLove")
//	public String cancelLove(int userNo) {
//		heartService.cancelLove(userNo);
//		return "ok";
//	}
//	
//	// 싫어요
//	@ResponseBody
//	@GetMapping("/heart/pickHate")
//	public String updateHate(int userNo) {
//		heartService.updateHate(userNo);
//		return "ok";
//	}
//	
//	// 싫어요 취소
//	@ResponseBody
//	@GetMapping("/heart/cancelHate")
//	public String cancelHate(int userNo) {
//		heartService.cancelHate(userNo);
//		return "ok";
//	}


}
