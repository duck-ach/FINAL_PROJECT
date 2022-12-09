package com.gdu.sporters.user.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class RetireUserDTO {
	private int retireUserNo;
	private String retireUserId;
	private String retireUserNickname;
	private Date retireJoinDate;
	private Date retireDate;
}
