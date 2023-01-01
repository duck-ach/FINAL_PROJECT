<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="자유게시판" name="title" />
</jsp:include>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
	.wrap {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.first_div {
		width: 70%;
		margin: auto;
	}
	
	
</style>

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
	
	<div class="first_div">
		<div style="text-align: right;"><a href="/free/write">글쓰러가기</a>  </div>
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<form id="frm_search" method="post">										
				
				<div>
					<div>
						<div>				
							<span>글 제목</span>	
							<span>아이디</span>												
							<span>닉네임</span>
							<span>회원 성별</span>	
							<span>조회수</span>						
							<span>회원 작성일</span>												

						<!--  
							<td>작성 글 수</td>
						-->				
						</div>
					</div>
					<div id="list">						
						<c:forEach items="${galleryList}" var="gallery" varStatus="vs">
							<div>
							<!-- 
								<td>${beginNo - vs.index}</td>	
							 -->					
								<span><a id="moveDetail"
									href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></span>									
								<span>
									<a class="to_userInfo">${gallery.users.id}</a><input type="hidden" class="userId" name="id" value="${gallery.users.id}">
								</span>
								<span>${gallery.users.nickname}</span>							
								<span>${gallery.users.gender}</span>	
								<span>${gallery.hit}</span>						
								<span>${gallery.createDate}</span>

							</div>
						</c:forEach>
					</div>
					
				</div>
				
			</form>
		
			<div class="div_paging">
				${paging}
			</div>
			
		</div><!-- 여기부터 각자 내용 넣기 끝 -->
		
	</div>
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