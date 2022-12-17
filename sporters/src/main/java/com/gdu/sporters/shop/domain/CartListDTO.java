package com.gdu.sporters.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class CartListDTO {
	private int cartNo;
	private int userNo;
	private int prodNo;
	private int prodCnt;
	
	private int cartListNo;
	private String prodName;
	private int Price;
}
