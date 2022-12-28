<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰주문관리" name="title" />
</jsp:include>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<body>
<div>
	<table>
		<thead>
			<tr>
				<td>주문번호</td>
				<td>주문자 정보</td>
				<td>수령인</td>
				<td>수령자 번호</td>
				<td>결제가격</td>
				<td>배송상태</td>
				<td>주문날짜</td>
				<td>상세보기</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderList}" var="order">
				<tr>
					<td>${order.orderNo}</td>
					<td>${order.users.name}</td>
					<td>${order.name}</td>
					<td>${order.mobile}</td>
					<td>${order.priceAll}</td>
					<td>${order.orderState}</td>
					<td>${order.orderDate}</td>
					<td><a href="/shopAdmin/order/detail?orderNo=${order.orderNo}">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>