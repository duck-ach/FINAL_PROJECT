package com.gdu.sporters.userSupport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.sporters.userSupport.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@GetMapping("/faq/list")
	public String list(HttpServletRequest request, Model model) {
		faqService.findAllFaqList(request, model);
		return "faq/list";
	}
	
	


}
