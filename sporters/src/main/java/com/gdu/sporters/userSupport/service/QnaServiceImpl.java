package com.gdu.sporters.userSupport.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.userSupport.domain.QnaDTO;
import com.gdu.sporters.userSupport.mapper.QnaMapper;
import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.util.QnaPageUtil;

@Service
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
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("beginNo", totalRecord - (page -1) * pageUtil.getRecordPerPage());
		model.addAttribute("paging", pageUtil.getPaging(request.getContextPath() + "/qna/list"));
	}
	
	@Override
	public void saveQna(HttpServletRequest request, HttpServletResponse response) {
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		
		HttpSession session = request.getSession();
		UsersDTO loginUser = (UsersDTO)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		//int userNo = loginUser.getUserNo();
	
		System.out.println(qnaTitle);
		QnaDTO qna = QnaDTO.builder()
				.qnaTitle(qnaTitle)
				.qnaContent(qnaContent)
				.userNo(userNo)
				.build();
		
		System.out.println(loginUser.getUserNo());
		System.out.println(qna);
		int result = qnaMapper.insertQna(qna);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if( result > 0) {
				out.println("<script>");
				out.println("alert('질문이 등록되었습니다!');");
				out.println("location.href='/qna/list';");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('질문 등록에 실패했습니다!');");
				out.println("history.back();");
				out.println("</script>");
			}
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public QnaDTO getQnaByNo(int qnaNo) {
		return qnaMapper.selectQnaByNo(qnaNo);
	}
	
	@Override
	public void modifyQna(HttpServletRequest request, HttpServletResponse response) {
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		QnaDTO qna = QnaDTO.builder()
				.qnaTitle(qnaTitle)
				.qnaContent(qnaContent)
				.qnaNo(qnaNo)
				.build();
		int result = qnaMapper.updateQna(qna);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if( result > 0) {
				out.println("<script>");
				out.println("alert('질문이 수정되었습니다!');");
				out.println("location.href='/qna/list';");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('질문 수정에 실패했습니다!');");
				out.println("history.back();");
				out.println("</script>");
			}
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	@Override
	public void removeQna(HttpServletRequest request, HttpServletResponse response) {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int result = qnaMapper.deleteQna(qnaNo);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(result >0 ) {
				out.println("alert('삭제가 완료되었습니다!');");
				out.println("location.href='/qna/list';");
			} else {
				out.println("alert('삭제를 실패했습니다!');");
				out.println("history.back();");
			}
			out.println("</script>");
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}