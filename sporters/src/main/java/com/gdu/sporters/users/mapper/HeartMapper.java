package com.gdu.sporters.users.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.users.domain.HeartDTO;

@Mapper
public interface HeartMapper {
	public int selectUserHeartCount(Map<String, Object> map);
//	public int selectUserLoveCount(int love);
	public int selectUserHateCount(Map<String, Object> map);
	public int insertLove(Map<String, Object> map);
	public int deleteLove(Map<String, Object> map);
	public int insertHate(Map<String, Object> map);
	public HeartDTO selectLoveOrHate(Map<String, Object> map);
	
}
