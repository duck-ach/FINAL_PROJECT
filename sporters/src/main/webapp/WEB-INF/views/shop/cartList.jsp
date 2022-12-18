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
		
		$(".btn_addCart").click(function(){
			var prodNo = $('#prodNo').val();
			var prodCnt = $('#prodCnt').val();
			
			var data = {
					prodNo: prodNo,
					prodCnt: prodCnt
					};
			alert(prodNo);
			alert(prodCnt);
			alert(data);
			
			$.ajax({
				url: '/shop/addCart',
				type: 'post',
				data: data,
				success: function(

				
				){
					alert('카트 담기 성공');
					$('#prodCnt').val("1");
				},
				error: function(){
					alert('카트 담기 실패');
				}
			})
		});
		
		$('#prodCnt').keyup(function(){
			if($(this).val() > $('#prodBuyCnt').val()){
				alert('현재 구매하실 수 있는 수량은 ' + ${list.stock} + '개 입니다.');
				$(this).val() == $('#prodBuyCnt').val();
				return;
			}
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
			<table>
				<tbody>
					<c:forEach items="${cartList}" var="cartList">
						<tr class="product">
							<td>
							<img src="${cartList}"><br>
							<a href="${contextPath}/shop/cartlist?userNo=${cartList}">${cartList}</a><br>
							<input type="hidden" id="prodNo" value="${cartList}">
							가격 : ${cartList} 원<br>
							<span>재고 : ${cartList} 개<br></span>
							구매할 수량 : 
							<select name="prodCnt" id="prodCnt">
							<%for(int i=1; i<100; i++){%>
								<option value="<%=i%>"><%=i%></option>
							<%}%>
							</select>개
							<button class="btn_buy">구매하기</button>
							<button class="btn_addCart">장바구니 담기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">${paging}</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>