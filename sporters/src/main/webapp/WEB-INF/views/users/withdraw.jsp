<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		fn_withdraw();
	});
	
	function fn_withdraw(){
		$('#btn_withdraw').click(function(){
			if($('#pw').val() == ''){
				alert('비밀번호를 입력해 주세요.');
				event.preventDefault();
			} else if ($('#pw').val() == ${loginUser.pw}){
				if(confirm('동일한 아이디로 재가입이 불가능합니다. 회원 탈퇴하시겠습니까?')){
					$('#lnk_withdraw').submit();
				}				
			}
		});
	}
	
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div> 탈퇴한 아이디는 사용할 수 없게 됩니다 <br> 탈퇴를 원하시는 경우 비밀번호를 입력해주세요!</div>
			<input type="hidden" name="userNo" value="${loginUser.userNo}">
			<div>
				<label for="pw">비밀번호 확인 ▷ </label>
				<input type="password" id="pw" name="pw">
			</div>
			<div>
				<input type="button" id="btn_withdraw" value="탈퇴하기"></input>
				<input type="button" value="돌아가기" onclick="location.href='/users/mypage'">
			</div>
			<form id="lnk_withdraw" action="/users/withdraw" method="post"></form>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>