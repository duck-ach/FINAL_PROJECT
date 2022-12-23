package com.gdu.sporters.admin.service;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.sporters.admin.mapper.AdminMapper;
import com.gdu.sporters.users.domain.RetireUsersDTO;
import com.gdu.sporters.users.domain.UsersDTO;
import com.gdu.sporters.util.ScrollPageUtil;
import com.gdu.sporters.util.SecurityUtil;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private ScrollPageUtil scrollPageUtil;
	
	@Autowired
	private SecurityUtil securityUtil;
	
	@Override
	public int getAllUsersCount(HttpServletRequest request) {
		request.setAttribute("usersCnt", adminMapper.selectAllUsersCount());
		return adminMapper.selectAllUsersCount();
	}
	
	@Override
	public Map<String, Object> getAllUsers(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", adminMapper.selectAllUsers());
		return map;
	}
	
	@Override
	public Map<String, Object> searchUsersbyQuery(HttpServletRequest request) {
		
		String column = request.getParameter("column");
		String searchText = securityUtil.preventXSS(request.getParameter("searchText"));
		System.out.println(column);
		System.out.println(searchText);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("searchText", searchText);
		List<UsersDTO> users = adminMapper.selectAllUsersByQuery(map);
		System.out.println(users);
		map.put("users", users);
		return map;
		
	}
	
	
	
	@Transactional
	@Override
	public Map<String, Object> removeUsers(HttpServletRequest request, Map<String, Object> parameterMap) {
		// 파라미터 userNo, title, content
		String[] userNo = request.getParameterValues("userNo[]");
		int userNoInt = 0;
		UsersDTO user = new UsersDTO();
		List<UsersDTO> users = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> retireMap = new HashMap<>();
		RetireUsersDTO retireUser = new RetireUsersDTO();
		
		for (int i = 0; i < userNo.length; i++) {
			userNoInt = Integer.parseInt(userNo[i]);
			user = adminMapper.selectUserByNo2(userNoInt);
			users.add(user);
			
			map.put("userNo", users.get(i).getUserNo());
			
			int result = adminMapper.deleteUser(map);
			
			if(result > 0){
				
				retireMap.put("retireUserNo", userNoInt);
				retireMap.put("retireUserId", user.getId());
				retireMap.put("retireJoinDate", user.getJoinDate());
				
				int result2 = adminMapper.insertRetireUser(retireMap);
				System.out.println(result2);
			}
        }
		map.put("userList", adminMapper.selectAllUsers());
		return map;
		
	}
	

//
//		try {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			if(result > 0) {
//				if(userList != null) {
//					for(String userNo  : userList) {
//						RetireUsersDTO retireUser = RetireUsersDTO.builder()
//								.retireUserNo(userNoInt)
//								.retireUserId(users.getId())
//								.retireJoinDate(users.getJoinDate())
//								.build();
//						adminMapper.insertRetireUser(users);
//					}
//				}
//				out.println("alert('삽입 성공');");
//				out.println("location.href='" + request.getContextPath() + "/admin/userAdmin';");
//			}else {
//				out.println("alert('삽입 실패');");
//				out.println("history.back();");
//			}
//			out.println("</script>");
//			out.close();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

//	 @Transactional
//	 @Override
//	 public Map<String, Object> removeUser(Map<String, Object> userNo) {
//      Map<String, Object> deleteUser = new HashMap<>();
//      List<UsersDTO> users = adminMapper.selectUserByNo(userNo);
//      List<RetireUsersDTO> retireUserList = new ArrayList<>();
//      for(int i = 0; i < users.size(); i ++) {
//         RetireUsersDTO retireUser = new RetireUsersDTO();
//         retireUser.setRetireUserNo(users.get(i).getUserNo());
//         retireUser.setRetireUserId(users.get(i).getId());
//         retireUser.setRetireJoinDate(users.get(i).getJoinDate());
//         retireUserList.add(i, retireUser);
//         System.out.println(retireUser);
//      }
//      Map<String, Object> rUser = new HashMap<>();
//      rUser.put("retireUserList", retireUserList);
//      int insertResult = adminMapper.insertRetireUser(rUser);
//      int deleteResult = adminMapper.deleteUser(userNo);
//      
//      System.out.println(insertResult +"," + deleteResult);
//
//      return deleteUser;
//      
// }
		

//	@Override
//	public List<UsersDTO> getAllUsers(HttpServletRequest request) {
//		model.addAttribute("usersList", adminMapper.selectAllUsers());
//		return adminMapper.selectAllUsers();
//	}
	
	
}
