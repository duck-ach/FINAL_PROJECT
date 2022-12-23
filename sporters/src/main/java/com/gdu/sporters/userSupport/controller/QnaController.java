package com.gdu.sporters.userSupport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.sporters.userSupport.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	@GetMapping("/qna/list")
	public String list(HttpServletRequest request, Model model) {
		qnaService.findAllQnaList(request, model);
		return "/qnaList/qna/list";
	}

}
