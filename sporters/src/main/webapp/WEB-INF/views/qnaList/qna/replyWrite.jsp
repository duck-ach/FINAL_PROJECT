<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="QnA답변작성" name="title" />
</jsp:include>
<style>
	
	 .title-class{
	 	width:100%;
	 }

</style>
<body>
 
<script>

$(document).ready(function(){
	
	$('#qnaReplyContent').summernote({
		width: 800,
		height: 400,
		lang: 'ko-KR',
		toolbar: [
		    // [groupName, [list of button]]
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		]
		
     });
		
	$('#btn_list').click(function(){
		location.href = '/qna/list';
	})
	
	$('#frm_write').submit(function(event){
		if($('#qnaReplyContent').val() == ''){
			alert('답변내용은 필수입니다.');
			event.preventDefault();
			return;
		}
	});
	
});
	
</script>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div>
			
			<form id="frm_write" action="/qna/addReply" method="post" >			
				<div style="margin-top: 20px">
					<textarea name="qnaReplyContent" id="qnaReplyContent"></textarea>
				</div>
				<div style="margin-top: 20px; text-align: right;">
					<button class="btn">작성완료</button>
					<input class="btn" type="reset" value="내용초기화">
					<input class="btn" type="button" value="목록" id="btn_list"> 
					<input type="hidden" value="${qna.qnaNo}">
				</div>
			</form>
			
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