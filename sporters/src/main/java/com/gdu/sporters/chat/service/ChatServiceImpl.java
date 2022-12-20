package com.gdu.sporters.chat.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.chat.mapper.ChatMapper;
import com.gdu.sporters.chat.util.ChatListPageUtil;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatMapper chatMapper;
	
	@Autowired
	private ChatListPageUtil pageUtil;
	
	@Override
	public void chatRoomList(HttpServletRequest request, Model model) {
		
		// Page 파라미터
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// chatRoom 개수
		int totalChatRoomCnt = chatMapper.selectChatRoomCnt();
		
		// Paging 처리에 필요한 변수 계산
		pageUtil.setPageUtil(page, totalChatRoomCnt);
		
		// Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("recordPerPage", pageUtil.getRecordPerPage()); // begin부터 몇개 로 동작함.
		
		
		// view로 전달할 데이터 Model에 저장
		model.addAttribute("chatRoomCnt", totalChatRoomCnt); // chatRoom List 전체 개수
		model.addAttribute("chatRoomList", chatMapper.selectChatRoomListByMap(map));
		model.addAttribute("beginNo", totalChatRoomCnt - (page - 1) * pageUtil.getRecordPerPage());
		model.addAttribute("paging", pageUtil.getPaging("/chat/chatList"));
		model.addAttribute("currUserCnt", chatMapper.selectChatUserCnt());
	}
	
}
