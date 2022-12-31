package com.gdu.sporters.admin.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.admin.domain.SingoCategoryDTO;
import com.gdu.sporters.admin.domain.SingoDTO;
import com.gdu.sporters.admin.mapper.SingoMapper;
import com.gdu.sporters.util.GalleryPageUtil;

@Service
public class SingoServiceImpl implements SingoService {
	
	@Autowired
	private SingoMapper singoMapper;
	@Autowired
	private GalleryPageUtil galleryPageUtil;
	
	@Override
	public void addCategory(HttpServletRequest request) {
		// 파라미터
		String categoryName = request.getParameter("categoryName");
		
		SingoCategoryDTO category = SingoCategoryDTO.builder()
				.singoCategoryName(categoryName)
				.build();
		System.out.println(category);
		
		singoMapper.insertSingoCategory(category);
	}
		
	@Override
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
	int singoCategoryNo = Integer.parseInt(request.getParameter("singoCategoryNo"));
		
		// DB에서 카테고리 삭제
		int result = singoMapper.deleteSingoCategory(singoCategoryNo);
		
		// 응답
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('카테고리가 정상적으로 삭제 되었습니다.');");
				out.println("location.href='/admin/singoCategory';");
				
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('카테고리 삭제를 실패했습니다. 다시 시도해 주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<SingoCategoryDTO> getCategoryList() {
		return singoMapper.selectSingoCategoryList();
	}
	
	@Override
	public List<SingoDTO>  getSingoList(HttpServletRequest request, Model model) {
	
//	Map<String, Object> map = new HashMap<String, Object>();
//	map.put("begin", galleryPageUtil.getBegin());
//	map.put("recordPerPage", galleryPageUtil.getRecordPerPage());

//	model.addAttribute("singoList", singoMapper.selectSingoList());
	return singoMapper.selectSingoList();
	}
	
	@Override
	public void singoButton(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}
	
	
}
