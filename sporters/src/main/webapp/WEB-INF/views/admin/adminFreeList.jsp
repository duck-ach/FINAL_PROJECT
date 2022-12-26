<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="자유게시판_관리자" name="title" />
</jsp:include>
<script>
	
	$(document).ready(function(){
		
		// 함수 호출
		fn_checkAll();
		fn_checkOne();
		fn_removeList();
		fn_iconNew();
		
		// 전체선택
		function fn_checkAll(){
			$('#check_all').click(function(){
				$('.check_one').prop('checked', $('#check_all').prop('checked'));
			});
		}
		
		// 개별선택
		function fn_checkOne(){
			$('.check_one').click(function(){
				var checkCount = 0;
				for(let i = 0; i < $('.check_one').length; i++){
					checkCount += $($('.check_one')[i]).prop('checked');				
				}
				$('#check_all').prop('checked', checkCount == $('.check_one').length);
			});
		}
		
		// 선택삭제
		function fn_removeList(){
			$('#frm_search').submit(function(event){
				if(confirm('선택한 모든 게시글을 삭제할까요?') == false){
					event.preventDefault();
					return;
				}
				if($('.check_one:checked').length == 0){
					alert('선택된 게시글이 없습니다.');
					event.preventDefault();
					return;
				}
			});
		}
		
		
	});
	
</script>

<body>


<section class="wrap">기본틀 1
	<section class="content_leyout_section">기본틀 2
		<div><a href="/free/write">글쓰러가기</a>  </div>
		<div> 여기부터 각자 내용 넣기 시작
			
			<form id="frm_search" method="post">										
				<br><hr><br>
				
				<table border="1">
					<thead>
						<tr>	
							<td>
							<label for="check_all" id="lbl_check_all">전체선택</label>
							<input type="checkbox" id="check_all" class="blind">
							</td>
							<td>글 제목</td>	
							<td>회원 아이디</td>						
							<td>회원 이름</td>
							<td>회원 성별</td>						
							<td>회원 핸드폰번호</td>												
							<td>회원 포인트</td>	 						 
							<td>작성 글 수</td>
							<td>삭제</td>
								
						</tr>
					</thead>
					<tbody id="list">						
						<c:forEach items="${galleryList}" var="gallery" varStatus="vs">
							<tr>
								<td><input type="checkbox" name="freeNoList" value="${gallery.freeNo}" class="check_one"></td>
								<td>${beginNo - vs.index}</td>						
								<td><a id="moveDetail"
									href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>									
								<td>${gallery.users.id}</td>
								<td>${gallery.users.nickname}</td>
								<td>${gallery.users.gender}</td>
								<td>${gallery.createDate}</td>
								<td>${gallery.hit}</td>
								
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				
			</form>
		
			<div class="div_paging">
				${paging}
			</div>
			
		</div>여기부터 각자 내용 넣기 끝
		
	</section>기본틀 2
	
</section>기본틀 1
	
 <jsp:include page="../layout/right_side.jsp"> --%>
 	<jsp:param value="right_side" name="right_side" /> --%>
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