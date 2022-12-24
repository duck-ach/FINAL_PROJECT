<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="${qna.qnaTitle}" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>

	
</script>
<body>
	<section class="wrap"><!-- 기본틀 1 -->
		<section class="content_leyout_section"><!-- 기본틀 2 -->
			<div>
				<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
				<div>${qna.qnaTitle}</div>
				<div>
					▷ 작성자  ${qna.qnaId}
					▷ 작성일  ${qna.qnaCreateDate}
				</div>
				
				<hr>
				<div>${qna.qnaContent}</div>
				<hr>
				
				<div>
					<a href="/qna/replyWrite">답변</a>
				</div>
				
				<c:if test="${loginUser.id == 'admin'}">
					<div>
						<input type="button" value="답변수정" onclick="/qna/replyEdit">
						<input type="button" value="답변삭제" onclick="/qna/replyRemove">
					</div>
				</c:if>
				
				<hr>
				
				<div>
					<c:if test="${loginUser.id == qna.qnaId}">
						<input type="button" value="수정" id="btn_edit_qna">
						<input type="button" value="삭제" id="btn_remove_qna">
					</c:if>
					<input type="button" value="목록" onclick="location.href='/qna/list'">
				</div>
			</div>
		</section><!-- 기본틀 2 -->
	</section><!-- 기본틀 1 -->
	
	
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