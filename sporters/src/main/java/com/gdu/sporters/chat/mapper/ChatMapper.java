package com.gdu.sporters.chat.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.chat.domain.ChatRoomDTO;

@Mapper
public interface ChatMapper {
	
	// chat List Cnt
	public int selectChatRoomCnt();
	// chat User Cnt
	public int selectChatUserCnt();
	
	// chat List
	public List<ChatRoomDTO> selectChatRoomListByMap(Map<String, Object> map);
	
	// insert chat List
	public int insertChatRoom(ChatRoomDTO chatRoom);
	
	
}
