package com.gdu.sporters.chat.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.chat.domain.ChatRoomDTO;
import com.gdu.sporters.users.domain.UsersDTO;

@Mapper
public interface ChatMapper {
	
	// chat List Cnt
	public int selectChatRoomCnt();
	// chat User Cnt
	public int selectChatUserCnt();
	
	// chat List
	public List<ChatRoomDTO> selectChatRoomListByMap(Map<String, Object> map);
	// chat List By No
	
	public ChatRoomDTO selectChatRoomByNo(int chatRoomId);
	public ChatRoomDTO selectChatRoomByDTO(ChatRoomDTO chatRoom);
	
	// insert chat List
	public int insertChatRoom(ChatRoomDTO chatRoom);
	public int insertChatRoomInPw(ChatRoomDTO chatRoom);
	
	// insert chat User
	public int insertChatUser(Map<String, Object> map);
	
	// delete chat User
	public int deleteUserByChat(int userNo);
	
	// select chat User (자기자신)
	public UsersDTO selectUserByChat(int userNo);
	
	// select chat UserList (리스트)
	public List<UsersDTO> selectUserListByChat();
	
	
	
}
