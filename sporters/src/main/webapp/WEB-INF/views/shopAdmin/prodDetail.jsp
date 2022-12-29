<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰상품관리-상세${product.prodName}" name="title" />
</jsp:include>
<jsp:include page="shopAdminLeftSide.jsp">
	<jsp:param value="left_side" name="left_side" />
</jsp:include>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script>
	$('.shopAdmin').addClass('checked');
</script>
<body>
	<h1>상품관리</h1>
	<div>
		<span>${product.prodName}</span>
	</div>
	<div>
		<form id="frm_btn" method="post">
			<input type="hidden" name="prodNo" value="${product.prodNo}">
			<input type="button" value="상품수정" id="btn_edit_prod">
			<input type="button" value="상품삭제" id="btn_remove_prod">
			<input type="button" value="목록" onclick="location.href='/shopAdmin/prodManage'">
		</form>
		<script>
			$('#btn_edit_prod').click(function(){
				$('#frm_btn').attr('action', '/shopAdmin/prod/edit');
				$('#frm_btn').submit();
			});
			$('#btn_remove_prod').click(function(){
				if(confirm('상품을 삭제하게 되면 다시 되돌리거나 확인할 수 없습니다. 상품을 삭제하시겠습니까?')){
					$('#frm_btn').attr('action', '/shopAdmin/prod/remove');
					$('#frm_btn').submit();
				}
			});
		</script>
	</div>
	<hr>
	
	<div>
		<table>
			<tbody>
				<tr>
					<td>상품번호</td>
					<td>${product.prodNo}</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>${product.prodName}</td>
				</tr>
				<tr>
					<td>대표사진(썸네일)</td>
					<td><img src="/shopAdmin/prod/display?prodNo=${product.prodNo}" width="500px" class="attach_img" alt="thumbnail_img" title="${prod.filesystem}"></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>${product.prodCategory.prodCategoryName}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${product.price}</td>
				</tr>
				<tr>
					<td>할인가격</td>
					<td>${product.discount}</td>
				</tr>
				<tr>
					<td>재고</td>
					<td>${product.stock}</td>
				</tr>
			</tbody>
		</table>
		<div>
			${product.prodContent}
		</div>
	</div>
</body>
</html>