package com.gdu.sporters.shop.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.sporters.shop.mapper.ShopMapper;
import com.gdu.sporters.shop.util.ShopPageUtil;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopMapper shopMapper;
	
	@Autowired
	private ShopPageUtil shopPageUtil;
	
	@Override
	public void getProductList(Model model) {
		Map<String, Object> modelMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest)modelMap.get("request");
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		int prodCount = shopMapper.selectProductCount();
		shopPageUtil.setPageUtil(page, prodCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", shopPageUtil.getBegin());
		map.put("end", shopPageUtil.getEnd());
		
		model.addAttribute("prodCount", prodCount);
		model.addAttribute("productList", shopMapper.selectProductListByMap(map));
		model.addAttribute("beginNo", prodCount - (page - 1) * shopPageUtil.getRecordPerPage());
		model.addAttribute("paging", shopPageUtil.getPaging(request.getContextPath() + "/shop/list"));
	}
	
}
