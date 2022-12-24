package com.gdu.sporters.chat.service;

import java.util.Calendar;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value="/chatserver")  // WebSocket을 활성화하는 매핑 정보
public class ChatServer {
	
	// 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록 - HttpSession 아님 주의
	private static Set<Session> clientList = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen  // 클라이언트가 접속할 때 동작, ServerEndPoint값인 '/chatserver'로 접속하면 가장 먼저 실행됨
	public void onOpen(Session session) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), "클라이언트 연결");  // 프로젝트에서는 제거
		clientList.add(session);
		
	}
	
	@OnClose  // 클라이언트가 브라우저를 종료하거나 URL을 변경하거나 새로고침하면 자동으로 동작함
	public void onClose(Session session) {
		System.out.printf("[%tT] %s\n", Calendar.getInstance(), "클라이언트 종료");  // 프로젝트에서는 제거
		clientList.remove(session);
	}
	
	@OnMessage  // 클라이언트가 메시지를 보내면 clientList에 있는 모든 Session(접속된 모든 클라이언트)에 메시지가 전달됨
	public void onMessage(String message, Session session) throws Exception {
		for(Session s : clientList) {
			System.out.printf("[%tT] %s\n", Calendar.getInstance(), message);  // 프로젝트에서는 제거
			s.getBasicRemote().sendText(message);
		}
	}
	
}