<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	
	$(function(){
		fn_isheartCheck();
		fn_goodCheck();
		fn_goodAndHate();
		fn_goodCount();
		fn_hateCount();
		fn_pressGood();
		fn_pressHate();
	});
	
	// 좋아요,싫어요 눌렀는지 확인
		function fn_isheartCheck(){
			$.ajax({
				type: 'get',
				url: '/heart/isHeartCheck',
				data: '&userNo=' + $('#userNo').val(),
				dataType: 'json',
				success: function(resData){
					if(resData.isHeart == 0){
						alert('좋아요 싫어요 중 하나만 눌러주세요!');
					}
				}
			});
		}
	
		// 좋아요 눌렀는지 확인
		function fn_goodCheck(){
			$.ajax({
				url: '/heart/getHeartCheck',
				type: 'get',
				data: 'clickUserNo=${loginUser.userNo}&userNo=' + $('#userNo').val(),
				dataType: 'json',
				success: function(resData){
					if (resData.count == 0) {
						$('#heart').text('♥');
						$('#good').removeClass("good_checked");
						
					} else {
						$('#hater').text('♥');
						$('#hate').removeClass("hate_checked");
					}
				}
			});
		}
		
		// 좋아요 개수 카운트
		function fn_goodCount(){
			$.ajax({
				url: '/heart/getHeartCount',
				type: 'get',
				data: 'clickUserNo=${loginUser.userNo}&userNo=' + $('#userNo').val(),
				dataType: 'json',
				success: function(resData){
					$('#good_count').empty();
					$('#good_count').text(resData.heartcount);
				}
			});
		}
		
		// 좋아요 누른 경우
		function fn_pressGood(){
			$('#lnk_good').click(function(){
				// 로그인을 해야 "좋아요"를 누를 수 있다.
				if('${loginUser.userNo}' == ''){
					alert('해당 기능은 로그인이 필요합니다.');
					return;
				}
				// 셀프 좋아요 방지
				if('${loginUser.userNo}' == '${user.userNo}'){
					alert('본인에게는 "좋아요"를 누를 수 없습니다.');
					return;
				}
				// "좋아요" 선택/해제 상태에 따른 하트 변경
				$('#good').toggleClass("good_checked");
				$('#hate').toggleClass('blind');

				// "좋아요" 처리
				$.ajax({
					url: '/heart/markLike',
					type: 'get',
					data: 'clickUserNo=${loginUser.userNo}&userNo=' + $('#userNo').val(),
					dataType: 'json',
					success: function(resData){
						if(resData.isSuccess) {
							fn_goodCount();							
						}
					}
				});
			});
		}
		
		// 싫어요 개수 카운트
		function fn_hateCount(){
			$.ajax({
				url: '/heart/getHateCount',
				type: 'get',
				data: 'clickUserNo=${loginUser.userNo}&userNo=' + $('#userNo').val(),
				dataType: 'json',
				success: function(resData){
					$('#hate_count').empty();
					$('#hate_count').text(resData.hatecount);
				}
			});
		}
		
		
		// 싫어요 누른 경우
		function fn_pressHate(){
			$('#lnk_hate').click(function(){
				// 로그인을 해야 "좋아요"를 누를 수 있다.
				if('${loginUser.userNo}' == ''){
					alert('해당 기능은 로그인이 필요합니다.');
					return;
				}
				// 셀프 좋아요 방지
				if('${loginUser.userNo}' == '${user.userNo}'){
					alert('본인에게는 "싫어요"를 누를 수 없습니다.');
					return;
				}
				// "좋아요" 선택/해제 상태에 따른 하트 변경
				$('#hate').toggleClass("hate_checked");
				$('#good').toggleClass('blind');

				// "싫어요" 처리
				$.ajax({
					url: '/heart/markhate',
					type: 'get',
					data: 'clickUserNo=${loginUser.userNo}&userNo=' + $('#userNo').val(),
					dataType: 'json',
					success: function(resData){
						if(resData.isSuccess) {
							fn_hateCount();							
						}
					}
				});
			});
		}
		
		// 조아요싫어요 개수 카운트
		function fn_goodAndHate(){
			$.ajax({
				url: '/heart/likeNhate',
				type: 'get',
				data: 'clickUserNo=${loginUser.userNo}&userNo=' + $('#userNo').val(),
				dataType: 'json',
				success: function(resData){
					$('#good_hate_count').empty();
					$('#good_hate_count').text(resData.result);
				}
			});
		}
		
	
</script>
<style>
	.blind {
		display: none;
	}
</style>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div style="font-size: 24px; font-weight: bold;"> 회원 상세 정보 </div>
				<input type="hidden"  id="userNo" name="userNo" value="${user.userNo}">
				<div>
					프로필사진
				</div>
				<div>
					<div>
						닉네임 : ${user.nickname}
					</div>
					<div>
						호감도 : <span id="good_hate_count"></span>
					</div>
					<div>
						<span id="good">
							<a id="lnk_good">
								<span>좋아요 : </span><span id="good_count"></span>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;            
							</a>
						</span>
						<span id="hate">
							<a id="lnk_hate">
								<span>싫어요 : </span><span id="hate_count"></span><br>
							</a>
						</span>
						
					</div>
					<div>
						가입일 : ${user.joinDate}
					</div>
				</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>