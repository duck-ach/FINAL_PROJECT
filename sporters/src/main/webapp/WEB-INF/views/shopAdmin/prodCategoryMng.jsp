<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="Sporters 쇼핑몰 관리자페이지" name="title" />
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<body>
<script>

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
					  	.append($('<td><a href="/shopAdmin/categoryRemove?prodCategoryNo='+data.prodCategoryNo+'"><i class="fa-sharp fa-solid fa-trash"></i></a>'))
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
<img alt="logoImage" src="${contextPath}/resources/images/shopAdmin/mainLogoImage.jpeg" width="100px">
<hr>
<h2>카테고리 추가</h2>
<form id="addCategoryFrm" method="post" action="/shopAdmin/categoryAdd">
	<label for="cateName">카테고리 이름</label>
	<input type="text" id="cateName">
	<button>Add</button>
</form>
<hr>

<table>
	<thead>
		<tr>
			<td>카테고리 번호</td>
			<td>카테고리 이름</td>
			<td>삭제</td>
		</tr>
	</thead>
	<tbody id="categoryList">
	
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" style="text-align: center;">
				${paging}
			</td>
		</tr>
	</tfoot>
</table>

</body>
</html>