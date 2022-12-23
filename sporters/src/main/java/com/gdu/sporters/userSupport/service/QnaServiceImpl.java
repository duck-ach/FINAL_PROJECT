package com.gdu.sporters.userSupport.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.gdu.sporters.userSupport.domain.QnaDTO;
import com.gdu.sporters.userSupport.mapper.QnaMapper;
import com.gdu.sporters.util.QnaPageUtil;

public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper qnaMapper;
	
	@Autowired
	private QnaPageUtil pageUtil; 
	
	
	@Override
	public void findAllQnaList(HttpServletRequest request, Model model) {
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		int totalRecord = qnaMapper.selectAllQnaCount();
		pageUtil.setPageUtil(page, totalRecord);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());

		List<QnaDTO> qnaList = qnaMapper.selectAllQnaList(map);
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("bbsList", qnaList);
		model.addAttribute("beginNo", totalRecord - (page -1) * pageUtil.getRecordPerPage());
		model.addAttribute("paging", pageUtil.getPaging(request.getContextPath() + "/qna/list"));
	}
	
}
