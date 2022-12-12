package com.gdu.sporters.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ProductDTO {
	private int prodNo;
	private int prodCategoryNo;
	private String prodName;
	private int price;
	private int discount;
	private String prodContent;
	private String origin;
	private int stock;
	private String filesystem;
	private int prodThumbnail;
	private ProdCategoryDTO prodCategory;
}
