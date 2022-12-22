package com.gdu.sporters.users.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HeartMapper {
	public int selectUserHeartCount(Map<String, Object> map);
//	public int selectUserLoveCount(int love);
	public int selectUserHateCount(Map<String, Object> map);
	public int insertLove(Map<String, Object> map);
	public int deleteLove(Map<String, Object> map);
	public int insertHate(Map<String, Object> map);
	public int deleteHate(Map<String, Object> map);

}
