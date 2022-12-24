package com.gdu.sporters.userSupport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.sporters.userSupport.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	@GetMapping("/qna/list")
	public String list(HttpServletRequest request, Model model) {
		qnaService.findAllQnaList(request, model);
		return "qnaList/qna/list";
	}
	
	@GetMapping("/qna/write")
	public String write(){
		return "qnaList/qna/write";
	}
	
	@PostMapping("/qna/add")
	public void add(HttpServletRequest request, HttpServletResponse response) {
		qnaService.saveQna(request, response);
	}
	
	@GetMapping("/qna/detail")
	public String detail(@RequestParam(value="qnaNo", required=false, defaultValue="0") int qnaNo, Model model) {
		model.addAttribute("qna", qnaService.getQnaByNo(qnaNo));
		return "qnaList/qna/detail";
	}
	
	@PostMapping("/qna/edit")
	public String edit(int qnaNo, Model model) {
		model.addAttribute("qna", qnaService.getQnaByNo(qnaNo));
		return "qnaList/qna/edit";
	}
	
	@PostMapping("/qna/modify")
	public void modify(HttpServletRequest request, HttpServletResponse response) {
		qnaService.modifyQna(request, response);
	}
	
	@PostMapping("/qna/remove")
	public void remove(HttpServletRequest request, HttpServletResponse response) {
		qnaService.removeQna(request, response);
	}
	
	
	

}
