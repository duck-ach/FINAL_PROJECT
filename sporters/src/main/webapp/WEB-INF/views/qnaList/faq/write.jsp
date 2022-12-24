<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="자주묻는질문" name="title" />
</jsp:include>
<script>

	$(document).ready(function(){
		
		// 서머노트
		$('#faqContent').summernote({
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
			location.href = '/faq/list';
		});
		
	
		// 서브밋
		$('#frm_write').submit(function(event){
			if($('#faqTitle').val() == ''){
				alert('제목은 필수입니다.');
				event.preventDefault();
				return;
			}
		})
	
	});

</script>
<body>
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			
			<form id="frm_write" action="/faq/add" method="post" >
				<div style="margin-top: 50px; margin-bottom: 15px;">
					<input class="title-class" type="text" name="faqTitle" id="faqTitle" placeholder="제목">
				</div>
				<hr>		
				<div style="margin-top: 20px;">
					<textarea name="faqContent" id="faqContent"></textarea>
				</div>
				<div style="margin-top: 20px; text-align: right;">
					<button class="btn">작성완료</button>
					<input type="hidden" name="groupNo" value="0">
					<input type="hidden" name="depth" value="1">
					<input type="reset" value="초기화">
					<input type="button" value="목록" id="btn_list"> 
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