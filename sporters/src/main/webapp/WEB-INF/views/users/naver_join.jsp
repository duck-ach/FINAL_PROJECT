<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){

	});
	

	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div> 네이버 간편 가입 </div>
			<div> * 표시는 필수 입력사항입니다</div>
			
			<hr>
			
			<input type="hidden"  name="id" id="id" value="${profile.id}">
			
			<div>
				<label for="name">이름 * </label>
				<input type="text" name="name" id="name" value="${profile.name}">
			</div>
			
			<div>
				<span>성별</span>
				<input type="radio" name="gender" id="male" value="M">
				<label for="male">남자</label>
				<input type="radio" name="gender" id="female" value="F">
				<label for="female">여자</label>
			</div>

		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>