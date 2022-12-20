<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp">
	<jsp:param value="sporters - 채팅방목록" name="title" />
</jsp:include>
<body>


<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			<script>
	
				$(function(){
					fn_openChat();
				});
				
				var chatAddWindow;
			
				function fn_openChat(){
					$('#add_chat_room').click(function(){
						chatAddWindow = window.open('/chat/add', '실시간채팅', 'width=670,height=670,top=100,left=500,menubar=no,history=no');							
					});
				}
			
			
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
							<td>채팅방 이름</td>
							<td>인원 수</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${chatRoomList}" var="chatRoom">
							<td>${chatRoom.chatRoomTitle}</td>
							<td>${currUserCnt} / ${chatRoom.maxUsersCnt}</td>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" style="text-align: center;">
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