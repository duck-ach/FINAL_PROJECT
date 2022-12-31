<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
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
	}
	
	/* 버튼 */
	.div_btns{
		padding-top: 26px;
	    padding-bottom: 10px;
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

	.btn.purple, .btn-two.purple {background-color: #c8c8ff;}
	
	
	/* 본문 */
	.div_topic {
		display:inline-block;
		border: 1px solid;
		border-radius: 20px;
		color: #8282ff;
	    height: 35px;
	    width: 24%;
	    font-size: 15px;
	    text-align: center;
	    margin-bottom: 10px;
	    line-height: 35px;
	}
	
	.div_input {
		display:inline-block;
		font-size: 15px;
		border-bottom: 1px solid #8282ff;
		height: 24px;
		margin-bottom: 30px;
		padding-bottom: 10px;
    	padding-left: 7px;
    	width: 60%;
	}
	
	input {
		border: none;
		margin-top: 10px;
	}
	
	.div_box{
		margin-top: 10%;
	}

	
</style>

<script>
	
	$(document).ready(function(){
		fn_findId();
	});
	
	function fn_findId(){
		
		$('#btn_findId').click(function(){
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;
			if(regEmail.test($('#email').val()) == false) {
				alert('이메일 형식을 확인하세요!');
				$('#msg_result').text('');
				return;
			}
			
			$.ajax({
				type: 'POST',
				url: '/users/findId',
				contentType: 'application/json',
				data: JSON.stringify({
					name: $('#name').val(),
					email: $('#email').val()
				}),
				dataType: 'json',
				success: function(resData){
					if(resData.findUser != null){
						let id = resData.findUser.id;
						id = id.substring(0, 3) + '*****';
						$('#msg_result').html('회원님의 아이디는 ' + id + '입니다.');
					} else {
						$('msg_result').html('일치하는 회원이 없습니다. 입력 정보를 확인해주세요.');
					}
				}
			});
		});
	}
	
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div class="first_div">
			<div class="div_form">
			<div> 🔍 아이디 찾기 </div>
			
			<div class="div_box">
				<label class="div_topic" for="name">
					이름
				</label>
				<br>
				<input class="div_input" type="text" name="name" id="name">
			</div>
			
			<div class="div_box">
				<label class="div_topic" for="email">
					이메일
				</label>
				<br>
				<input class="div_input" type="text" name="email" id="email">
			</div>
			<div  class="div_btns">
			<div>
				<input class="btn purple" type="button" value="아이디찾기" id="btn_findId">
			</div>
			
			<div>
				<input class="btn purple" type="button" value="로그인" onclick="location.href='/users/login/form'">
				<input class="btn purple" type="button" value="회원가입" onclick="location.href='/users/agree/form'">
				<input class="btn purple" type="button" value="비밀번호찾기" onclick="location.href='/users/findPw/form'">
			</div>
			
			</div>
			
			<div style="border-bottom: 1px solid #8c8cff; height: 20px;"></div>
			
			<div id="msg_result"></div>
			</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>