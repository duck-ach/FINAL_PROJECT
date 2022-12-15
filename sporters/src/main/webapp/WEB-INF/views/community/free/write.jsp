<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="자유게시판" name="title" />
</jsp:include>
<style>
	
	 .title-class{
	 	width:100%;
	 }

</style>
<body>
 
<script>

//contextPath를 반환하는 자바스크립트 함수
function getContextPath() {
	var begin = location.href.indexOf(location.origin) + location.origin.length;
	var end = location.href.indexOf("/", begin+1);
	return location.href.substring(begin, end);
}

$(document).ready(function(){
	
	//console.log(getContextPath());// 로그용 호출
	
	// summernote
	$('#content').summernote({
		width: 800,
		height: 400,
		lang : 'ko_KR',
		toolbar: [
		    // [groupName, [list of button]]
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['insert', ['link', 'picture', 'video']],
		    ['height', ['height']]
		  ],
		  callbacks: {
			  
			  // summernote 편집기에 이미지를 로드할 때 이미지는 function의 매개변수 files로 전달됨
			  onImageUpload: function(files){
				  // 이미지 ajax를 이용해서 서버로 보낼때 가상 form 데이터 사용
				  var formData = new FormData();
				  formData.append('file', files[0]); // 파라미터 file, summernote 편집기에 추가

				  // 이미지를 hdd에 저장하고 경로를 받아오는 ajax
				  $.ajax({
					  type: 'post',
					  url: '/free/uploadImage',
					  data : formData,
					  contentType: false,
					  processData: false,
					  dataType : 'json',
					  success: function(resData){
						  $('#content').summernote('insertImage', resData.src);
						  
						  /*
						  	src =${contextPath}/load/image/aaa.jpg 값이 넘어온 경우
						  	summernote는
						  	<img src="${contextPath}/load/image/aaa.jpg"> 태그를 만든다.
						  	
						  	스프링에서 정적 자원 표시하는 방법은 servlet-context.xml에 있다
						  	
						  	mapping=${contextPath}/load/image/aaa.jpg 인 파일의
						  	location=C:\\upload\\aaa.jpg이다.
						  	이미지의 매핑과 로케이션을 서블릿 콘택스트에 저장해야ㅎ한다
						  */
					  }
					});  // ajax
				}  // onImageUpload
			}  // callbacks
		});
		
	
	// 목록
	$('#btn_list').click(function(){
		location.href =  '/free/list';// taglib 사용이 어려울수도 있으니까
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
			
			<form id="frm_write" action="/free/add" method="post" >
				<div style="margin-top: 50px; margin-bottom: 15px">
					<input class="title-class" type="text" name="title" id="title" placeholder="제목">
				</div>
				
				<hr style="background: #D5C2EE; height: 1px; color: #D5C2EE;">
				
				<div style="margin-top: 20px">
					<textarea name="content" id="content"></textarea>
				</div>
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