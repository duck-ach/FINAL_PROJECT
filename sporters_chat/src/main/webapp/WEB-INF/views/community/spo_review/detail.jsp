<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="지역게시판_상세" name="title" />
</jsp:include>

<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<h1>제목 ▶ ${LocalgalleryList.title}</h1>
	
			<div>
				
				<span>▷ 작성일 <fmt:formatDate value="${LocalgalleryList.createDate}" pattern="yyyy.M.d HH:mm"/></span>
				&nbsp;&nbsp;&nbsp;
				<span>▷ 수정일 <fmt:formatDate value="${LocalgalleryList.modifyDate}" pattern="yyyy.M.d HH:mm"/></span>
				&nbsp;&nbsp;&nbsp;
				
			</div>
			
			<hr>
	
			<div>
				${LocalgalleryList.content}
			</div>
			<p>${LocalgalleryList.users.id}
				<span>작성자</span>
			</p>
			<div>
				<form id="frm_btn" method="post">	
					
					<input type="hidden" name="localBoardNo" value="${LocalgalleryList.localBoardNo}">
					<c:if test="${loginUser.id == LocalgalleryList.users.id}" >
						<input type="button" value="후기작성" id="btn_edit_gallery">					
					</c:if>
				</form>
			</div>
	
		   
		   <hr>
				
				
				
			<script>
			/*
					$(function(){
						consol.log(${gallery.users});
					});
				*/	
				
					$('#btn_edit_gallery').click(function(){
						$('#frm_btn').attr('action', '/spo_review/edit');
						$('#frm_btn').submit();
					});
				
					
					
		
			</script>

 
   
	
			
			
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