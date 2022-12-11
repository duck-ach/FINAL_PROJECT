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
		<a href="${contextPath}/admin/prodWrite">상품등록</a>
	</div>
	<hr>
	<table>
		<thead>
			<tr>
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
			<c:forEach items="${productList}" var="prod">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>