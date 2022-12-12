package com.gdu.sporters.shopAdmin.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shopAdmin.mapper.ShopAdminMapper;
import com.gdu.sporters.shopAdmin.util.ShopAdminPageUtil;
import com.gdu.sporters.util.MyFileUtil;

@Service
public class ShopAdminServiceImpl implements ShopAdminService{

	@Autowired
	private ShopAdminMapper shopAdminMapper;
	
	@Autowired
	private ShopAdminPageUtil pageUtil;
	
	@Autowired
	private MyFileUtil myFileUtil;
	
	@Override
	public void getProdList(HttpServletRequest request, Model model) {
		
		// Page 파라미터
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// 상품 개수
		int totalProdRecord = shopAdminMapper.selectProdListCount();

		// Paging 처리에 필요한 변수 계산
		pageUtil.setPageUtil(page, totalProdRecord);
		
		// Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		
		// view로 전달할 데이터 model에 저장
		model.addAttribute("totalRecord", totalProdRecord); // 상품전체갯수
		model.addAttribute("prodList", shopAdminMapper.selectProdListAll(map));
		model.addAttribute("beginNo", totalProdRecord - (page - 1) * pageUtil.getRecordPerPage());
		model.addAttribute("paging", pageUtil.getPaging(request.getContextPath() + "/admin/prodManage"));
		
	}
	
	@Override
	public Map<String, Object> saveProdImage(MultipartHttpServletRequest multipartRequest) {
		
		// 파라미터 files
		MultipartFile multipartFile = multipartRequest.getFile("file");
		
		// 저장경로
		String path = myFileUtil.getSummernotePath();
		
		return null;
	}
	
	@Override
	public void saveProd(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
}
