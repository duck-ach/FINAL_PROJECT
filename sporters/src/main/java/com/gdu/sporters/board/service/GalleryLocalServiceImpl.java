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

import com.gdu.sporters.board.domain.LocalDTO;
import com.gdu.sporters.board.domain.LocalImageDTO;
import com.gdu.sporters.board.mapper.LocalBoardMapper;
import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.util.GalleryPageUtil;
import com.gdu.sporters.util.MyFileUtil;

@Service
public class GalleryLocalServiceImpl implements GalleryLocalService {
 
	@Autowired
	private LocalBoardMapper localBoardMapper;
	
	@Autowired  
	private MyFileUtil myFileUtil;
	
	
	@Autowired
	private GalleryPageUtil galleryPageUtil;
	
	
	
	@Override
	public void getLocalGalleryList(HttpServletRequest request, Model model) {

		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));

		int totalRecord = localBoardMapper.selectLocalListCnt();
		
		
		
		galleryPageUtil.setPageUtil(page, totalRecord);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", galleryPageUtil.getBegin() - 1);
		map.put("recordPerPage", galleryPageUtil.getRecordPerPage());

		List<LocalDTO> LocalgalleryList = localBoardMapper.selectLocalList(map);

		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("beginNo", totalRecord - (page - 1) * galleryPageUtil.getRecordPerPage());
		model.addAttribute("LocalgalleryList", LocalgalleryList);
		model.addAttribute("paging", galleryPageUtil.getPaging("/local/list"));

	} 
	

	
	
	
	@Transactional
	@Override
	public void saveLocalGallery(HttpServletRequest request, HttpServletResponse response) {
		String filesystem = request.getParameter("filesystem");

		
		String title = request.getParameter("title");
		String content = request.getParameter("content");	
		String joinStart = request.getParameter("joinStart");
		String joinEnd = request.getParameter("joinEnd");
		int localNo = Integer.parseInt(request.getParameter("localNo"));
		Optional<String> opt = Optional.ofNullable(request.getHeader("X-Forwarded-For"));
		String Ip = opt.orElse(request.getRemoteAddr());		
		
		
		
		HttpSession session = request.getSession();
		UsersDTO loginUser = (UsersDTO) session.getAttribute("loginUser");
		
		LocalDTO freeBbs = LocalDTO.builder()
						.title(title)
						.content(content)						
						.ip(Ip)
						.userNo(loginUser.getUserNo())
						.localNo(localNo)
						.joinStart(joinStart)
						.joinEnd(joinEnd)
						.build();
				
		
	

		// DB??? Gallery ??????
		int result = localBoardMapper.insertLocal(freeBbs); 
		
		 
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
						LocalImageDTO summernote = LocalImageDTO.builder()
								.filesystem(summernoteImage)
								.localBoardNo(freeBbs.getLocalBoardNo())												
								.build();
						localBoardMapper.insertSummernoteImage(summernote);
		
					}
				}
				
				
			
				out.println("alert('???????????? ??????????????????.');");
				out.println("location.href='/local/list';");
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
//		String path = "C:" + File.separator + "summernoteImage";

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
	public LocalDTO getLocalGalleryByNo(int localBoardNo) {

		// DB?????? ????????? ?????? ????????????
		LocalDTO gallery = localBoardMapper.selectLocalByNo(localBoardNo);
		
		// ??????????????? ????????? ????????? ?????? ?????? ???????????? ?????????(????????? ???????????? DB??? ???????????? ??????, ????????? HDD?????? ???????????? ??????)
		List<LocalImageDTO> LocalsummernoteImageList = localBoardMapper.selectSummernoteImageListInGallery(localBoardNo);

		// ??????????????? ????????? ????????? ???????????? ????????? ????????? ??????(content)?????? ?????? ???????????? ???????????? ????????? ??????
		if (LocalsummernoteImageList != null && LocalsummernoteImageList.isEmpty() == false) {
			for (LocalImageDTO summernoteImage : LocalsummernoteImageList) {
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
	public int increaseLocalHit(int localBoardNo) {
		return localBoardMapper.updateHit(localBoardNo);
	}
	
	@Override
	public void modifyLocalGallery(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int localBoardNo = Integer.parseInt(request.getParameter("localBoardNo"));		

		// DB?????? ????????? ?????? ????????????
		// FreeDTO gallery = localBoardMapper.selectFreeByNo(freeNo);
		// db??? ?????? freeDTO
		LocalDTO freeBbs = LocalDTO.builder()
				.title(title)
				.content(content)
				.localBoardNo(localBoardNo)
				.build();
		
		int result = localBoardMapper.updateLocal(freeBbs);
		
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
						LocalImageDTO summernoteImage = LocalImageDTO.builder()
								.filesystem(filesystem)
								.localBoardNo(freeBbs.getLocalBoardNo())												
								.build();		
						localBoardMapper.insertSummernoteImage(summernoteImage);
					}					
				}
				out.println("alert('???????????? ?????????????????????.');");
				out.println(
						"location.href='/local/detail?localBoardNo=" + localBoardNo + "';");
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
	public void removeLocalGallery(HttpServletRequest request, HttpServletResponse response) {
		// ????????????
		int localBoardNo = Integer.parseInt(request.getParameter("localBoardNo"));

		// HDD?????? ???????????? ?????? SummernoteImage ?????????
		List<LocalImageDTO> summernoteImageList = localBoardMapper.selectSummernoteImageListInGallery(localBoardNo);

		// DB?????? ??????
		int result = localBoardMapper.deleteLocalGallery(localBoardNo);

		// ??????
		try {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			if (result > 0) {

				// HDD?????? SummernoteImage ????????? ??????
				if (summernoteImageList != null && summernoteImageList.isEmpty() == false) {
					for (LocalImageDTO summernoteImage : summernoteImageList) {
						
						String path = myFileUtil.getSummernotePath();
//						String path = "C:" + File.separator + "summernoteImage";
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
			//	localBoardMapper.cancelUserPoint(loginUser.getUserNo());
			//	loginUser.setPoint(loginUser.getPoint() - 5);
				
				if(loginUser.getId().equals("admin")) {
					out.println("location.href='/local/list';");
				} else {
					out.println("location.href='/local/list';");
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

	
	@Override
	public void selectindexThumbNail(HttpServletRequest request, Model model) {	
		
		Map<String, Object> map = new HashMap<String, Object>();

		List<LocalDTO> selectindexThumbNail = localBoardMapper.selectindexThumbNail(map);

		model.addAttribute("selectindexThumbNail", selectindexThumbNail);
		
	}
	
	/*
	@Override
	public ResponseEntity<byte[]> display(int freeNo) {
		FreeImageDTO product = localBoardMapper.selectSThumbNail(freeNo);
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