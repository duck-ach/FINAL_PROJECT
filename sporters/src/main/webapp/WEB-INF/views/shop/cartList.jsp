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
		
		var checkAll = document.getElementById('checkAll');
        var checkOne = document.getElementsByClassName('checkOne');
		
		checkAll.onclick = function(event) {
            for(let i = 0; i < checkOne.length; i++) {
            	checkOne[i].checked = checkAll.checked;
            }
        }

        for(let i = 0; i < checkOne.length; i++) {
        	checkOne[i].onclick = function(event) {
                let checkCount = 0;
                for(let j = 0; j < checkOne.length; j++) {
                	checkCount += checkOne[j].checked;
                }
                checkAll.checked = (checkCount == checkOne.length);
            }
        }
	
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
</style>
<body>
<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	<div>
		<form id="frm_product">
			<table border="1">
				<thead>
					<tr>
						<td>
							<div class="checkAll">
							<input type="checkbox" name="checkAll" id="checkAll"/><label for="allCheck"></label> 
							</div>
						</td>
						<td>
							<div class="delBtn">
								<button type="button" id="btn_removeCartChecked">선택 삭제</button> 
							</div>
							<script>
								$("#btn_removeCartChecked").click(function(){
									var confirm_val = confirm("정말 삭제하시겠습니까?");
								 
									if(confirm_val) {
										var checkArr = new Array();
								  
										$("input[class='checkOne']:checked").each(function(){
											checkArr.push($(this).attr("data-cartNo"));
										});
								   		console.log(checkArr);
										$.ajax({
											url: "/shop/deleteCart",
											type: "post",
											data: { "checkOne" : checkArr },
											success: function(result){
												if(result == 1) {          
													alert("삭제 성공");
												} else {
													alert("삭제 실패");
												}
											},
											error: function(){
												alert("삭제할 상품을 1개 이상 선택해주세요.");
											}
										});
									} 
								});
							</script>
						</td>
					</tr>
				</thead>
				<tbody>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
					<tr>
						<td>
							<div>
								<input type="checkbox" name="checkOne" class="checkOne" data-cartNo="${cartList.cartNo}" data-price="${cartList.product.price * cartList.prodCnt}">
							</div>
						</td>
						<td>
							<div class="delete">
								<button type="button" class="btn_delete${cartList.cartNo}" data-cartNo="${cartList.cartNo}">삭제</button>
							</div>
							<script>
								$(".btn_delete${cartList.cartNo}").click(function(){
									var confirm_val = confirm("정말 삭제하시겠습니까?");
								 
									if(confirm_val) {
										var checkArr = new Array();
								  
										checkArr.push($(this).attr("data-cartNo"));
								   		console.log(checkArr);
										$.ajax({
											url : "/shop/deleteCart",
											type : "post",
											data : { checkOne : checkArr },
											success : function(result){
												if(result == 1) {
													alert("삭제 성공");
												} else {
													alert("삭제 실패");
												}
											},
											error: function(checkArr){
												console.log(checkArr);
												alert("에러남!!");
											}
										});
									} 
								});
							</script>
							<input type="hidden" id="prodNo" value="${cartList.prodNo}">
		 					<a href="${contextPath}/shop/detail?prodNo=${cartList.prodNo}">${cartList.product.prodName}</a><br>
							<span>가격 : <fmt:formatNumber pattern="###,###,###" value="${cartList.product.price}" /> 원<br /></span>
							<span>재고 : ${cartList.product.stock} 개</span><br>
							<span>구매할 수량 : ${cartList.prodCnt} </span><br>
							<span>합계 가격 : <fmt:formatNumber pattern="###,###,###" value="${cartList.product.price * cartList.prodCnt}" /> 원</span>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="2">
							<br><div class="listResult">
								<div id="sumAll">
									
								</div>
								<div class="orderOpen"><br>
									<button type="button" id="btn_orderOpen">주문 정보 입력</button>
									<button type="button" id="btn_orderOpen_cancel">주문 정보 입력 취소</button>
								</div>
							</div><br>
						</td>
					</tr>
					
				</tbody>
			</table>
			<script>
			
				$(function(){
					fn_showHide();
				});
			
				
				
				function fn_showHide(){
					$('#sumAll').hide();
					$('#btn_orderOpen').click(function(){
						var priceArray = [];
						$('input:checkbox[name=checkOne]:checked').each(function (index){
							priceArray.push($(this).data('price'));
						});
						var sum = priceArray.reduce((a,b) => (a+b));
						console.log('합계 : ', sum);
						$('#sumAll').show();
						$.ajax({
							url : "/cartList/sumAll",
							type : 'post',
							data : 'sum=' + sum,
							success : function(sum) {
								$('#sumAll').empty();
								$('#sumAll').append('최종 구매 가격 : ' + sum.toLocaleString() + ' 원');
						     },
							error : function(sum) {
							}
						});

						
					});
					$('#btn_orderOpen_cancel').click(function(){
						$('#sumAll').hide();
					});
				}
			</script>	
				
		</form>
	</div>
	<div id="paging">
		${paging}
	</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>