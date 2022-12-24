package com.gdu.sporters.userSupport.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.sporters.userSupport.domain.QnaReplyDTO;
import com.gdu.sporters.userSupport.service.QnaReplyService;

@Controller
public class QnaReplyController {

	@Autowired
	private QnaReplyService qnaReplyService;
	
	@GetMapping("/qna/replyWrite")
	public String replyWrite() {
		return "/qnaList/qna/replyWrite";
	}
	
	@ResponseBody
	@PostMapping(value="/qna/addReply", produces="application/json")
	public Map<String, Object> addQnaReply(QnaReplyDTO reply){
		return qnaReplyService.addQnaReply(reply);
	}
	
	
}
