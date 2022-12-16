package com.gdu.sporters.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.gdu.sporters.users.interceptor.SleepUserCheckingInterceptor;

@Configuration
public class SleepCheckConfig implements WebMvcConfigurer {

	@Autowired
	private SleepUserCheckingInterceptor sleepUserCheckingInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(sleepUserCheckingInterceptor)
			.addPathPatterns("/users/login");

	}
	
}
