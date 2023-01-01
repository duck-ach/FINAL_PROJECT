package com.gdu.sporters.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gdu.sporters.users.interceptor.PreventLoginInterceptor;

@Configuration
public class PreventLoginConfig implements WebMvcConfigurer {

	@Autowired
	private PreventLoginInterceptor preventLoginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(preventLoginInterceptor)
				.addPathPatterns("/users/login")
				.addPathPatterns("/users/join/form")
				.addPathPatterns("/users/agree/form");
	}

	
}
