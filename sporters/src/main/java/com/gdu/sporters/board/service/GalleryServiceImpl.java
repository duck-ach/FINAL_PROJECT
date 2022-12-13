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
import com.gdu.sporters.board.domain.ImageDTO;
import com.gdu.sporters.board.mapper.BoardMapper;
import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.util.GalleryPageUtil;
import com.gdu.sporters.util.MyFileUtil;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	private BoardMapper galleryMapper;
	
	@Autowired
	private MyFileUtil myFileUtil;
	
	
	@Autowired
	private GalleryPageUtil galleryPageUtil;
	
	
	
	@Override
	public void getGalleryList(HttpServletRequest request, Model model) {

		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));

		int totalRecord = galleryMapper.selectFreeListCnt();

		galleryPageUtil.setPageUtil(page, totalRecord);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", galleryPageUtil.getBegin());
		map.put("end", galleryPageUtil.getEnd());

		List<FreeDTO> galleryList = galleryMapper.selectFreeList(map);

		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("beginNo", totalRecord - (page - 1) * galleryPageUtil.getRecordPerPage());
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("paging", galleryPageUtil.getPaging(request.getContextPath() + "/gallery/list"));

	}
	
	
	@Transactional
	@Override
	public void saveGallery(HttpServletRequest request, HttpServletResponse response) {
		int imageNo =  Integer.parseInt(request.getParameter("imageNo"));
		int boardNo =  Integer.parseInt(request.getParameter("boardNo"));
		int spoReviewNo =  Integer.parseInt(request.getParameter("spoReviewNo"));
		int freeNo =  Integer.parseInt(request.getParameter("freeNo"));

		String fileName = request.getParameter("fileName");

		Optional<String> opt = Optional.ofNullable(request.getHeader("X-Forwarded-For"));
		String ip = opt.orElse(request.getRemoteAddr());

		HttpSession session = request.getSession();
		UsersDTO loginUser = (UsersDTO) session.getAttribute("loginUser");
		
		ImageDTO gallery = ImageDTO.builder()
						.imageNo(imageNo)
						.boardNo(boardNo)
						.spoReviewNo(spoReviewNo)
						.freeNo(freeNo)
						.fileName(fileName)						
						.build();
		
	

		// DB에 Gallery 저장
		int result = galleryMapper.insertFree(gallery);

		// 응답
		try {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			if (result > 0) {

				// 파라미터 summernoteImageNames
				String[] summernoteImageNames = request.getParameterValues("summernoteImageNames");

				// DB에 SummernoteImage 저장
				if (summernoteImageNames != null) {
					for (String filesystem : summernoteImageNames) {
						ImageDTO summernoteImage = ImageDTO.builder()
								.boardNo(imageNo)
								.boardNo(boardNo)
								.spoReviewNo(spoReviewNo)
								.freeNo(freeNo)
								.fileName(fileName)						
								.build();
						galleryMapper.insertSummernoteImage(summernoteImage);
					}
				}

				out.println("alert('게시글을 등록했습니다.');");
				out.println("location.href='" + request.getContextPath() + "/gallery/list';");
			} else {
				out.println("alert('게시글을 등록할 수 없습니다.');");
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
		// 파라미터 file 꺼내기 (파일을 꺼내는 건 getParameter 하면 안됨)
		MultipartFile multipartFile = multipartRequest.getFile("file");

		// 저장 경로 (separator : 경로 구분자) 윈도우만 쓰려고할 때는 C:\\upload
		String path = "C:" + File.separator + "summernoteImage";

		// 저장할 파일 이름
		String filesystem = myFileUtil.getFilename(multipartFile.getOriginalFilename());

		// 저장 경로가 없으면 만들기
		File dir = new File(path);
		if (dir.exists() == false) {
			dir.mkdirs();
		}

		// 저장할 File 객체
		File file = new File(dir, filesystem); // new File(dir, filesystem)도 가능

		// HDD에 File 객체 저장하기
		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 포인트 업데이트
		/*
		HttpSession session = multipartRequest.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
		loginUser.setPoint(galleryMapper.updateUserPoint(loginUser.getUserNo()));
	*/
		// 저장된 파일을 확인할 수 있는 매핑을 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("src", multipartRequest.getContextPath() + "/load/image/" + filesystem);
		return map;

		// 저장된 파일이 aaa.jpg라고 가정하면
		// src=${contextPath}/load/image/aaa.jpg 이다.

	}
	
	

	

}