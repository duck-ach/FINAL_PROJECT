<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="Sporters 쇼핑몰 관리자페이지" name="title" />
</jsp:include>
<jsp:include page="shopAdminLeftSide.jsp">
	<jsp:param value="left_side" name="left_side" />
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<style>
h2 {
	font-size: 30px;
}

input_cate {
	width: 200px;
}

tr{
	height:35px;
	border-bottom: 1px solid #000;
	padding-bottom:2px;
}

tr td{
	vertical-align: middle;
	text-align: center;
}

.tbl_wrap {
	width: 600px;
	margin: 0 auto;
}
</style>
<body>
<script>
	// shopAdmin css
	$('.shopAdmin').addClass('checked');

	$(window).on('load', function(){
		fn_getCateList();
	});
	
	function fn_getCateList() {
		$.ajax({
			type: 'get',
			url : '/shopAdmin/getCategoryList',
			dataType : 'json',
			success : function(resData) {
				$('#categoryList').empty();
				$.each(resData, function(i, data){
						$('<tr>')
					  	.append($('<td>').text(data.prodCategoryNo))
					  	.append($('<td>').text(data.prodCategoryName))
					  	.append($('<td><a style="display:block;" href="/shopAdmin/categoryRemove?prodCategoryNo='+data.prodCategoryNo+'"><i class="fa-sharp fa-solid fa-trash"></i></a>'))
					  	.appendTo('#categoryList');
				});
			}
		});
	};
	
	
	$(function(){
	
		$('#addCategoryFrm').submit(function(){
			
			// 만약 빈칸이라면 submit 방지
			if($('#cateName').val() == '') {
				alert('카테고리 이름을 입력해주세요.');
				event.preventDefault();
				return;
			}
			
			$.ajax({
				type: 'post',
				url : '/shopAdmin/categoryAdd',
				data: 'cateName=' + $('#cateName').val(),
				success : function() {
					alert('성공적으로 카테고리가 추가되었습니다.');
				}
			});
			
		});
		
	});
</script>
<div class="body_wrap">
	<div class="code_wrap">
		<h2>카테고리 추가</h2>
		<form id="addCategoryFrm" method="get">
			<label for="cateName">카테고리 이름을 입력하세요.</label><br>
			<input type="text" id="cateName" class="input_cate">
			<button>Add</button>
		</form>
		
		<hr>
	
		<table class="tbl_wrap">
			<colgroup>
					<col style="width:15%">
					<col style="width:70%">
					<col style="width:15%">
				</colgroup>
			<thead>
				<tr>
					<td>카테고리 번호</td>
					<td>카테고리 이름</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody id="categoryList">
			
			</tbody>
		</table>
	</div>

</div>
</body>
</html>