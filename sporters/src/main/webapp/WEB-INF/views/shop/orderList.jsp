<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

</script>
<style>
	.wrap {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.first_div {
		width: 70%;
		margin: auto;
	}
	
	.div_form {
		margin: auto;
   		width: 100%;
		border-radius: 4px;
	}
	
	.div_head{
		 background: #8c8cff; 
		 border-radius: 4px;
		 color: white;
	}
	
	span {
		display: inline-block;
		text-align: center;
		line-height: 30px;
	}
	
	.span_title{
	    width: 10%;
	}
	.span_id{
		width: 15%;
	}
	
	.span_nickname {
		width: 20%;
	}
	
	.span_gender {
		width: 10%;
	}
	
	.span_view {
		width: 30%;
	}
	
	.span_date {
		width: 15%;
	}
	
	.div_paging {
		text-align: center;
		margin-top: 3%;
	}
	
	.div_items{
		margin-bottom: 10px;
		margin-top: 10px;
		padding-bottom: 5px;
	}
	
	.div_items:hover{
		/*background-color: #f0f0ff;*/
		background-color: rgba(240, 240, 255, 0.5);
	}
	
</style>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->

<div>
	<div>
		<div class="div_head">				
			<span class="span_title">주문번호</span>	
			<span class="span_id">카트번호</span>												
			<span class="span_nickname">주문자 정보</span>
			<span class="span_gender">수령인</span>	
			<span class="span_view">수령자 번호</span>						
			<span class="span_date">결제가격</span>		
			<span class="span_date">배송상태</span>	
			<span class="span_date">주문날짜</span>	
			<span class="span_date">상세보기</span>	
			<span class="span_date">주문상태</span>											

		<!--  
			<td>작성 글 수</td>
		-->				
		</div>	
		<div id="list">						
		
			<c:forEach items="${orderList}" var="order">
				<div class="div_items">
					<span class="span_title">${order.cartBundle}</span>
					<span class="span_id">${order.orderNo}</span>
					<span class="span_nickname">${name}</span>
					<span class="span_gender">${order.name}</span>
					<span class="span_view">${order.mobile}</span>
					<span class="span_date">${order.priceAll} 원</span>
					<span class="span_date">${order.orderState}</span>
					<span class="span_date">${order.orderDate}</span>
					<span class="span_date"><a href="/shop/order/detail?orderNo=${order.orderNo}">상세보기</a></span>
					<span class="span_date">${order.orderState}</span>							
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	
	
	
	
	
	
</div>

	</section><!-- 기본틀 2 -->
	
</section><!-- 기본틀 1 -->
</body>
</html>