package com.gdu.sporters.shopAdmin.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shop.domain.ProdImageDTO;
import com.gdu.sporters.shop.domain.ProductDTO;
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
		model.addAttribute("prodList", shopAdminMapper.selectProdListAllByPage(map));
		model.addAttribute("beginNo", totalProdRecord - (page - 1) * pageUtil.getRecordPerPage());
		model.addAttribute("paging", pageUtil.getPaging(request.getContextPath() + "/admin/prodManage"));
		
	}
	
	@Override
	public Map<String, Object> saveProdImage(MultipartHttpServletRequest multipartRequest) {
		
		// 파라미터 files
		MultipartFile multipartFile = multipartRequest.getFile("file");
		
		// 저장경로
		String path = myFileUtil.getSummernotePath();
		
		
		// 저장할 파일명
		String filesystem = myFileUtil.getFilename(multipartFile.getOriginalFilename());
		
		// 저장 경로가 없으면 만들기
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		
		// 저장할 File 객체
		File file = new File(path, filesystem);
		
		// HDD에 File 객체 저장하기
		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 저장된 파일을 확인할 수 있는 매핑을 반납
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("src", multipartRequest.getContextPath() + "/admin/prodImage");
		map.put("filesystem", filesystem);
		
		return map;
	}
	
	@Transactional
	@Override
	public void saveProd(HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터
		String prodName = request.getParameter("prodName");
		int prodCategoryNo = Integer.parseInt(request.getParameter("prodCategoryNo"));
		int price = Integer.parseInt(request.getParameter("price"));
		int discount = Integer.parseInt(request.getParameter("discount"));
		String origin = request.getParameter("origin");
		String thumbnail = request.getParameter("thumbnail");
		int stock = Integer.parseInt(request.getParameter("stock"));
		String content = request.getParameter("content");
		
		System.out.println(thumbnail);
		
		ProductDTO product = ProductDTO.builder()
				.prodName(prodName)
				.prodCategoryNo(prodCategoryNo)
				.price(price)
				.discount(discount)
				.origin(origin)
				.filesystem(thumbnail)
				.stock(stock)
				.prodContent(content)
				.build();
		
		int result = shopAdminMapper.insertProd(product);
		
		// 응답
				try {
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					
					out.println("<script>");
					if(result > 0) {
						
						// 파라미터 summernoteImageNames
						String[] summernoteImageNames = request.getParameterValues("summernoteImageNames");
						
						// DB에 SummernoteImage 저장
						if(summernoteImageNames !=  null) {
							for(String filesystem : summernoteImageNames) {
								ProdImageDTO summernoteImage = ProdImageDTO.builder()
										.prodNo(product.getProdNo())
										.filesystem(filesystem)
										.build();
								shopAdminMapper.insertProdImage(summernoteImage);
							}
						}
						
						out.println("alert('삽입 성공');");
						out.println("location.href='" + request.getContextPath() + "/admin/prodManage';");
					} else {
						out.println("alert('삽입 실패');");
						out.println("history.back();");
					}
					out.println("</script>");
					out.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		
	}
	
}
