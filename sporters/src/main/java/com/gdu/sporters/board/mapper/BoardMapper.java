package com.gdu.sporters.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.board.domain.FreeDTO;
import com.gdu.sporters.board.domain.ImageDTO;

@Mapper
public interface BoardMapper {
	public int selectFreeListCnt();
	public List<FreeDTO> selectFreeList(Map<String, Object> map);
	public List<ImageDTO> selectSummernoteImageListInGallery(int galleryNo);
	public List<ImageDTO> selectAllSummernoteImageList();
	public int insertFree(FreeDTO gallery);
	public int insertSummernoteImage(ImageDTO summernote);
	public int updateUserPoint(int userNo);
	
	
	
	// detail
	public FreeDTO selectGalleryByNo(int galleryNo);
	public int updateHit(int galleryNo);
	
}
