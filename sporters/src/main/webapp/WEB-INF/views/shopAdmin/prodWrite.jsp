<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰상품관리" name="title" />
</jsp:include>
<script src="${contextPath}/resources/js/moment-with-locales.js"></script> <!-- ajax 날짜 시간 처리 -->
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.css">
<link rel="stylesheet" href="${contextPath}/resources/uploadcss/write_edit.css">
<script>

	$(function(){

		// summernote
		$('#content').summernote({
			width: 800,
         	height: 400,
         	lang: 'ko-KR',
			placeholder: '내용을 입력해주세요.',
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
					// 동시에 여러 이미지를 올릴 수 있음
					for(let i = 0; i < files.length; i++) {
						// 이미지를 ajax를 이용해서 서버로 보낼 때 가상 form 데이터 사용 
						var formData = new FormData();
						formData.append('file', files[i]);  // 파라미터 file, summernote 편집기에 추가된 이미지가 files[i]임						
						// 이미지를 HDD에 저장하고 경로를 받아오는 ajax
						$.ajax({
							type: 'post',
							url: getContextPath() + '/admin/prodImage',
							data: formData,
							contentType: false,  // ajax 이미지 첨부용
							processData: false,  // ajax 이미지 첨부용
							dataType: 'json',    // HDD에 저장된 이미지의 경로를 json으로 받아옴
							success: function(resData){
								
								/*
									resData의 src 속성값이 ${contextPath}/load/image/aaa.jpg인 경우
									<img src="${contextPath}/load/image/aaa.jpg"> 태그가 만들어진다.
									
									mapping=${contextPath}/load/image/aaa.jpg인 이미지의 실제 위치는
									location=C:\\upload\\aaa.jpg이므로 이 내용을
									servlet-context.xml에서 resource의 mapping값과 location값으로 등록해 준다.
									(스프링에서 정적 자원 표시하는 방법은 servlet-context.xml에 있다.)
								*/
								$('#content').summernote('insertImage', resData.src);
								
								/*
									어떤 파일이 HDD에 저장되어 있는지 목록을 저장해 둔다.
									블로그를 등록할 때 써머노트에서 사용한 파일명도 함께 등록한다.
								*/
								$('#summernote_image_list').append($('<input type="hidden" name="summernoteImageNames" value="' + resData.filesystem + '">'))
								
							}
						});  // ajax
					}  // for
				}  // onImageUpload
			}  // callbacks
		});
	});
</script>
<body>
	<form id="frm_write" action="${contextPath}/admin/prodAdd" method="post">
		<div>
			<h1>상품등록</h1>
			<div>
				<label for="prodName">상품명</label>
				<input type="text" id="prodName" required>
			</div>
			<div>
				상품카테고리
				<select>
					<option value="">===선택===</option>
					<option value="1">식품</option>
					<option value="2">의류</option>
					<option value="3">물건</option>
				</select>
			</div>
			<div>
				<label for="price">정가격</label>
				<input type="text" id="price" required>
				<label for="discount">할인가격</label>
				<input type="text" id="discount">
			</div>
			<div>
				<label for="thumbnail">상품 썸네일(대표사진)</label>
				<input type="file" multiple="multiple" accept="image/jpeg, image/jpg, image/gif, image/png, image/bmp" id="thumbnail">
			</div>
			<div>
				<label for="origin">원산지</label>
				<input type="text" id="origin">
			</div>
			<div>
				<label for="stock">재고</label>
				<input type="text" id="stock">
			</div>
			
			<div>
				<label for="content"></label>
		        <textarea name="content" id="content" placeholder="상품의 상세이미지를 첨부하고 설명을 적어주세요"></textarea>   
			</div>
			<!-- 써머노트에서 사용한 이미지 목록(등록 후 삭제한 이미지도 우선은 모두 올라감: 서비스단에서 지움) -->
			<div id="summernote_image_list"></div>
			<div>
				<button>등록하기</button>
			</div>
		</div>
	</form>
</body>
</html>