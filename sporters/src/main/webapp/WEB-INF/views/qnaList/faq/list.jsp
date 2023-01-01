<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.first_div {
		width: 60%;
		margin: auto;
	}
	
	.div_form {
		margin: auto;
   		width: 75%;
   		position: relative;
   		padding-bottom: 20px;
   		margin-top: 30%;
	}
	

	/* 버튼 */
	.div_btns{
		width: 100%;
	    text-align: right;
	}

	.btn {
	  	position: relative;
		display: inline-block;
		text-align: center;
	    height: 30px;
	    border: none;
	    font-size: 14px;
	    color: white;
	    background-color: #c8c8ff;
	    border-radius: 4px;
    	margin-bottom: 19px;
    	margin-left: 10px;
	}
	
	.btn:active {
	  top: 4px; 
	}
	
	.btn.purple {box-shadow:0px 4px 0px #b6b6f3;}
	.btn.purple:active {box-shadow: 0 0 #b6b6f3; background-color: #c8c8ff;}
	
	.rounded {
	  border-radius: 10px;
	}
	
	.btn.purple, .btn-two.purple {background-color: #c8c8ff;}
	
	/* 헤더 */
		
	.mapage_div { 
	  position: relative; 
	  font-size: 32px; 
	  font-weight: bold; 
	  text-align: center; 
	}
	
	.mapage_div:before,
	.mapage_div:after {
	  content: '[';
	  display: inline-block;
	  position: relative;
	  top: 1px;
	  height: 5%;
	  font-size: 1.25em;
	  color: #8282ff;
	  transition: all 0.5s ease;
	}
	
	.mapage_div:after { content: ']'; }
	
	.mapage_div:hover:before { 
	  transform: translateX(-5px);
	}
	
	.mapage_div:hover:after { 
	  transform: translateX(5px);
	}
	
	/* 토글 */
	
	.blind{
		display: none;
	}
	
	#list_table {
		width: 60%;
	    margin: auto;
	    font-size: 20px;
	}
	
	.table_class {
		text-align: center;
		width: 70%;
		margin: auto;
    	border-collapse: collapse;
	}
	
	#table_list_no {
		width: 10%
	}
	
	.no_td {
		width: 10%
	}
	
	#table_list_title {
		width: 70%; 
		text-align: left;
	}
	
	.title_td {
		width: 70%; 
		text-align: left;
	}
	
	
	.reply_tr {
		width: 50%; 
		text-align: left;
	}
	/*
	#title_td {
		text-align: left;
	}
	*/
	
	#div_btn_write {
		width: 100%;
   	 	text-align: right;
   	 	margin-top: 10px;
	}
	
	.span_no {
		width: 10%;
		text-align: left;
	}
	
	.span_title {
		width: 85%;
	}
	.div_container {
		width: 100%;
	}
	
	.tr_toggle {
		width: 100%;
	}
	
</style>

<script>
	$(document).ready(function(){
		$('#btn_write').click(function(){
			location.href = '/faq/write';
		});
	});
	
	$(document).ready(function(){
		$('.tr_toggle').click(function(){
			$('.reply_tr').addClass('blind');
			$(this).next('.reply_tr').removeClass('blind');
		});
	});
</script>

<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->	
	<div id="first_div">
		<div class="mapage_div"> FAQ </div>
		<div id="div_form">
			<c:if test="${loginUser.id == 'admin'}">
				<div class="div_btns">
					<input class="btn purple" type="button" id="btn_write" value="작성">
				</div>
			</c:if>
			<div class="table_class">
				<div>				
					<div class="div_container">
						<span class="span_no" id="table_list_no">번호</span>
						<span class="span_title" id="table_list_title">제목</span>
					</div>
				</div>
				<div>
					<c:forEach items="${faqList}" var="faq" varStatus="vs">
						<c:if test="${faq.state == 1}">
							<div class="tr_toggle">
								<span class="no_td span_no">${beginNo - vs.index}</span>
								<span class="title_td span_title">${faq.faqTitle}</span>
							</div>

							<div class="reply_tr blind">
								<span>
									<c:if test="${faq.depth > 0}">
										${faq.faqContent}
									</c:if>
								</span>
							</div>
						</c:if>
					</c:forEach>
				</div>
<!-- 				<tfoot>
					<tr>
						<td colspan="2">검색</td>
					</tr>
				</tfoot> -->
			</div>
		</div>
	</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->
</body>
</html>