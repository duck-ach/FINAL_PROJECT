package com.gdu.sporters.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.board.domain.FreeDTO;
import com.gdu.sporters.board.domain.FreeImageDTO;

@Mapper
public interface BoardMapper {
	public int selectFreeListCnt();
	public List<FreeDTO> selectFreeList(Map<String, Object> map);
	public List<FreeImageDTO> selectSummernoteImageListInGallery(int galleryNo);
	public List<FreeImageDTO> selectAllSummernoteImageList();
	public int insertFree(FreeDTO gallery);
	public int insertSummernoteImage(FreeImageDTO summernote);
	public int updateUserPoint(int userNo);
	
	
	
	// detail
	public FreeDTO selectGalleryByNo(int galleryNo);
	public int updateHit(int galleryNo);
	
}
