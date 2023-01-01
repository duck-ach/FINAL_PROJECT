package com.gdu.sporters.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gdu.sporters.users.interceptor.KeepLoginInterceptor;

@Configuration
public class KeepLoginConfig implements WebMvcConfigurer {

	@Autowired
	private KeepLoginInterceptor keepLoginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(keepLoginInterceptor)
				.addPathPatterns("/**");
	}
	
	

	
}
