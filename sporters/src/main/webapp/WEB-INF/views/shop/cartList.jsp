<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script>

	$(document).ready(function(){
		
		
	
	});
	
</script>
<style>
	ul {
		padding: 0;
	}
	li {
		list-style:none;
	}
	a {
		text-decoration:none;
	}
	#paging {
		text-align: center;
	}
	#aside {
		float: left;
		width: 180px;
	}
	#aside h3 {
		width: 180px;
		font-size:22px;
		margin-bottom:20px;
		text-align: center; 
	}
	#aside li {
		font-size:16px;
		text-align:center;
	}
	#aside li a {
		color:#000;
		display:block;
		padding:10px 0;
	}
	#aside li a:hover {
		text-decoration:none;
		background:#eee;
	}
	#title {
		font-size: 24px;
		text-align: center;
	}
	.product {
		width: 169px;
		height: 300px;
		float: left;
		padding-left: 10px;
	}
</style>
<body>
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	<div id="aside">
		<br>
		<h3>카테고리</h3>
		<ul>
			<li><a href="">음식</a></li>
			<li><a href="">의류</a></li>
			<li><a href="">기타</a></li>
		</ul>
	</div>
	<div>
		<form id="frm_product">
			<ul>
				<li>
					<div class="allCheck">
						<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
					</div>
		  
					<div class="delBtn">
						<button type="button" class="selectDelete_btn">선택 삭제</button> 
					</div>
				</li>
				<c:forEach items="${cartList}" var="cartList">
					<li class="product">
						<input type="hidden" id="prodNo" value="${cartList.prodNo}">
	 					<a href="${contextPath}/shop/detail?prodNo=${cartList.prodNo}">${cartList.product.prodName}</a><br>
						<span>가격 : <fmt:formatNumber pattern="###,###,###" value="${cartList.product.price}" /> 원<br /></span>
						<span>재고 : ${cartList.product.stock} 개</span><br>
						<span>구매할 수량 : 
						<select name="prodCnt" id="prodCnt">
						<%for(int i=1; i<100; i++){%>
							<option value="<%=i%>"><%=i%></option>
						<%}%>
						</select>개</span>
						<div class="delete">
							<button type="button" class="delete_btn" data-cartNum="${cartList.cartNo}">삭제</button>
						</div>
					</li>
					<c:set var="sum" value="${sum + (cartList.product.price * cartList.prodCnt)}" />
				
				</c:forEach>
			</ul>
		</form>
	</div>
	<div id="paging">
		${paging}
	</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>