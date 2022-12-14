<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script>

	$(document).ready(function(){
		
		
		
	});
	
</script>
<body>
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div class="product_detail_area" style="display: flex;justify-content: space-around;">
			<div>이미지영역</div>
			<div>
				<h3>&#91;${product.PROD_CATEGORY_NAME}&#93;${product.PROD_NAME}</h3> 
				<span>${product.PRICE}</span><br>
				<span>${product.PROD_CONTENT}</span><br>
				<span>
					<select>
						<option value=""></option>
					</select>
				</span><br>
				<span>${product.PROD_NAME}</span><br>
				<button>구매하기</button>
				<button>장바구니</button>
			</div>
		</div>
		
		<div></div>
	
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>