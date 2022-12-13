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
		var 
	});
	
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
		width: 300px;
		height: 300px;
		float: left;
		padding-left: 10px;
	}
</style>
<body>
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	<table>
		<thead>
			<tr>
				<td>
				<div id="aside">
					<br>
					<h3>카테고리</h3>
					<ul>
						<li><a href="">음식</a></li>
						<li><a href="">의류</a></li>
						<li><a href="">기타</a></li>
					</ul>
				</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<tr class="product">
				<c:forEach items="${productList}" var="list">
				<td></td>
				<td><img src="${list.prodThumbnail}"></td>
				<td><a href="${contextPath}/shop/detail?prodNo=${list.prodNo}">${list.prodName}</a></td>
				<td>가격 : ${list.price} 원</td>
				<td>
					재고 : ${list.stock} 개
					<button class="btn_buy">구매하기</button>
					<button class="btn_addCart">장바구니 담기</button>
				</td>
				</c:forEach>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${paging}</td>
			</tr>
		</tfoot>
	</table>
	
	
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>