<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰상품관리" name="title" />
</jsp:include>
<body>
	<h1>상품관리</h1>
	<div>
		<span>상품목록 (전체 ${totalRecord}개)</span>
		<a href="${contextPath}/admin/prodWrite">상품등록</a>
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
					<td>${prod.filesystem}</td>
					<td>${prod.prodCategory.prodCategoryName}</td>
					<td>${prod.prodName}</td>
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