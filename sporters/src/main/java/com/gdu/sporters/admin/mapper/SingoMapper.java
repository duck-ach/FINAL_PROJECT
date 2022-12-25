package com.gdu.sporters.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.admin.domain.SingoCategoryDTO;

@Mapper
public interface SingoMapper {
	
	public List<SingoCategoryDTO> selectSingoCategoryList();
	public int selectSingoCategoryCnt();
	public int insertSingoCategory(SingoCategoryDTO category);
	public int deleteSingoCategory(int prodCategoryNo);
	
}
