package com.gdu.sporters.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gdu.sporters.shopAdmin.util.ShopAdminFileUtil;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private ShopAdminFileUtil myFileUtil;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/load/image/**")
			.addResourceLocations("file:" + myFileUtil.getSummernotePath() + "/");
	}
	
}
