package com.gdu.sporters.userSupport.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.sporters.userSupport.domain.QnaReplyDTO;

@Mapper
public interface QnaReplyMapper {

	public int insertReply(QnaReplyDTO reply);
	public int updateGroupNo(QnaReplyDTO reply);
}
