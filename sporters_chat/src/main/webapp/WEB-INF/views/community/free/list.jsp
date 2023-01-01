<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="자유게시판" name="title" />
</jsp:include>

<script>
	$(function(){
		fn_openUserInfo();
	});
	
	var infoWindow;

	function fn_openUserInfo(){
		$('.to_userInfo').click(function(){
			infoWindow = window.open('/users/userInfo?id=' + $(this).next().val(), 'userInformation', 'width=500,height=300,top=100,left=500,menubar=no,history=no');
		});
	}
</script>

<body>


<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div><a href="/free/write">글쓰러가기</a>  </div>
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<form id="frm_search" method="post">										
				<br><hr><br>
				
				<table border="1">
					<thead>
						<tr>	
										
							<td>글 제목</td>													
							<td>닉네임</td>
							<td>회원 성별</td>	
							<td>조회수</td>						
							<td>회원 작성일</td>												
							<td>IP</td>	
						<!--  
							<td>작성 글 수</td>
						-->				
						</tr>
					</thead>
					<tbody id="list">						
						<c:forEach items="${galleryList}" var="gallery" varStatus="vs">
							<tr>
							<!-- 
								<td>${beginNo - vs.index}</td>	
							 -->					
								<td><a id="moveDetail"
									href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>									
								<td>
									<a class="to_userInfo">${gallery.users.id}</a><input type="hidden" class="userId" name="id" value="${gallery.users.id}">
								</td>
								<td>${gallery.users.nickname}</td>							
								<td>${gallery.users.gender}</td>	
								<td>${gallery.hit}</td>						
								<td>${gallery.createDate}</td>
								<td>${gallery.ip}</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				
			</form>
		
			<div class="div_paging">
				${paging}
			</div>
			
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