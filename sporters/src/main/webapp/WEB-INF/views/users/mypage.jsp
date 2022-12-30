<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>

	.div_btns{
		padding-top: 26px;
	    padding-bottom: 100px;
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
	
	.first_div {
		width: 60%;
		margin: auto;
	}
	
	/* 헤더 */
		
	.mapage_div { position: relative; }
	
	.mapage_div:before,
	.mapage_div:after {
	  content: '[';
	  display: inline-block;
	  position: relative;
	  top: 1px;
	  height: 100%;
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
	
</style>

<script>
	$(function(){
		fn_goodAndHate();
	});
	
	function fn_goodAndHate(){
		$.ajax({
			url: '/heart/likeNhate',
			type: 'get',
			data: '&userNo=' + $('#userNo').val(),
			dataType: 'json',
			success: function(resData){
				$('#good_hate_count').empty();
				$('#good_hate_count').text(resData.result);
			}
		});
	}
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div class="first_div">
			<div class="mapage_div" style="font-size: 32px; font-weight: bold; text-align: center;"> MY PAGE </div>
				
				<div style="height: 20px;"></div>
				
				<form id="frm_info" action="/users/info" method="post">
					<div>
						<span>아이디</span> : <span>${loginUser.id}</span>
					</div>
					<div>
						<span>닉네임</span> : <span>${loginUser.nickname}</span>
					</div>
					<div>
						<span>이름</span> : <span>${loginUser.name}</span>
					</div>
					<div>
						<span>이메일 주소</span> : <span>${loginUser.email}</span>
					</div>
					<div>
						<span>호감도</span> : <span id="good_hate_count"></span>
					</div>
					<div>
						<span>가입일</span> : <span>${loginUser.joinDate}</span>
					</div>
				</form>
				
				<div style="border-bottom: 1px solid #8c8cff; height: 20px;"></div>
				
				<div class="div_btns" style="text-align: right;">
					<input class="btn purple" type="button" value="회원정보 변경" onclick="location.href='/users/check/form'">
					<input class="btn purple" type="button" value="비밀번호 변경" onclick="location.href='/users/modify/pw'">
					<input class="btn purple" type="button" value="탈퇴" onclick="location.href='/users/withdraw'">
				</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>