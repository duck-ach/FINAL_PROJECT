package com.gdu.sporters.userSupport.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class FaqDTO {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
}
