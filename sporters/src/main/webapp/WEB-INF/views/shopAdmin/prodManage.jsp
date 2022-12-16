<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰상품관리" name="title" />
</jsp:include>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<body>
<script>
	$(function(){
		$('.attach_img').tooltip();
	});
</script>
	<h1>상품관리</h1>
	<div>
		<span>상품목록 (전체 ${totalRecord}개)</span>
		<a href="/shopAdmin/prod/write">상품등록</a>
	</div>
	<hr>
	<table>
		<thead>
			<tr>
				<th>순번</th>
				<th>상품번호</th>
				<th>대표사진</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>가격</th>
				<th>할인가격</th>
				<th>재고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${prodList}" var="prod" varStatus="vs">
				<tr>
					<td>${beginNo - vs.index}</td>
					<td>${prod.prodNo}</td>
					<td>
						<img src="/shopAdmin/prod/display?prodNo=${prod.prodNo}" width="100px" class="attach_img" alt="thumbnail_img" title="${prod.filesystem}">
					</td>
					<td>${prod.prodCategory.prodCategoryName}</td>
					<td><a href="/shopAdmin/prod/detail?prodNo=${prod.prodNo}">${prod.prodName}</a></td>
					<td>${prod.price}</td>
					<td>${prod.discount}</td>
					<td>${prod.stock}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
				<tr>
					<td colspan="7" style="text-align: center;">
						${paging}
					</td>
				</tr>
			</tfoot>
	</table>
</body>
</html>