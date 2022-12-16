package com.gdu.sporters.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.board.domain.FreeDTO;
import com.gdu.sporters.board.domain.FreeImageDTO;
import com.gdu.sporters.shop.domain.ProdImageDTO;

@Mapper
public interface BoardMapper {
	public int selectFreeListCnt();
	public List<FreeDTO> selectFreeList(Map<String, Object> map);
	public List<FreeImageDTO> selectSummernoteImageListInGallery(int freeNo);
	public List<FreeImageDTO> selectAllSummernoteImageList();
	public int insertFree(FreeDTO gallery);
	public int insertSummernoteImage(FreeImageDTO summernote);
	public int updateUserPoint(int userNo);
	
	
	
	// detail
	public FreeDTO selectFreeByNo(int userNo);
	public int updateHit(int userNo);
	
	public List<FreeImageDTO> selectSThumbNail(int freeNo);
	
	
}
