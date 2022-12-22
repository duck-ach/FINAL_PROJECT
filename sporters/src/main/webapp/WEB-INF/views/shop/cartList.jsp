<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters쇼핑몰페이지" name="title" />
</jsp:include>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
        
        function fn_paymentCoupon(){
        	$(document).on('click', '.btn_payment', function(){
        			
        		var IMP = window.IMP; 
        		IMP.init('imp30603183');
        		alert("123");
        		var merchant_uid = 'TagMusic_' + new Date().getTime();
        		IMP.request_pay({ 
        			pg: "html5_inicis",
        			pay_method: 'card',
        			merchant_uid: merchant_uid,
        			//name: '노래제목:'+firstCartMusicName+' 외'+ (muprice-1) +'곡',
        			name: '상품이름', 
        			amount: 10,
        			buyer_email: 'asd123@asd.com',
        			buyer_name: '구매자명',
        			buyer_tel: '010-1234-5678',
        			buyer_addr: '서울시',
        			buyer_postcode: '123-111',
        			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
        			}, function (rsp) {
        				if (rsp.success) {
        					
        					alert('성공');
        					 
        				} else {
        				var msg = '';
        				msg += rsp.error_msg;
        				alert(msg)
        			}
        				
        		});
        		
        		
        	});
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
								<div class="orderOpen">
									<button type="button" id="btn_orderOpen">주문 정보 입력</button>
									<button type="button" id="btn_orderOpen_cancel">주문 정보 입력 취소</button>
								</div><br>
								<div id="sumAll"></div>
								<div class="orderInfo">
									<form role="form" method="post" autocomplete="off">
								    
										<input type="hidden" name="amount" value="${sum}" />
								    
										<div class="inputArea">
											<label for="">수령인</label>
											<input type="text" name="orderRec" id="orderRec"/>
										</div>
																	  
										<div class="inputArea">
											<label for="orderPhon">수령인 연락처</label>
											<input type="text" name="orderPhon" id="orderPhon"/>
										</div>
																	  
										<div class="inputArea">
											<label for="userAddr1">우편번호</label>
											<input type="text" name="userAddr1" id="userAddr1"/>
										</div>
									  
										<div class="inputArea">
											<label for="userAddr2">1차 주소</label>
											<input type="text" name="userAddr2" id="userAddr2"/>
										</div>
									  
										<div class="inputArea">
											<label for="userAddr3">2차 주소</label>
											<input type="text" name="userAddr3" id="userAddr3"/>
										</div>
									  
										<div class="inputArea">
											<button type="submit" class="btn_payment">주문</button>
											<button type="button" class="cancel_btn">취소</button> 
										</div>
								  
									</form> 
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
					$('#orderDetail').hide();
					$('#btn_orderOpen').click(function(){
						var priceArray = [];
						$('input:checkbox[name=checkOne]:checked').each(function (index){
							priceArray.push($(this).data('price'));
						});
						var sum = priceArray.reduce((a,b) => (a+b));
						$('#sumAll').show();
						$('#orderDetail').show();
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
						$('#orderDetail').hide();
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