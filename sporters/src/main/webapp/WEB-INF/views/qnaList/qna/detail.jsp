<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="${qna.qnaTitle}" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<body>
	<section class="wrap"><!-- 기본틀 1 -->
		<section class="content_leyout_section"><!-- 기본틀 2 -->
			<div>
				<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
				<div>${qna.qnaTitle}</div>
				<div>
					▷ 작성자  ${qna.qnaId}
					▷ 작성일  ${qna.qnaCreateDate}
				</div>
				
				<hr>
				
				<div>${qna.qnaContent}</div>
				
				<hr>
		
				<div id="reply_area">
					<div style="font-weight: bold;"> 답변 </div>
					<div id="reply_list"></div>
				</div>
				
				<c:if test="${loginUser.id == 'admin'}">
					<div>
						<form id="fmr_add_reply">
							<div>
								<span>
									<input type="text" name="qnaReplyContent" id="qnaReplyContent">
								</span>
								<span>
									<input type="button" value="답변 작성" id="btn_add_reply">
								</span>
							</div>
							<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
						</form>
					</div>
				</c:if>

				<hr>
		
				<div>
					<form id="frm_btn" method="post">
						<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
						<c:if test="${loginUser.id == qna.qnaId}">
							<input type="button" value="수정" id="btn_edit_qna">
							<input type="button" value="삭제" id="btn_remove_qna">
						</c:if>
					</form>
					<script>
						$('#btn_edit_qna').click(function(){
							$('#frm_btn').attr('action','/qna/edit');
							$('#frm_btn').submit();
						});
						$('#btn_remove_qna').click(function(){
							$('#frm_btn').attr('action','/qna/remove');
							$('#frm_btn').submit();
						});
					</script>
					<input type="button" value="목록" onclick="location.href='/qna/list'">
				</div>
			</div>
			
			<script>

				fn_addReply();
				fn_replyList();
				fn_removeReply();
			
				function fn_addReply(){
					$('#btn_add_reply').click(function(){
						if($('#qnaReplyContent').val() == '') {
							alert('답변 내용을 입력해주세요!');
							return;
						}
						$.ajax({
							type: 'post',
							url: '/qna/addReply',
							data: $('#fmr_add_reply').serialize(),
							dataType: 'json',
							success: function(resData){
								if(resData.isAdd){
									alert('답변이 등록되었습니다!');
									$('#qnaReplyContent').val('');
									fn_replyList();
								}
							}
						});
					});
				}
				
				function fn_replyList(){
					$.ajax({
						type: 'get',
						url: '/qna/replyList',
						data: 'qnaNo=${qna.qnaNo}',
						dataType: 'json',
						success: function(resData){
							$('#reply_list').empty();
							$.each(resData.qnaReplyList, function(i, reply){
								var div='';
								if(reply.depth == 0){
									div += '<div>';
								} else {
									div += '<div style="font-weight: bold;">';
								}
								if(reply.state == 1){
									div += '<div>';
									if(reply.depth > 0){
										div += '답변 : ';
									}
									div += reply.qnaReplyContent;
									if(${loginUser.id == 'admin'}){
										div += '<input type="button" value="답변삭제" class="btn_reply_remove" data-qna_reply_no="' + reply.qnaReplyNo + '">';
									}
									div += '</div>';
								} else {
									if(reply.depth == 0){
										div += '<div>삭제된 답변입니다.</div>';
									}
								}
								div += '<div>';
								div += '<form class="frm_reply">';
								div += '<input type="hidden" name="qnaNo" value="' + reply.qnaNo + '">';
								div += '<input type="hidden" name="groupNo" value="' + reply.groupNo + '">';
								div += '</form>';
								div += '</div>';
								
								$('#reply_list').append(div);
							});
						}
					});
				}
				
				function fn_removeReply(){
					$(document).on('click', '.btn_reply_remove', function(){
						if(confirm('답변을 삭제할까요?')){
							$.ajax({
								type: 'post',
								url: '/qna/replyRemove',
								data: 'qnaReplyNo=' + $(this).data('qna_reply_no'),
								dataType: 'json',
								success: function(resData){
									if(resData.isRemove){
										alert('답변이 삭제되었습니다.');
										fn_replyList();
									}
								}
							});
						}
					});
				}
				
				
				
			</script>
			
			
		</section><!-- 기본틀 2 -->
	</section><!-- 기본틀 1 -->


	
	
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