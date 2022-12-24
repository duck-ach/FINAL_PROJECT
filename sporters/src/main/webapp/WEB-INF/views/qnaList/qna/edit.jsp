<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="QnA" name="title" />
</jsp:include>
<style>
	
	 .title-class{
	 	width:100%;
	 }

</style>
<body>
 
<script>



$(document).ready(function(){
	
	$('#content').summernote({
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
		
	
	// 목록
	$('#btn_list').click(function(){
		location.href = '/qna/list';
	})
	
	// 서브밋
	$('#frm_write').submit(function(event){
		if($('#title').val() == ''){
			alert('제목은 필수입니다.');
			event.preventDefault(); // 서브밋 취소
			return; // 더 이상 코드 실행할 필요 없음
		}
	});
	
});


	
</script>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<form id="frm_write" action="/qna/add" method="post" >
				<div style="margin-top: 50px; margin-bottom: 15px">
					<input class="title-class" type="text" name="title" id="title" placeholder="제목">
				</div>
				
				<hr>
				
				<div style="margin-top: 20px">
					<textarea name="content" id="content"></textarea>
				</div>
				<!-- 써머노트에서 사용한 이미지 목록(등록 후 삭제한 이미지도 우선은 모두 올라감: 서비스단에서 지움) -->
				<div id="summernote_image_list"></div>


				<div style="margin-top: 20px; text-align: right;">
					<button class="btn">작성완료</button>
					<input class="btn" type="reset" value="제목초기화">
					<input class="btn" type="button" value="목록" id="btn_list"> 
				</div>
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