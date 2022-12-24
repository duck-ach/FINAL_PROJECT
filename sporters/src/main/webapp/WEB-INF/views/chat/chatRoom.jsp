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
	* {
		box-sizing: border-box;
	}
	.wrap {
		width: 640px;
		margin: 20px auto;
	}
	.btn {
		width: 60px;
	}
	.talking_content {
		width: 640px;
		height: 360px;
		overflow-y: scroll;
		border : 1px solid gray;
		background-color: #fff;
	}
	.message {
		width: 574px;
		height: 100px;
		display: inline-block;
		resize: none;
	}
	.message_area > * {
		vertical-align: top;
	}
	#btn_send {
		height: 100px;
	}
	.talking_content {
		position: relative;
		padding: 5px;
	}
	.small_text {
		font-size: 12px;
	}
	.my_message, .other_message {
		margin-bottom: 5px;
	}
	.my_message {
		text-align: right;
	}
	.other_message {
		text-align: left;
	}
	.my_message_content, .other_message_content {
		display: inline-block;
		max-width: 48%;
		border-radius: 3px;
	}
	.my_message_content {
		text-align: right;
		color:#fff;
		background-color: #8282FF;
	}
	.other_message_content {
		text-align: left;
		background-color: rgb(241,241,251);
	}
</style>
<script>
	
	// 새로고침 막기
	window.onload = function(){
		NotReload();
	}
	function NotReload(){
	    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	        event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	document.onkeydown = NotReload;

	// 채팅창 close할때 유저 DB에서 삭제
	$(window).on('unload', function() {
		$.ajax({
			type : 'POST',
			url : '/chat/close',
			data : $("#frm").serialize(),
			dataType : 'json'
		});

	});
	
	
</script>
</head>
<body>
	<form id="frm">
		<input type="text" name="userNo" value="${user.userNo}">
		<input type="text" id="id" name="nickname" value="${user.nickname}">
	</form>

	<div class="wrap">
		<div>
			<span>${chatRoom.chatRoomId}</span> | <span>${chatRoom.chatRoomTitle}</span>
			<span class="currUserCnt">${currUserCnt}</span> / <span>${chatRoom.maxUsersCnt}</span>
		</div>
		
		<div id="after_come_in">
			<strong id="login_id"></strong>
		</div>
		
		<hr>
		
		<div>대화창</div>
		<div id="talking_content" class="talking_content">
		</div>
		
		<div class="message_area">
			<textarea class="message" id="message" wrap="hard"></textarea>
			<input type="button" value="전송" class="btn" id="btn_send">
		</div>
		
	</div>
	
		<script>

		// socket on
		fn_socketOn();
		

		
		var ws;  // ChatServer
		var sendData = {};  // CharServer로 전송할 데이터는 JSON 형식

		// ChatServer로 메시지 보내는 함수
		function fn_send() {
			if($('#message').val().trim() != '') {
				sendData.id = $('#id').val();  // 작성자
				sendData.message = $('#message').val();  // 메시지
				sendData.date = new Date().toLocaleString();  // 날짜
				ws.send(JSON.stringify(sendData));  // CharServer로 전송
			}
			$('#message').val('');
		}
	
		$('#after_login').hide();
		
		
		function fn_socketOn() {
			// ChatServer와 연결
			var url = 'ws://' + location.host + '/chatserver';  // ws://localhost:9090/app16/chatserver 요청하면 ChatServer.java가 동작함
			ws = new WebSocket(url);
			
			// ChatServer에서 메시지가 도착하면 동작
			ws.onmessage = function(message) {
				
				var data = JSON.parse(message.data);
				
				if(data.id == $('#id').val()) {
					text = '<div class="my_message"><div class="my_message_content">';
				} else {
					text = '<div class="other_message"><div class="other_message_content">';
				}
				text += '<div class="small_text">'
				text += '<strong>' + data.id + '</strong>';
				text += '(' + data.date + ')';
				text += '</div>';
				text += '<pre style="white-space: pre-wrap;">' + data.message + '</pre>';
				text += '</div>';
				text += '</div>';
				
				$('#talking_content').append(text);  // 대화내용 추가하기
				$('#talking_content').scrollTop($('#talking_content').prop('scrollHeight'));  // 대화가 쌓이면 스크롤 내려주기
				
			};
		}
		
		
		$('#message').keyup(function(event){
			if(event.keyCode == 13 && !event.shiftKey) {  // keyCode가 13인 키는 Enter이므로 Enter를 눌렀다는 의미, Shift+Enter는 textarea에서 줄 바꿀 때 사용하므로 제외해야 함
				fn_send();
			}
		});
		
		$('#btn_send').click(function(){
			fn_send();
		});
		

	</script>
	
</body>
</html>