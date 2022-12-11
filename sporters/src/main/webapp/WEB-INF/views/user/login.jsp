<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPORTERS LOGIN PAGE</title>
</head>
<body>

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

</body>
</html>