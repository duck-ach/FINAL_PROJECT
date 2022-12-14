package com.gdu.sporters.board.service;

import java.io.File;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.sporters.board.domain.FreeDTO;
import com.gdu.sporters.board.domain.FreeImageDTO;
import com.gdu.sporters.board.mapper.BoardMapper;
import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.util.GalleryPageUtil;
import com.gdu.sporters.util.MyFileUtil;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private MyFileUtil myFileUtil;
	
	
	@Autowired
	private GalleryPageUtil galleryPageUtil;
	
	
	
	@Override
	public void getGalleryList(HttpServletRequest request, Model model) {

		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));

		int totalRecord = boardMapper.selectFreeListCnt();
		
		
		
		galleryPageUtil.setPageUtil(page, totalRecord);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", galleryPageUtil.getBegin() - 1);
		map.put("recordPerPage", galleryPageUtil.getRecordPerPage());

		List<FreeDTO> galleryList = boardMapper.selectFreeList(map);

		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("beginNo", totalRecord - (page - 1) * galleryPageUtil.getRecordPerPage());
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("paging", galleryPageUtil.getPaging("/free/list"));
		model.addAttribute("paging", galleryPageUtil.getPaging("/adminFreeList"));

	}
	

	
	
	
	@Transactional
	@Override
	public void saveGallery(HttpServletRequest request, HttpServletResponse response) {
		String filesystem = request.getParameter("filesystem");
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");	
		Optional<String> opt = Optional.ofNullable(request.getHeader("X-Forwarded-For"));
		String Ip = opt.orElse(request.getRemoteAddr());		
	
		HttpSession session = request.getSession();
		UsersDTO loginUser = (UsersDTO) session.getAttribute("loginUser");
		
		FreeDTO freeBbs = FreeDTO.builder()
						.title(title)
						.content(content)						
						.ip(Ip)
						.userNo(loginUser.getUserNo())
						.build();
					
	

		// DB??? Gallery ??????
		int result = boardMapper.insertFree(freeBbs);
		
		
		// ??????
		try {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if (result > 0) {

				// ???????????? summernoteImageNames
				String[] summernoteImageNames = request.getParameterValues("summernoteImageNames");
				
				// DB??? SummernoteImage ??????
				if (summernoteImageNames != null) {
					for (String summernoteImage : summernoteImageNames) {
						FreeImageDTO summernote = FreeImageDTO.builder()
								.filesystem(summernoteImage)
								.freeNo(freeBbs.getFreeNo())												
								.build();
						boardMapper.insertSummernoteImage(summernote);
				
					}
				}
				
				
			
				out.println("alert('???????????? ??????????????????.');");
				out.println("location.href='/free/list';");
			} else {
				out.println("alert('???????????? ????????? ??? ????????????.');");
				out.println("history.back();");
			}
			out.println("</script>");
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Map<String, Object> saveSummernoteImage(MultipartHttpServletRequest multipartRequest) {
		// ???????????? file ????????? (????????? ????????? ??? getParameter ?????? ??????)
		MultipartFile multipartFile = multipartRequest.getFile("file");

		// ?????? ?????? (separator : ?????? ?????????) ???????????? ???????????? ?????? C:\\upload
		String path = myFileUtil.getSummernotePath();
//		String path = "file:"+ File.separator +"///summernoteImage";

		// ????????? ?????? ??????
		String filesystem = myFileUtil.getFilename(multipartFile.getOriginalFilename());

		// ?????? ????????? ????????? ?????????
		File dir = new File(path);
		if (dir.exists() == false) {
			dir.mkdirs();
		}

		// ????????? File ??????
		File file = new File(dir, filesystem); // new File(dir, filesystem)??? ??????

		// HDD??? File ?????? ????????????
		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// ????????? ????????????
		/*
		HttpSession session = multipartRequest.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
		loginUser.setPoint(galleryMapper.updateUserPoint(loginUser.getUserNo()));
	*/
		// ????????? ????????? ????????? ??? ?????? ????????? ??????
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("src", "/load/image/" + filesystem);
		map.put("filesystem", filesystem);
		return map;

		// ????????? ????????? aaa.jpg?????? ????????????
		// src=${contextPath}/load/image/aaa.jpg ??????.

	}
	
	@Override
	public FreeDTO getGalleryByNo(int freeNo) {

		// DB?????? ????????? ?????? ????????????
		FreeDTO gallery = boardMapper.selectFreeByNo(freeNo);
		
		// ??????????????? ????????? ????????? ?????? ?????? ???????????? ?????????(????????? ???????????? DB??? ???????????? ??????, ????????? HDD?????? ???????????? ??????)
		List<FreeImageDTO> summernoteImageList = boardMapper.selectSummernoteImageListInGallery(freeNo);

		// ??????????????? ????????? ????????? ???????????? ????????? ????????? ??????(content)?????? ?????? ???????????? ???????????? ????????? ??????
		if (summernoteImageList != null && summernoteImageList.isEmpty() == false) {
			for (FreeImageDTO summernoteImage : summernoteImageList) {
				if (gallery.getContent().contains(summernoteImage.getFilesystem()) == false) {
					String path = myFileUtil.getSummernotePath();
					File file = new File(path);
			//		File file = new File("file:"+ File.separator + "///summernoteImage", summernoteImage.getFilesystem());
					if (file.exists()) {
						file.delete();
					}
				}
			}
		}

		// ????????? ??????
		return gallery;
	}

	@Override
	public int increaseFreeHit(int freeNo) {
		return boardMapper.updateHit(freeNo);
	}
	
	@Override
	public void modifyGallery(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int freeNo = Integer.parseInt(request.getParameter("freeNo"));		

		// DB?????? ????????? ?????? ????????????
		// FreeDTO gallery = boardMapper.selectFreeByNo(freeNo);
		// db??? ?????? freeDTO
		FreeDTO freeBbs = FreeDTO.builder()
				.title(title)
				.content(content)
				.freeNo(freeNo)
				.build();
		
		int result = boardMapper.updateFree(freeBbs);
		
		// ?????? 
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			
			if( result > 0 ) {
				
				String[] summernoteImageNames = request.getParameterValues("summernoteImageNames");
				
				// db??? ???????????? ??????
				if( summernoteImageNames != null ) {
					for( String filesystem : summernoteImageNames  ) {
						FreeImageDTO summernoteImage = FreeImageDTO.builder()
								.filesystem(filesystem)
								.freeNo(freeBbs.getFreeNo())												
								.build();		
						boardMapper.insertSummernoteImage(summernoteImage);
					}					
				}
				out.println("alert('???????????? ?????????????????????.');");
				out.println(
						"location.href='/free/detail?freeNo=" + freeNo + "';");
				}else {
					out.println("alert('???????????? ????????? ??? ????????????');");
					out.println("history.back();");
				}
				out.println("</script>");
				out.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		

	@Override
	public void removeGallery(HttpServletRequest request, HttpServletResponse response) {
		// ????????????
		int freeNo = Integer.parseInt(request.getParameter("freeNo"));

		// HDD?????? ???????????? ?????? SummernoteImage ?????????
		List<FreeImageDTO> summernoteImageList = boardMapper.selectSummernoteImageListInGallery(freeNo);

		// DB?????? ??????
		int result = boardMapper.deleteFreeGallery(freeNo);

		// ??????
		try {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			if (result > 0) {

				// HDD?????? SummernoteImage ????????? ??????
				if (summernoteImageList != null && summernoteImageList.isEmpty() == false) {
					for (FreeImageDTO summernoteImage : summernoteImageList) {
						String path = myFileUtil.getSummernotePath();
						File file = new File(path,
								summernoteImage.getFilesystem());
						if (file.exists()) {
							file.delete();
						}
					}
				}

				out.println("alert('???????????? ?????????????????????.');");

				HttpSession session = request.getSession();
				UsersDTO loginUser = (UsersDTO) session.getAttribute("loginUser");
			//	boardMapper.cancelUserPoint(loginUser.getUserNo());
			//	loginUser.setPoint(loginUser.getPoint() - 5);
				
				if(loginUser.getId().equals("admin")) {
					out.println("location.href='/free/list';");
				} else {
					out.println("location.href='/free/list';");
				}
			} else {
				out.println("alert('???????????? ????????? ??? ????????????.');");
				out.println("history.back();");
			}
			out.println("</script>");
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	
	
	/*
	@Override
	public ResponseEntity<byte[]> display(int freeNo) {
		FreeImageDTO product = boardMapper.selectSThumbNail(freeNo);
		File file = new File(product.getPath(), product.getFilesystem());

		ResponseEntity<byte[]> result = null;

		try {

			if(product.getProdThumbnail() == 1) {
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-Type", Files.probeContentType(file.toPath()));
				File thumbnail = new File(product.getPath(), "s_" + product.getFilesystem());
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(thumbnail), headers, HttpStatus.OK);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	*/
	
	
}