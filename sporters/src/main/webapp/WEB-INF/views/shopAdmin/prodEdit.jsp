<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰상품관리" name="title" />
</jsp:include>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="/resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="/resources/summernote-0.8.18-dist/summernote-lite.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<script>

$(document).ready(function(){
	
	fileCheck();
	
	// summernote
	$('#content').summernote({
		width: 800,
		height: 400,
		lang: 'ko-KR',
		toolbar:[
			['style', ['style']],
			['font', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			['fontname', ['fontname']],
		 	['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['fullscreen', 'codeview', 'help']],
		],
		callbacks: {
			spellCheck: true,
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
						url: '/shopAdmin/prodImage',
						data: formData,
						contentType: false,  // ajax 이미지 첨부용
						processData: false,  // ajax 이미지 첨부용
						dataType: 'json',    // HDD에 저장된 이미지의 경로를 json으로 받아옴
						success: function(resData){
							$('#content').summernote('insertImage', resData.src);
							$('#summernote_image_list').append($('<input type="hidden" name="summernoteImageNames" value="' + resData.filesystem + '">'))
						}
					});  // ajax
				}  // for
			}  // onImageUpload
		}  // callbacks
	});
	
	function fileCheck() {
		
		$('#thumbnail').on('change', function(){
			
			if(confirm('새로운 사진을 등록하면 기존 사진은 삭제됩니다. 사진을 변경하시겠습니까?')) {
				// 파일 확장자 제한
				var file_path = $(this).val();
				var reg = /(.*?)\.(gif|GIF|jpg|JPG|jpeg|JPEG|png|PNG)$/;
				
				// 허용되지 않은 확장자일 경우
				if(file_path != "" && (file_path.match(reg) == null || reg.test(file_path) == false)) {
					alert('이미지 파일만 업로드 가능합니다.');
					$(this).val('');
				}
				
				// 대표사진(썸네일) 개수 체크
				if($('#thumbnail')[0].files.length > 1) {
					console.log($(this));
					alert('대표사진은 1장만 설정할 수 있습니다.');
					$(this).val(''); 
					event.preventDefault();
					return;
				}
			} else {
				$(this).val('');
				return;
			}
				
		});
		
	}
		// 목록
		$('#btn_list').click(function(){
			location.href = '/shopAdmin/prodManage';
		});
		
		// 서브밋
		$('#frm_write').submit(function(event){
			if($('#prodName').val() == ''){
				alert('상품명은 필수입니다.');
				event.preventDefault();  // 서브밋 취소
				$('#prodName').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
			if($('#prodCategoryNo').val() == ''){
				alert('카테고리 선택은 필수입니다.');
				event.preventDefault();  // 서브밋 취소
				$('#prodCategoryNo').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
			if($('#price').val() == ''){
				alert('정가 가격 입력은 필수입니다.');
				event.preventDefault();  // 서브밋 취소
				$('#price').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
			if($('#discount').val() == ''){
				alert('할인가격 입력은 필수입니다.\n할인을 하지않으려면 정가와 같게 입력해주세요.');
				event.preventDefault();  // 서브밋 취소
				$('#discount').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
			if($('#origin').val() == ''){
				alert('원산지 입력은 필수입니다.');
				event.preventDefault();  // 서브밋 취소
				$('#origin').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
			if($('#stock').val() == ''){
				alert('재고 개수 입력은 필수입니다.');
				event.preventDefault();  // 서브밋 취소
				$('#stock').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
			if($('#content').val() == ''){
				alert('상품의 상세 내용 입력은 필수입니다.');
				event.preventDefault();  // 서브밋 취소
				$('#content').focus();
				return;  // 더 이상 코드 실행할 필요 없음
			}
			
		});
		
		
	});
</script>
<body>
	<form id="frm_write" action="/shopAdmin/prod/modify" method="post" enctype="multipart/form-data">
		<div>
			<h1>상품등록</h1>
			<input type="hidden" name="prodNo" value="${product.prodNo}">
			<div>
				<label for="prodName">상품명</label>
				<input type="text" id="prodName" name="prodName" value="${product.prodName}">
			</div>
			<div>
				상품카테고리
				<select name="prodCategoryNo" id="prodCategoryNo">
					<option value="${product.prodCategoryNo}">${product.prodCategory.prodCategoryName}</option>
					<option value="1">식품</option>
					<option value="2">의류</option>
					<option value="3">물건</option>
				</select>
			</div>
			<div>
				<label for="price">정가격</label>
				<input type="number" id="price" name="price" value="${product.price}">
				<label for="discount">할인가격</label>
				<input type="number" id="discount" name="discount" value="${product.discount}">
			</div>
			<div>
				<label for="thumbnail">상품 썸네일(대표사진)</label>
				<c:if test="${prodThumbnail.isThumbnail == 1}">
					<img src="/shopAdmin/prod/display?prodNo=${product.prodNo}" width="100px" class="attach_img" alt="thumbnail_img" title="${prod.filesystem}">
				</c:if>
				<input type="hidden" class="tnNo" name="tnNo" value="${prodThumbnail.tnNo}">
				<input type="file" name="thumbnail" accept="image" id="thumbnail" multiple="multiple" accept="image/gif, image/png, image/jpg, image/jpeg">
			</div>
			<div>
				<label for="origin">원산지</label>
				<input type="text" id="origin" name="origin" value="${product.origin}">
			</div>
			<div>
				<label for="stock">재고</label>
				<input type="number" id="stock" name="stock" value="${product.stock}">
			</div>
			
			<div>
				<label for="content"></label>
		        <textarea name="content" id="content" name="content">${product.prodContent}</textarea>   
			</div>
			<!-- 써머노트에서 사용한 이미지 목록(등록 후 삭제한 이미지도 우선은 모두 올라감: 서비스단에서 지움) -->
			<div id="summernote_image_list"></div>
			<div>
				<button>수정하기</button>
				<input type="button" value="목록" id="btn_list">
			</div>
		</div>
	</form>
</body>
</html>