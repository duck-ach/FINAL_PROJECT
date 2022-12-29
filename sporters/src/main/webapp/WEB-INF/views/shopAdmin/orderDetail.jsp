<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰주문상세" name="title" />
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
<div>
	<div>
		<table>
			<tbody>
				<tr>
					<td>주문번호</td>
					<td>${order.orderNo}</td>
				</tr>
			</tbody>
		</table>
		<table>
			<tbody>
				<tr>
					<td>주문일자</td>
					<td>${order.orderDate}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<td colspan="3">구매상품목록</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderInfo}" var="oi">
					<tr>
						<td>상품명 : </td>
						<td>${oi.product.prodName}</td>
					</tr>
					<tr>
						<td>상품원가 : </td>
						<td>${oi.product.price}</td>
					</tr>
					<tr>
						<td>할인가 : </td>
						<td>${oi.product.discount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
		<table>
			<thead>
				<tr>
					<td colspan="3">유저정보</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>주문인 : ${order.users.name}</td>
					<td>수령인 : ${order.name}</td>
					<td>수령인 연락처 : ${order.mobile}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div>
		<table>
			<thead>
				<tr>
					<td colspan="4">배송주소</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>우편번호 : ${order.postcode}</td>
					<td>도로명주소 : ${order.roadAddress}</td>
					<td>지번주소 : ${order.jibunAddress}</td>
					<td>상세주소 : ${order.detailAddress}</td>
				</tr>
			</tbody>
		</table>
	</div>
	

</div>
</body>
</html>