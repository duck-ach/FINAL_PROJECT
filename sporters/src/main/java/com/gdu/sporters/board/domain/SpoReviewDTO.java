package com.gdu.sporters.board.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class SpoReviewDTO {
	private int spoReviewNo;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private int userNo;
	private int state;
	private int localBoardNo;
	private String ip;
	private Date modifyDate;
}
