package com.gdu.sporters.users.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.users.domain.UsersDTO;

@Mapper
public interface UsersMapper {
	
	public UsersDTO selectUsersByMap(Map<String, Object> map);
	public int updateAccessLog(String id);
	public int insertAccessLog(String id);
	public int updateSessionInfo(UsersDTO user);
		

}