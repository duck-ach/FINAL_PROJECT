<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="sporters - 채팅방목록" name="title" />
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<style>

</style>
<body>


<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			<script>
	
				$(function(){
					fn_openChat();
					// fn_userLimit();
				});
				
				var chatAddWindow;
			
				// 채팅방 입장
				function fn_openChat(){
					$('#add_chat_room').click(function(){
						chatAddWindow = window.open('/chat/write', '실시간채팅', 'width=900,height=670,top=100,left=500,menubar=no,history=no');							
					});
				}
				
				// 채팅방 인원 제한
/* 				function fn_userLimit() {
					$('.btn_in_chat').click(function(){
						$.ajax({
							type: 'post',
							url : '/chat/chatRoom',
							data: 'chatRoomId=',
							dataType : 'json',
							success: function() 
						});
					});
				} */
			
			</script>
		
			<h1>채팅하기</h1>
			<hr>
			<div>
				<input type="button" value="채팅방 생성" id="add_chat_room"/>
			</div>
			<div>
				<table border="1">
					<thead>
						<tr>
							<td>채팅방 번호</td>
							<td>채팅방 이름</td>
							<td>인원 수</td>
							<td>입장하기</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${chatRoomList}" var="chatRoom">
							<tr>
								<td>${chatRoom.chatRoomId}</td>
								<c:if test="${chatRoom.isPw == '1'}">
									<td class="chat_room_name">${chatRoom.chatRoomTitle}&nbsp;<i class="fa-solid fa-lock"></i></td>
								</c:if>
								<c:if test="${chatRoom.isPw == '0'}">
									<td class="chat_room_name">${chatRoom.chatRoomTitle}</td>
								</c:if>
								<td><span class="currUserCnt">${currUserCnt}</span><span> / </span><span>${chatRoom.maxUsersCnt}</span><input type="hidden" value="${chatRoom.maxUsersCnt}" class="maxUserCnt"></td>
								<c:if test="${chatRoom.isPw == '1'}">
									<td><input type="button" class="btn_in_chat" value="입장" onclick="window.open('/chat/chatRoom/lock?chatRoomId=${chatRoom.chatRoomId}', '실시간채팅', 'width=900,height=670,top=100,left=500,menubar=no,history=no')"></td>
								</c:if>
								<c:if test="${chatRoom.isPw == '0'}">
									<td><input type="button" class="btn_in_chat" value="입장" onclick="window.open('/chat/chatRoom?chatRoomId=${chatRoom.chatRoomId}', '실시간채팅', 'width=900,height=670,top=100,left=500,menubar=no,history=no')"></td>
								</c:if>
							</tr>						
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								${paging}
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			
		</div><!-- 여기부터 각자 내용 넣기 끝 -->
		
	</section><!-- 기본틀 2 -->
	
</section><!-- 기본틀 1 -->

<jsp:include page="../layout/right_side.jsp">
	<jsp:param value="right_side" name="right_side" />
</jsp:include>

<script type="text/javascript">
$(function(){
	 var right_side =  $('.content_leyout_section').offset().top;
	var my_right_side = $('.right_side_menu_area').width();
	var right_side_marginLeft = $('.content_leyout_section').width() + my_right_side*2 ;


	 $('.right_side_menu_area').offset({top:right_side});
	 $('.right_side_menu_area').css({marginLeft:right_side_marginLeft  });
	 
	 // content_leyout 현재 높이값을 구함. 
	 var left_side_top =  $('.content_leyout_section').offset().top;
	 var right_side_marginLeft = $('.content_leyout_section').offset().left;

	// 왼쪽 사이드 메뉴의 넓이값을 구함
	var my_left_side =right_side_marginLeft -  $('.left_side_gnd_area').width() - my_right_side;
	var left_side_marginLeft = $('.content_leyout_section').width();


	 $('.left_side_gnd_area').offset({top:left_side_top});	 
	 
	
}); 
</script>

</body>
</html>