package com.gdu.sporters.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BoardController {		
	
	@GetMapping("/free/list")
	public String freeList() {
		return "community/free/list";
	}
	
	
}
