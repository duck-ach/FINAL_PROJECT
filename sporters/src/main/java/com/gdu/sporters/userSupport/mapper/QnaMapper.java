package com.gdu.sporters.userSupport.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.userSupport.domain.QnaDTO;

@Mapper
public interface QnaMapper {

	public int selectAllQnaCount();
	public List<QnaDTO> selectAllQnaList(Map<String, Object> map);
}
