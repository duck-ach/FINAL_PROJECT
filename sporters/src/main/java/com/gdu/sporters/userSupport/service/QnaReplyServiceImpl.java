package com.gdu.sporters.userSupport.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.sporters.userSupport.domain.QnaReplyDTO;
import com.gdu.sporters.userSupport.mapper.QnaReplyMapper;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	@Autowired
	private QnaReplyMapper qnaReplyMapper;

	@Transactional
	@Override
	public Map<String, Object> addQnaReply(QnaReplyDTO reply) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(qnaReplyMapper.insertReply(reply) == 1) {
			result.put("isSuccess", qnaReplyMapper.updateGroupNo(reply) == 1);			
		}
		return null;
	}
}
