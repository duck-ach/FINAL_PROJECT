package com.gdu.sporters.shopAdmin.service;

import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.shop.domain.ProdImageDTO;
import com.gdu.sporters.shop.domain.ProductDTO;
import com.gdu.sporters.shopAdmin.mapper.ShopAdminMapper;
import com.gdu.sporters.shopAdmin.util.ShopAdminPageUtil;
import com.gdu.sporters.util.MyFileUtil;

import net.coobird.thumbnailator.Thumbnails;

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
	public void saveProd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		
		// 파라미터
		String prodName = multipartRequest.getParameter("prodName");
		int prodCategoryNo = Integer.parseInt(multipartRequest.getParameter("prodCategoryNo"));
		int price = Integer.parseInt(multipartRequest.getParameter("price"));
		int discount = Integer.parseInt(multipartRequest.getParameter("discount"));
		String origin = multipartRequest.getParameter("origin");
		int stock = Integer.parseInt(multipartRequest.getParameter("stock"));
		String content = multipartRequest.getParameter("content");
		
		// 썸네일 받아오기
		List<MultipartFile> thumbnail = multipartRequest.getFiles("thumbnail");
		
		String filesystem = null;
		String path = null;
		
		// 첨부된 파일 목록 순회(하나씩 저장)
		for(MultipartFile multipartFile : thumbnail) {
			
			try {
				
				// 첨부가 있는지 점검
				if(multipartFile != null && multipartFile.isEmpty() == false) {  // 둘 다 필요함
					
					// 원래 이름
					String originName = multipartFile.getOriginalFilename();
					originName = originName.substring(originName.lastIndexOf("\\") + 1);  // IE는 origin에 전체 경로가 붙어서 파일명만 사용해야 함
					
					// 저장할 이름
					filesystem = myFileUtil.getFilename(originName);
					
					// 저장할 경로
					path = myFileUtil.getTodayPath();
					
					// 저장할 경로 만들기
					File dir = new File(path);
					if(dir.exists() == false) {
						dir.mkdirs();
					}
					
					// 첨부할 File 객체
					File file = new File(dir, filesystem);
					
					// 첨부파일 서버에 저장(업로드 진행)
					multipartFile.transferTo(file);

					
					// 첨부파일의 Content-Type 확인
					String contentType = Files.probeContentType(file.toPath());  // 이미지의 Content-Type(image/jpeg, image/png, image/gif)

					// 첨부파일이 이미지이면 썸네일을 만듬
					if(contentType != null && contentType.startsWith("image")) {
					
						// 썸네일을 서버에 저장
						Thumbnails.of(file)
							.size(50, 50)
							.toFile(new File(dir, "s_" + filesystem));  // 썸네일의 이름은 s_로 시작함
						
						// 썸네일이 있는 첨부로 상태 변경
						
					
					}
					
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}  // for
		
		ProductDTO product = ProductDTO.builder()
				.prodName(prodName)
				.prodCategoryNo(prodCategoryNo)
				.price(price)
				.discount(discount)
				.origin(origin)
				.filesystem(filesystem)
				.stock(stock)
				.prodContent(content)
				.prodThumbnail(1)
				.build();
		
		int result = shopAdminMapper.insertProd(product);
		
		// 응답
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(result > 0) {
				
				// 파라미터 summernoteImageNames
				String[] summernoteImageNames = multipartRequest.getParameterValues("summernoteImageNames");
				
				// DB에 SummernoteImage 저장
				if(summernoteImageNames !=  null) {
					for(String summernoteImage : summernoteImageNames) {
						ProdImageDTO prodImageDTO = ProdImageDTO.builder()
								.prodNo(product.getProdNo())
								.filesystem(summernoteImage)
								.build();
						shopAdminMapper.insertProdImage(prodImageDTO);
					}
				}
				
				out.println("alert('삽입 성공');");
				out.println("location.href='" + multipartRequest.getContextPath() + "/admin/prodManage';");
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
	
	@Override
	public ResponseEntity<byte[]> display(int prodNo) {
		
		ProductDTO product = shopAdminMapper.selectProdByNo(prodNo);
		File file = new File(product.getPath(), product.getFilesystem());

		ResponseEntity<byte[]> result = null;

		try {

			if(product.getProdThumbnail() == 1) {
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				File thumbnail = new File(product.getPath(), "s_" + product.getFilesystem());
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(thumbnail), null, HttpStatus.OK);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
}
