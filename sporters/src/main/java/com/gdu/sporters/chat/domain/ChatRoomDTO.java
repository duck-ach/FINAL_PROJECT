package com.gdu.sporters.chat.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ChatRoomDTO {
	private int chatRoomId;
	private String chatRoomTitle;
	private int maxUsersCnt;
	private int isPw;
	private int roomPw;
	private ChatUserDTO chatUser;
}
