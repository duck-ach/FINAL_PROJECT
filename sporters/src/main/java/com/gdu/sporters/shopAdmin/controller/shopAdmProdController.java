package com.gdu.sporters.shopAdmin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shop.domain.ProdCategoryDTO;
import com.gdu.sporters.shopAdmin.service.ShopAdminService;

@Controller
public class shopAdmProdController {

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
	@GetMapping("/shopAdmin/prod/write")
	public String writeProd(Model model) {
		model.addAttribute("prodCategoryList", shopAdminService.getCategoryList());
		return "shopAdmin/prodWrite";
	}
	
	
	// 상품등록
	@PostMapping("/shopAdmin/prod/add")
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
	@GetMapping("/shopAdmin/prod/detail")
	public String detail(@RequestParam(value="prodNo", required=false, defaultValue="0") int prodNo, Model model) {
		model.addAttribute("product", shopAdminService.getProdByNo(prodNo));
		model.addAttribute("prodThumbnail", shopAdminService.getProdThumbnailByNo(prodNo));
		return "shopAdmin/prodDetail";
	}
	
	// 상품 수정 페이지로 이동
	@PostMapping("/shopAdmin/prod/edit")
	public String edit(int prodNo, Model model) {
		model.addAttribute("product", shopAdminService.getProdByNo(prodNo));
		model.addAttribute("prodThumbnail", shopAdminService.getProdThumbnailByNo(prodNo));
		model.addAttribute("prodCategoryList", shopAdminService.getCategoryList());
		return "shopAdmin/prodEdit";
	}
	
	// 상품 수정 submit
	@PostMapping("/shopAdmin/prod/modify")
	public void modify(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		shopAdminService.prodModify(multipartRequest, response);
	}
	
	// 상품 썸네일 삭제
	@GetMapping("/shopAdmin/prodThumbnail/remove")
	public void removeThumbnail(@RequestParam("tnNo") int tnNo, HttpServletResponse response) {
		shopAdminService.removeThumbnailByTnNo(tnNo, response);
	}
	
	// 상품 삭제
	@PostMapping("/shopAdmin/prod/remove")
	public void remove(HttpServletRequest request, HttpServletResponse response) {
		shopAdminService.removeProd(request, response);
	}
	
	// 카테고리 관리 페이지 이동
	@GetMapping("/shopAdmin/categoryManage")
	public String categoryManage(HttpServletRequest request, Model model) {
		return "shopAdmin/prodCategoryMng";
	}
	
	@ResponseBody
	@GetMapping(value="/shopAdmin/getCategoryList"
				, produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ProdCategoryDTO> categoryList() {
		return shopAdminService.getCategoryList();
	}
	
	@ResponseBody
	@PostMapping(value="/shopAdmin/categoryAdd")
	public String categoryAdd(HttpServletRequest request) {
		System.out.println(request.getParameter("cateName"));
		shopAdminService.addCategory(request);
		return "/shopAdmin/getCategoryList";
	}
	
	@ResponseBody
	@GetMapping(value="/shopAdmin/categoryRemove")
	public void categoryRemove(HttpServletRequest request, HttpServletResponse response) {
		shopAdminService.deleteCategory(request, response);
	}
	
	// 상품검색 자동완성
	@ResponseBody
	@GetMapping(value="/shopAdmin/prod/autoComplete", produces="application/json")
	public Map<String, Object> autoComplete(HttpServletRequest request) {
		return shopAdminService.getAutoCompleteList(request);
	}

	@GetMapping("/shopAdmin/prodSearch")
	public String search(HttpServletRequest request, Model model) {
		shopAdminService.searchProducts(request, model);
		return "shopAdmin/prodManage";
	}
}
