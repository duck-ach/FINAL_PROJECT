package com.gdu.sporters.users.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.users.domain.RetireUsersDTO;
import com.gdu.sporters.users.domain.SleepUsersDTO;
import com.gdu.sporters.users.domain.UsersDTO;

@Mapper
public interface UsersMapper {
	
	public UsersDTO selectUsersByMap(Map<String, Object> map);
	public RetireUsersDTO selectRetireUsersById(String id);
	public SleepUsersDTO selectSleepUserById(String id);
	public int updateAccessLog(String id);
	public int insertAccessLog(String id);
	public int updateSessionInfo(UsersDTO user);
	public int insertUser(UsersDTO user);
	public int insertNaverUser(UsersDTO user);

}
