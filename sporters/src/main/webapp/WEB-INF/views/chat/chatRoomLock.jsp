<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sporters - 실시간 채팅</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<style>
	#wrap {
		text-align: center;
		margin-top: 280px;
	}
	
	#roomPw {
		width: 400px;
		height: 30px;
		padding-left: 10px;
		margin-right: 5px;
		border : none;
		outline: none;
		border-bottom : 1px solid #C8C8FF;
		font-size: 45px;
	}
	
	#roomPw::placeholder {
		font-size: 15px;
	}
	
	#btn_in_chat {
		width: 50px;
		height: 37px;
		border: none;
		border-radius: 3px;
		border: 1px solid #C8C8FF;
		background-color: #fff;
		cursor:pointer;
		color: #C8C8FF;
		font-weight: 700px;
	}
</style>
</head>
<body>
<script>
	$('#frm_submit').submit(function(){
		if($('#roomPw').val() == ''){
			alert('비밀번호를 입력해 주세요.');
			event.preventDefault();
			$('#roomPw').focus();
			return; 
		}
	});
</script>
<div id="wrap">
	<form id="frm_submit" action="/chat/chatRoom/lock/comfirm" method="post">
		<input type="hidden" name="chatRoomId" value="${chatRoomId}">
		<input type="password" maxlength="4" id="roomPw" name="roomPw" placeholder="비밀번호를 입력해주세요." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		<button id="btn_in_chat">입장</button>
	</form>
</div>


</body>
</html>