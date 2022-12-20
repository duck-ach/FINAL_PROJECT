package com.gdu.sporters.chat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gdu.sporters.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat/chatList")
	public String chatList(HttpServletRequest request, Model model) {
		chatService.chatRoomList(request, model);
		return "chat/chatList";
	}
	
	@GetMapping("/chat/add")
	public String chatWrite() {
		return "chat/chatAdd";
	}
	

	
	
}
