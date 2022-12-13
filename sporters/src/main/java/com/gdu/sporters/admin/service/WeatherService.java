package com.gdu.sporters.admin.service;

import java.util.Map;

public interface WeatherService {
	
	public Map<String, Object> getWeather(String address);

}
