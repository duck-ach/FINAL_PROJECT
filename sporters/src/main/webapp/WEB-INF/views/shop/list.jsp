<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script>

	$(function(){
		fn_addCart();
		fn_buy();
	});
	
	function fn_addCart(){
		$('.btn_addCart').click(function(){
			var prodNo = $('.prodNo').val();
			var prodCnt = $('.prodCnt').val();
			var data = {
					prodNo: prodNo,
					prodCnt: prodCnt
					};
			var prodNo = $('.prodNo').val();
			alert(prodNo);
			
			$.ajax({
				type: 'get',
				url: '/cartList/sameProdNo',
				data: 'prodNo=' + prodNo,
				dataType: 'json',
				success: function(resData){
					if(resData.product){
						alert('이미 장바구니에 담아둔 상품입니다..');
					}
				},
				error: function(){
					alert('ㅋㅋ 에러');
					console.log(resData.product);
				}
			});
			
			$.ajax({
				url: '/shop/addCart',
				type: 'post',
				data: data,
				success: function(){
					alert('카트 담기 성공');
				},
				error: function(){
					alert('카트 담기 실패');
				}
			});
		}); 
	}
	
	function fn_buy(){
		$('.btn_buy').click(function(){
			var prodCnt = $('.prodCnt').val();
			var stock = $('.stock').val();
			var prodName = $('.prodName').val();
			if(prodCnt > stock) {
				alert('구매량이 재고량보다 많습니다.');
				prodcnt == stock;
			} else {
				if(confirm(prodName + ' \'' + prodCnt + '\'개 구매하시겠습니까?')){
					location.href = '/shop/cart';
				}
			}
		});
	}
	
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
			<li><a href="/shop/list?c=1">음식</a></li>
			<li><a href="/shop/list?c=2">의류</a></li>
			<li><a href="/shop/list?c=3">기타</a></li>
			<li><a href="/shop/cartList">장바구니로 이동</a></li>
		</ul>
	</div>
	<div>
		<c:forEach items="${productList}" var="list">
			<form id="frm_product">
				<ul>
					<li class="product">
						<img src="${list.prodThumbnail}"><br>
						<input type="hidden" class="prodNo" value="${list.prodNo}">
						<a href="${contextPath}/shop/detail?prodNo=${list.prodNo}">${list.prodName}</a><br>
						<input type="hidden" class="prodName" value="${list.prodName}">
						<span>가격 : <fmt:formatNumber pattern="###,###,###" value="${list.price}" /> 원<br /></span>
						<span>재고 : ${list.stock} 개</span><br>
						<input type="hidden" class="stock" value="${list.stock}">
						<span>구매할 수량 : 
						<select name="prodCnt" class="prodCnt">
						<%for(int i=1; i<100; i++){%>
							<option value="<%=i%>"><%=i%></option>
						<%}%>
						</select>개</span>
						<button class="btn_buy">구매하기</button>
						<button class="btn_addCart" >장바구니 담기</button>
					</li>
				</ul>
			</form>
		</c:forEach>
	</div>
	<div id="paging">
		${paging}
	</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>