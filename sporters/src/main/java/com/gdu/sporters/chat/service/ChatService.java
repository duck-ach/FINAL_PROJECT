package com.gdu.sporters.chat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ChatService {
	public void chatRoomList(HttpServletRequest request, Model model);
}
