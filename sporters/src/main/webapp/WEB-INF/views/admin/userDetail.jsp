<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){

	});
	
	
		
		function fn_goodCheck(){
			$.ajax({
				url: '/heart/getHeartCheck',
				type: 'get',
				data: 'userNo=${loginUser.userNo}',
				dataType: 'json',
				success: function(resData){
					if (resData.count == 0) {
						$('#heart').text('♥');
						$('#good').removeClass("good_checked");
					} else {
						$('#heart').text('LIKE ♡');
						$('#good').addClass("good_checked");
					}
				}
			});
		}
		
		function fn_goodCount(){
			$.ajax({
				url: '/heart/getHeartCount',
				type: 'get',
				data: 'userNo=${loginUser.userNo}',
				dataType: 'json',
				success: function(resData){
					$('#good_count').empty();
					$('#good_count').text(resData.count + '점');
				}
			});
		}
		
		function fn_pressGood(){
			$('#lnk_good').click(function(){
				// 로그인을 해야 "좋아요"를 누를 수 있다.
				if('${loginUser.userNo}' == ''){
					alert('해당 기능은 로그인이 필요합니다.');
					return;
				}
				// 셀프 좋아요 방지
				if('${loginUser.userNo}' == ''){
					alert('본인에게는 "좋아요"를 누를 수 없습니다.');
					return;
				}
				// "좋아요" 선택/해제 상태에 따른 하트 변경
				$('#good').toggleClass("good_checked");
				if ($('#good').hasClass("good_checked")) {
					$('#heart').text('LIKE ♥');
				} else {
					$('#heart').text('LIKE ♡');
				}
				// "좋아요" 처리
				$.ajax({
					url: '/heart/mark',
					type: 'get',
					data: 'userNo=${loginUser.userNo}',
					dataType: 'json',
					success: function(resData){
						if(resData.isSuccess) {
							fn_goodCount();							
						}
					}
				});
			});
		}
		
		function fn_hateCount(){
			$.ajax({
				url: '/heart/getHateCount',
				type: 'get',
				data: 'userNo=${loginUser.userNo}',
				dataType: 'json',
				success: function(resData){
					$('#hate_count').empty();
					$('#hate_count').text(resData.count + '점');
				}
			});
		}
		
		function fn_pressHate(){
			$('#lnk_hate').click(function(){
				// 로그인을 해야 "좋아요"를 누를 수 있다.
				if('${loginUser.userNo}' == ''){
					alert('해당 기능은 로그인이 필요합니다.');
					return;
				}
				// 셀프 좋아요 방지
				if('${loginUser.userNo}' == ''){
					alert('본인에게는 "싫어요"를 누를 수 없습니다.');
					return;
				}
				// "좋아요" 선택/해제 상태에 따른 하트 변경
				$('#hate').toggleClass("hate_checked");
				if ($('#hate').hasClass("hate_checked")) {
					$('#hater').text('HATE ♥');
				} else {
					$('#hater').text('HATE ♡');
				}
				// "좋아요" 처리
				$.ajax({
					url: '/heart/markhate',
					type: 'get',
					data: 'userNo=${loginUser.userNo}',
					dataType: 'json',
					success: function(resData){
						if(resData.isSuccess) {
							fn_hateCount();							
						}
					}
				});
			});
		}
		
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div style="font-size: 24px; font-weight: bold;"> 회원 상세 정보 </div>
				<div>
					프로필사진
				</div>
				<div>
					<div>
						닉네임 : ${loginUser.nickname}
					</div>
					<div>

						
						<a id="lnk_good">
							<span id="good">좋아요 : </span><span id="good_count"></span><br>
							<span id="heart"></span>
						</a>
						<hr>
						<a id="lnk_hate">
							<span id="hate">싫어요 : </span><span id="hate_count"></span><br>
							<span id="hater"></span>
						</a>
						
					</div>
					<div>
						가입일 : ${loginUser.joinDate}
					</div>
				</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>