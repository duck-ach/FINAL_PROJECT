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
			<div style="font-size: 32px; font-weight: bold;"> MY PAGE </div>
				<form id="frm_info" action="/users/info" method="post">
					<div>
						아이디 : ${loginUser.id}
					</div>
					<div>
						닉네임 : ${loginUser.nickname}
					</div>
					<div>
						이름 : ${loginUser.name}
					</div>
					<div>
						이메일 주소 : ${loginUser.email}
					</div>
					<div>
						호감도 : ${heartCount} + ${hateCount}
					</div>
					<div>
						가입일 : ${loginUser.joinDate}
					</div>
				</form>
				
				<hr>
				
				<div style="text-align: right;">
					<input type="button" value="회원정보 변경" onclick="location.href='/users/check/form'">
					<input type="button" value="비밀번호 변경" onclick="location.href='/users/modify/pw'">
					<input type="button" value="탈퇴" onclick="location.href='/users/withdraw'">
				</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>