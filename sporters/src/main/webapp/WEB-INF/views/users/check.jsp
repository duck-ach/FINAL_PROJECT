<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		$('#btn_check_pw').click(function(){
			$.ajax({
				type: 'post',
				url: '/users/check/pw',
				data: 'pw=' + $('#pw').val(),
				dataType: 'json',
				success: function(resData){
					if(resData.isUser){
						location.href = '/users/modify/info';
					} else {
						alert('비밀번호를 확인하세요.');
					}
				}
			});
		});
	});
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div>회원의 정보를 안전하게 보호하기 위해서 비밀번호를 확인합니다.</div>
			
			<div>
				<label for="pw">비밀번호 ▷ </label>
				<input type="password" id="pw">
			</div>
			
			<div>
				<input type="button" value="취소" onclick="history.back()">
				<input type="button" value="확인" id="btn_check_pw">
			</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>