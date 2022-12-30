<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script>

	$(document).ready(function(){
		
		$("#btn_addCart").click(function(){
			var prodNo = $('#prodNo').val();
			var prodCnt = $('#prodCnt').val();
			alert(prodCnt);
			var data = {
					prodNo: prodNo,
					prodCnt: prodCnt
					};
			
			$.ajax({
				url: '/shop/addCart',
				type: 'post',
				data: data,
				success: function(result){
					if(result == 1){
						alert('카트 담기 성공');
						$('#prodCnt').val("1");
					} else {
						if(confirm('회원만 사용할 수 있습니다. 로그인하시겠습니까?')){
							location.href="/users/login/form";
							$('#prodCnt').val("1");
						}
					}
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
			<div><img src="/shopAdmin/prod/display?prodNo=${product.prodNo}" width="100px" class="attach_img" alt="thumbnail_img" title="${product.prodThumbnail.tnFilesystem}"></div>
			<div>
				<input type="hidden" id="prodNo" value="${product.prodNo}">
				<h1>&#91;${product.prodCategory.prodCategoryName}&#93; ${product.prodName}</h1> 
				<span>${product.prodContent}</span><br>
				<span>가격 : <fmt:formatNumber pattern="###,###,###" value="${product.price}" /> 원<br /></span>
				<span>재고 : ${product.stock} 개</span><br>
				<span>
					구매할 수량 : 
					<select name="stock" id="prodCnt">
					<%for(int i=1; i<100; i++){%>
						<option value="<%=i%>"><%=i%></option>
					<%}%>
					</select>개
				</span><br>
				<button>구매하기</button>
				<button id="btn_addCart">장바구니</button>
			</div>
		</div>
		
		<div></div>
	
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>