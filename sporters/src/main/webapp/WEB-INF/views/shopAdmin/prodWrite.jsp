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
			]
		});
	});
</script>
<body>
	<form>
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
			<div>
				<button>등록하기</button>
			</div>
		</div>
	</form>
</body>
</html>