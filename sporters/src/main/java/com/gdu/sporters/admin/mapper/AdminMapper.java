package com.gdu.sporters.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.users.domain.UsersDTO;

@Mapper
public interface AdminMapper {
	
	public List<UsersDTO> selectAllUsers();
	public int selectAllUsersCount();

}
