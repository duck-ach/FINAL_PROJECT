<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
		<div>
			
			<div> 🔍 아이디 찾기 </div>
			
			<div>
				<label for="name">
					* 이름 <br>
					<input type="text" name="name" id="name">
				</label>
			</div>
			
			<div>
				<label for="email">
					* 이메일<br>
					<input type="text" name="email" id="email">
				</label>
			</div>
			
			<div>
				<input type="button" value="아이디찾기" id="btn_findId">
			</div>
			
			<div>
				<input type="button" value="로그인" onclick="location.href='/users/login/form'">
				<input type="button" value="회원가입" onclick="location.href='/users/agree/form'">
				<input type="button" value="비밀번호찾기" onclick="location.href='/users/findPw/form'">
			</div>
			
			<hr>
			
			<div id="msg_result"></div>
			
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>