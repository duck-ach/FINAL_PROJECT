package com.gdu.sporters.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.users.domain.RetireUsersDTO;
import com.gdu.sporters.users.domain.UsersDTO;

@Mapper
public interface AdminMapper {
	
	public int selectAllUsersCount();
	public List<UsersDTO> selectAllUsers();
	public List<UsersDTO> selectUsersByQuery(Map<String, Object> map);
	public List<UsersDTO> selectUsersByNo(int userNo);
	public int deleteUser(Map<String, Object> id);
	public int insertRetireUser(Map<String, Object> retireUser);

}
