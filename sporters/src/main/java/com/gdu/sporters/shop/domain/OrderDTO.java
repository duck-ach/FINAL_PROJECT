package com.gdu.sporters.shop.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class OrderDTO {
	private int orderNo;
	private int userNo;
	private int cartNo;
	private int payment;
	private String name;
	private String contact;
	private String postcode;
	private String loadAddress;
	private String jibunAddress;
	private String detailAddress;
	private Date orderDate;
}
