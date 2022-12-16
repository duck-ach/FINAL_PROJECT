package com.gdu.sporters.shopAdmin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shopAdmin.service.ShopAdminService;

@Controller
public class shopAdmController {

	@Autowired
	private ShopAdminService shopAdminService;
	
	@GetMapping("/admin/shopIndex")
	public String index() {
		return "shopAdmin/adminShopIndex";
	}
	
	@GetMapping("/shopAdmin/prodManage")
	public String prodManage(HttpServletRequest request, Model model) {
		shopAdminService.getProdList(request, model);
		return "shopAdmin/prodManage";
	}
	
	// 상품등록 페이지로 이동
	@GetMapping("/shopAdmin/prodWrite")
	public String writeProd() {
		return "shopAdmin/prodWrite";
	}
	
	// 상품등록
	@PostMapping("/shopAdmin/prodAdd")
	public void addProd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		shopAdminService.saveProd(multipartRequest, response);
	}
	
	// 상품 이미지 등록
	@ResponseBody
	@PostMapping(value="/shopAdmin/prodImage", produces="application/json")
	public Map<String, Object> uploadProdImage(MultipartHttpServletRequest multipartRequest) {
		return shopAdminService.saveProdImage(multipartRequest);
	}
	
	// 상품 썸네일 
	@ResponseBody
	@GetMapping("/shopAdmin/prod/display")
	public ResponseEntity<byte[]> display(@RequestParam int prodNo){
		return shopAdminService.display(prodNo);
	}
	
	// 상품 상세보기
	@GetMapping("/shopAdmin/detail")
	public String detail(@RequestParam(value="prodNo", required=false, defaultValue="0") int prodNo, Model model) {
		model.addAttribute("product", shopAdminService.getProdByNo(prodNo));
		return "shopAdmin/prodDetail";
	}
	
}
