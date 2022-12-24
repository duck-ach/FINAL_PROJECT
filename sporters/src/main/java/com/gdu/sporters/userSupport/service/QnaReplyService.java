package com.gdu.sporters.userSupport.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.sporters.userSupport.domain.QnaReplyDTO;

public interface QnaReplyService {
	
	public Map<String, Object> addQnaReply(QnaReplyDTO reply);


}
