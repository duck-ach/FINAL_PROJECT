package com.gdu.sporters.user.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class HeartDTO {
	private int userNo;
	private int isHeart;
	private int love;
	private int hate;
}
