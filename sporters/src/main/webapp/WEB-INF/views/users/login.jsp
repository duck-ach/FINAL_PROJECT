<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>

#background {
    width: 200px;
    margin: auto;
    margin-top: 10%;
    min-width: 40%;
}

#input_box {
	width: 100%;
    height: 52px;
    background: #fff;
    border: 1px solid #ddd;
    box-sizing: border-box;
    border-radius: 8px;
    padding-left: 20px;
    font-size: 16px;
    margin-bottom: 5px;
}

#id, #pw {
	border: none;
	height: 45px;
	width: 98%;
}


#btn_login {
	display: block;
    text-align: end;
    display: block;
    color: #fff;
    text-align: center;
    background: #8c8cff;
    line-height: 52px;
    height: 52px;
    width: 100%;
    border-radius: 8px;
    margin-top: 20px;
    font-weight: 500;
    font-size: 16px;
}

#login {
	border: none;
	background: #8c8cff;
	color: white;
	width: 98%;
	height: 45px;
}

</style>
<script>
	$(function(){
		fn_login();
		fn_showRememberId();
		fn_btnLogin();
		//fn_openUserInfo();
	});
	
	//var infoWindow;
	
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
			$('#id').val(rememberId);
			$('#rememberId').prop('checked', true);
		}
	}
	
	function fn_btnLogin(){
		$('#login').click(function(){
			$('#frm_login').submit();
		});
	}
	
/*
	function fn_openUserInfo(){
		$('#to_userInfo').click(function(){
			infoWindow = window.open('/users/userInfo?userNo=' + ${user.userNo}, 'userInformation', 'width=500,height=300,top=100,left=500,menubar=no,history=no');
		});
	}
*/	
	
	
</script>
<body>

<div id="background">
	<c:if test="${loginUser == null}">
		<div id="div_login_form">
			<form id="frm_login" action="/users/login" method="post">
				<input type="hidden" name="url" value="${url}">
				<div id="input_box">
					<input type="text" name="id" id="id" placeholder="ID">
				</div>
				<div id="input_box">
					<input type="password" name="pw" id="pw" placeholder="PASSWORD">
				</div>
				<div id="btn_login">
					<input type="button" id="login" value="로그인">
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
				<a href="/users/findId/form">아이디 찾기</a> ｜
				<a href="/users/findPw/form">비밀번호 찾기</a>
			</div>
			<div>
				<a href="/users/agree/form">회원가입</a>
			</div>
			
			<div style="border-bottom: 1px solid lightgray; height: 5px;"></div>
			
			<div>
				<a href="${apiURL}"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
			</div>
	
		</div>
		
	</c:if>
</div>		


</body>
</html>