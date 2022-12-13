package com.gdu.sporters.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.sporters.board.service.GalleryService;


@Controller
public class BoardController {	
	
	@Autowired
	private GalleryService galleryService;
	
	
	
	@GetMapping("/free/list")
	public String freeList() {
		return "community/free/list";
	}
	
	
	@GetMapping("/free/write")
	public String freeWrite() {
		return "community/free/write";
	}
	
	

	@PostMapping("/gallery/add")
	public void add(HttpServletRequest request, HttpServletResponse response) {
		galleryService.saveGallery(request, response);
	}
	
	
}
