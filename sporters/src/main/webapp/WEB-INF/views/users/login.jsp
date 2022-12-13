<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$(function(){
		fn_login();
		fn_showRememberId();
	});
	
	function fn_login(){
		$('#frm_login').submit(function(event){
			if($('#id').val() == '' || $('#pw').val() == ''){
				alert('아이디와 비번을 모두 입력해주세요!');
				event.preventDefault();
				return;
			}
			if($('#rememberId').is(':checked')){
				$.cookie('rememberId',$('#id').val());
			} else {
				$.cookie('rememberId','');
			}
		});
	}
	function fn_showRememberId(){
		let rememberId = $.cookie('rememberId');
		if(rememberId == ''){
			$('#id').val('');
			$('#rememberId').prop('checked', false);
		} else {
			$.('#id').val(rememberId);
			$('#rememberId').prop('checked', true);
		}
	}
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->

		<div>
			<form id="frm_login" action="${contextPath}/users/login" method="post">
				<input type="hidden" name="url" value="${url}">
				<div>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id">
				</div>
				<div>
					<label for="pw">비밀번호</label>
					<input type="password" name="pw" id="pw">
				</div>
				<div>
					<button>로그인</button>
				</div>
				<div>
					<label for="rememberId">
						<input type="checkbox" id="rememberId">
						아이디 저장
					</label>
					<label for="keepLogin">
						<input type="checkbox" name="keepLogin" value="keep" id="keepLogin">
						로그인 유지
					</label>
				</div>
			</form>
			
			<div>
				<a href="${contextPath}/users/findId">아이디 찾기</a> || 
				<a href="${contextPath}/users/findPw">비밀번호 찾기</a>
			</div>
			
			<hr>
			
			<div>
				<a href="${apiURL}"><img height="30" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
			</div>
		
		</div>
		
	</section><!-- 기본틀 2 -->
	
</section><!-- 기본틀 1 -->

</body>
</html>