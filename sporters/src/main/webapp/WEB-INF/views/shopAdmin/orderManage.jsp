<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰주문관리" name="title" />
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
<div class="body_wrap">
	<div class="code_wrap">
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
					<td>주문상태</td>
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
						<td>
							<form action="/shopAdmin/order/state" method="get">
								<input type="hidden" name="orderNo" value="${order.orderNo}">
								<select name="orderState">
									<option value="">===선택===</option>
									<option value="결제완료">결제완료</option>
									<option value="상품준비중">상품준비중</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="주문취소">주문취소</option>
								</select>
								<button>변경</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9" style="text-align: center;">
						${paging}
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
</body>
</html>