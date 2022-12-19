<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(document).ready(function(){
		fn_findPw();
	});
	
	function fn_findPw(){
		$('#btn_findPw').click(function(){
			new Promise(function(resolve, reject){
				if($('#id').val() == '' || $('#email').val() == ''){
					reject('아이디와 이메일을 입력하세요!');
					return;
				}
				$.ajax({
					type: 'post',
					url: '/users/findPw',
					contentType: 'application/json',
					data: JSON.stringify({
						'id': $('#id').val(),
						'email': $('#email').val() 
					}),
					dataType: 'json',
					success: function(resData){
						if(resData.findUser != null){
							resolve(resData.findUser);
						} else {
							reject('일치하는 회원 정보가 없습니다.');
						}
					}
				});
			}).then(function(findUser){
				$.ajax({
					type: 'post',
					url: '/users/sendTemporaryPassword',
					data: 'userNo=' + findUser.userNo + "&email=" + findUser.email,
					dataType: 'json',
					success: function(resData){
						if(resData.isSuccess){
							alert('등록된 이메일로 임시 비밀번호가 발송되었습니다.');
							location.href = '/';
						}
					}
				});
			}).catch(function(msg){
				alert(msg);
			});
		});
	}
	
	
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			
			<div> 🔍 비밀번호 찾기 </div>
			
			<div>
				<label for="id">
					* 아이디 <br>
					<input type="text" name="id" id="id">
				</label>
			</div>
			
			<div>
				<label for="email">
					* 이메일<br>
					<input type="text" name="email" id="email">
				</label>
			</div>
			
			<div>
				<input type="button" value="임시 비밀번호 발급받기" id="btn_findPw">
			</div>
			
			<div>
				<input type="button" value="로그인" onclick="location.href='/users/login/form'">
				<input type="button" value="회원가입" onclick="location.href='/users/agree/form'">
				<input type="button" value="아이디찾기" onclick="location.href='/users/findId/form'">
			</div>
			
			<hr>
			
			<div id="msg_result"></div>
			
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>