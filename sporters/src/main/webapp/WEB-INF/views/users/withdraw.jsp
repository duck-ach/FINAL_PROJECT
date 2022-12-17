<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div> 탈퇴한 아이디는 사용할 수 없게 됩니다 <br> 탈퇴를 원하시는 경우 비밀번호를 입력해주세요!</div>
			
			<div>
				<label for="pw">비밀번호 확인 ▷ </label>
				<input type="password" id="pw" name="pw">
			</div>
			<div>
				<input type="button" value="탈퇴하기" onclick="location.href='/users/withdraw/form'">
				<input type="button" value="돌아가기" onclick="location.href='/users/mypage'">
			</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>