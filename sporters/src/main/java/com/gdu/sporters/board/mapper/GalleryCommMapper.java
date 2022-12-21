package com.gdu.sporters.board.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.sporters.board.domain.FreeCommDTO;

public interface GalleryCommMapper {
	public int selectCommentCnt(int galleryNo);
	public int insertComment(FreeCommDTO comment);
	public List<FreeCommDTO> selectCommentList(Map<String, Object> map);
	public int deleteComment(int commentNo);
	public int insertReply(FreeCommDTO reply);
}