<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	fn_pwCheck();
	fn_pwCheckAgain();
	fn_pwSubmit();
	
	var pwPass = false;
	var rePwPass = false;
	
	function fn_pwCheck() {
		$('#pw').keyup(function(){
			let pwValue = $(this).val();
			let regPw = /^[0-9a-zA-Z!@#$%^&*]{6,20}$/;
			let validatePw = /[0-9]/.test(pwValue)        // 숫자가 있으면 true, 없으면 false
			               + /[a-z]/.test(pwValue)        // 소문자가 있으면 true, 없으면 false
			               + /[A-Z]/.test(pwValue)        // 대문자가 있으면 true, 없으면 false
			               + /[!@#$%^&*]/.test(pwValue);  // 특수문자8종이 있으면 true, 없으면 false
			if(regPw.test(pwValue) == false || validatePw < 3){
				$('#msg_pw').text('8~20자의 소문자, 대문자, 숫자, 특수문자(!@#$%^&*)를 3개 이상 조합해야 합니다.');
				pwPass = false;
			} else {
				$('#msg_pw').text('사용 가능한 비밀번호입니다.');
				pwPass = true;
			}
		});
	}
	
	function fn_pwCheckAgain(){
		$('#re_pw').keyup(function(){
			let rePwValue = $(this).val();
			if(rePwValue != '' && rePwValue != $('#pw').val()){
				$('#msg_re_pw').text('비밀번호를 확인하세요.');
				rePwPass = false;
			} else {
				$('#msg_re_pw').text('');
				rePwPass = true;
			}
		});
	}
	
	function fn_pwSubmit(){
		$('#frm_edit_pw').submit(function(event){
			if(pwPass == false || rePwPass == false){
				alert('비밀번호 입력을 확인하세요.');
				event.preventDefault();
				return;
			}
		});
	}
	
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div style="font-size: 32px; font-weight: bold;"> 비밀번호 변경 </div>
			
			<div id="modify_pw_area">
				<form id="frm_edit_pw" action="/users/modify/pw" method="post">
					<div>
						<label for="pw">새로운 비밀번호 ▷ </label>
						<input type="password" name="pw" id="pw">
						<span id="msg_pw"></span>					
					</div>
					<div>
						<label for="re_pw">새로운 비밀번호 확인 ▷ </label>
						<input type="password" id="re_pw">
						<span id="msg_re_pw"></span>
					</div>
					<div>
						<button>비밀번호 변경하기</button>
						<input type="button" value="비밀번호 변경 취소하기" id="btn_edit_pw_cancel">
					</div>
				</form>
			</div>

		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>