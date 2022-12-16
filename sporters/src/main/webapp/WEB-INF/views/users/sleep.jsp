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
			<div>❗❗휴면계정안내❗❗</div>
			
			<div>
				안녕하세요 <br>
				${sleepUser.sleepUserId}님은 1년 이상 로그인하지 않아 관련 법령에 의해 휴면계정으로 전환되었습니다. <br><br>
				<ul>
					<li>가입일 ▷ ${sleepUser.joinDate}</li>
					<li>마지막 로그인  ▷ ${sleepUser.lastLoginDate}</li>
					<li>휴면계정전환일 ▷ ${sleepUser.sleepDate}</li>
				</ul>
			</div>
			
			<hr>
			
			<div>
				<div> 휴면해제를 위해 아래 버튼을 클릭해주세요 :)</div>
				<form id="frm_comeback" action="/users/comeback" method="post">
					<div>
						<button>휴면해제하기</button>
						<input type="button" value="취소" onclick="location.href='/'">
					</div>
				</form>
			
			</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>