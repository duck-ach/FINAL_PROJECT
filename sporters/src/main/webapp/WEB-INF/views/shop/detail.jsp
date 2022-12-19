<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script>

	$(document).ready(function(){
		
		$(".btn_addCart").click(function(){
			var prodNo = $('#prodNo').val();
			var prodCnt = $('#prodCnt').val();
			alert(prodNo);
			var data = {
					prodNo: prodNo,
					prodCnt: prodCnt
					};
			
			$.ajax({
				url: '/shop/addCart',
				type: 'post',
				data: data,
				success: function(){
					alert('카트 담기 성공');
					$('#prodCnt').val("1");
				},
				error: function(){
					alert('카트 담기 실패');
				}
			})
		});
		
	});
	
</script>
<body>
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div class="product_detail_area" style="display: flex;justify-content: space-around;">
			<div>이미지영역</div>
			<div>
				<input type="hidden" id="prodNo" value="${product.PROD_NO}">
				<h1>&#91;${product.PROD_CATEGORY_NAME}&#93; ${product.PROD_NAME}</h1> 
				<span>${product.PROD_CONTENT}</span><br>
				<span>가격 : ${product.PRICE} 원</span><br>
				<span>재고 : ${product.STOCK} 개</span><br>
				<span>
					구매할 수량 : 
					<select name="stock">
					<%for(int i=1; i<100; i++){%>
						<option value="<%=i%>"><%=i%></option>
					<%}%>
					</select>개
				</span><br>
				<button>구매하기</button>
				<button class="btn_addCart">장바구니</button>
			</div>
		</div>
		
		<div></div>
	
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>