package com.gdu.sporters.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@GetMapping("/chat/write")
	public String chatWrite() {
		return "chat/chatAdd";
	}
	
	@PostMapping("/chat/chatAdd")
	public void requiredLogin_chatAdd(HttpServletRequest request, HttpServletResponse response) {
		chatService.addChatRoom(request, response);
	}
	
	@GetMapping("/chat/chatRoom")
	public String requiredLogin_chatRoom(HttpServletRequest request, Model model) {
		chatService.chatRoomByNo(request, model);
		return "chat/chatRoom";
	}
	
	@PostMapping("/chat/close")
	public void chatClose(HttpServletRequest request, Model model) {
		chatService.chatClose(request, model);
	}
	

	
	
}
