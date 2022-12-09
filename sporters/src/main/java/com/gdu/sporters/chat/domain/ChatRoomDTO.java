package com.gdu.sporters.chat.domain;

import java.sql.Date;

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
	private Date createDate;
}
