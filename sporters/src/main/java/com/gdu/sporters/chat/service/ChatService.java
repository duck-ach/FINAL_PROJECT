package com.gdu.sporters.chat.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface ChatService {
	public void chatRoomList(HttpServletRequest request, Model model);
	public void addChatRoom(HttpServletRequest request, HttpServletResponse response);
	public void chatRoomByNo(HttpServletRequest request, Model model);
}
