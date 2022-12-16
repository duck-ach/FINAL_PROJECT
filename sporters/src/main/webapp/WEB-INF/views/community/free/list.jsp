<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="자유게시판" name="title" />
</jsp:include>

<body>
<!-- 
<script type="text/javascript">
$(window).on('load', function(){
	fn_getlist();
	
	
});
function fn_getlist() {
	
	$.ajax({
		type: 'get',
		url : '${contextPath}/searchAllUsers',
		dataType: 'json',
		success: function(resData) {
			$('#list').empty();				
		//	alert("전체"+trs+" 개의 목록을 가져왔습니다.");
			$.each(resData, function(i, users){
				$('<tr>')
				.append($('<td class="userId" name="id">').text(users.id))
				.append($('<input type="hidden" name="" value=""  class="userIdIn">'))
				.append($('<td class="td_userNo">').text(users.userNo))
				.append($('<td>').text(users.name))					
				.append($('<td>').text(users.gender))					
				.append($('<td>').text(users.email))
				.append($('<td>').text(users.mobile))
				.append($('<td class="userJoinDate">').text(users.joinDate))
				.append($('<input type="hidden" value=""  class="userJoinDateIn">'))
				.append($('<td>').text(users.point))
			//	.append($('<td>').text(${cntUserBoard}))
				
				
				.append($('<td class="checkUserNo">').html("<input type='checkBox' name='userNo' >"))
				.append($('<td class="checkSleepUserNo">').html("<input type='checkBox' name='userNo' >"))	
				.appendTo('#list');					
			});
			
		}
	});
	
}


</script>
	 -->

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div><a href="/free/write">글쓰러가기</a>  </div>
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<form id="frm_search" method="post">
				<select id="column" name="column">
					<option value="NAME">이름</option>
					<option value="USER_NO">회원번호</option>				
				</select>
				<input type="text" id="searchText" name="searchText">
				<input type="button" id="btn_search" value="검색">
				<input type="button" id="btn_init" value="초기화">			
				<br><hr><br>
				
				<table border="1">
					<thead>
						<tr>	
										
							<td>글 제목</td>	
							<td>회원 아이디</td>						
							<td>회원 이름</td>
							<td>회원 성별</td>						
							<td>회원 핸드폰번호</td>												
							<td>회원 포인트</td>	
						<!--  
							<td>작성 글 수</td>
						-->				
						</tr>
					</thead>
					<tbody id="list">						
						<c:forEach items="${galleryList}" var="gallery" varStatus="vs">
							<tr>
								<td>${beginNo - vs.index}</td>
								<!--  
								<td>${gallery.content.imageNo}</td>
								-->
								<td><a id="moveDetail"
									href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>									
								<td>${gallery.users.id}</td>
								<td>${gallery.users.nickName}</td>
								<td>${gallery.users.gender}</td>
								<td>${gallery.createDate}</td>
								<td>${gallery.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				
			</form>
		
			
			
		</div><!-- 여기부터 각자 내용 넣기 끝 -->
		
	</section><!-- 기본틀 2 -->
	
</section><!-- 기본틀 1 -->
	
<jsp:include page="../../layout/right_side.jsp">
	<jsp:param value="right_side" name="right_side" />
</jsp:include>

<script type="text/javascript">
$(function(){
	 var right_side =  $('.content_leyout_section').offset().top;
	var my_right_side = $('.right_side_menu_area').width();
	var right_side_marginLeft = $('.content_leyout_section').width() + my_right_side*2 ;


	 $('.right_side_menu_area').offset({top:right_side});
	 $('.right_side_menu_area').css({marginLeft:right_side_marginLeft  });
	 
	 // content_leyout 현재 높이값을 구함. 
	 var left_side_top =  $('.content_leyout_section').offset().top;
	 var right_side_marginLeft = $('.content_leyout_section').offset().left;

	// 왼쪽 사이드 메뉴의 넓이값을 구함
	var my_left_side =right_side_marginLeft -  $('.left_side_gnd_area').width() - my_right_side;
	var left_side_marginLeft = $('.content_leyout_section').width();


	 $('.left_side_gnd_area').offset({top:left_side_top});	 
	 
	
}); 
</script>
</body>
</html>