<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="/resources/css/button_go.css">
<style>
        #modal {
    display: none;
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 20;
    top: 34%;
}
        
        #modal h2 {
          margin:0;
        }
		#modal_close_btn {
          width:30px;
          height: 30px;
        }
        
        #modal .modal_content {
        display:flex;
        flex-direction: column;
        border-radius: 12px;
          width:400px;
          height: 260px;
          margin:10px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          
        }
        
        #modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
        
        .content_title_area{
        
        display: flex;
        margin-top: 1vw;       
	    flex-wrap: nowrap;
	    justify-content: space-between;
	}
	
	.content_title_area_right div{
	
		display: inline-block;
		vertical-align: text-top;
		padding: 0 0.3vw;
	}
	
	.content_title_area_right span{
		padding: 0 0.3vw;
	}
	
	.gogo_wright a{
		
	
	}
	
	
</style>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="자유게시판_상세" name="title" />
</jsp:include>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
	
		
	
	
	
		
		<div> <!-- 여기부터 각자 내용 넣기 시작 -->
			<div id="holder">

			<div class="button">
				<p class="gogo_wright btnText"><a href="/free/write">글쓰러가기</a> </p>			  
			    <div class="btnTwo">
			      <p class="btnText2">GO!</p>
			    </div>
			 </div>
		 
		 </div>
			
			<div class="content_title_area">
				<h1  class="content_title_area_left">[글제목] ▶ ${gallery.title}</h1>
				
				
				<div class="content_title_area_right">
					<div>
						<span>작성자 :</span>
						<span>${gallery.users.nickname}</span>						
					</div>
					
				</div>
				
			</div>
			
			<div>
				
				<span>▷ 작성일 <fmt:formatDate value="${gallery.createDate}" pattern="yyyy.M.d HH:mm"/></span>
				&nbsp;&nbsp;&nbsp;
				<span>▷ 수정일 <fmt:formatDate value="${gallery.modifyDate}" pattern="yyyy.M.d HH:mm"/></span>
				&nbsp;&nbsp;&nbsp;
				
			</div>
			
			<hr>
	
			<div>
				${gallery.content}
			</div>
			
			<div>
				<form id="frm_btn" method="post">	
					
					<input type="hidden" name="freeNo" value="${gallery.freeNo}">
					<c:if test="${loginUser.id == gallery.users.id}" >
						<input type="button" value="수정" id="btn_edit_gallery">
						<input type="button" value="삭제" id="btn_remove_gallery">
						<div id="root"><button type="button" id="modal_open_btn">신고쌔리기</button></div>
					</c:if>					
				</form>
			</div>
	
		   
		   <hr>
				
				
				
			<script>
			/*
					$(function(){
						consol.log(${gallery.users});
					});
				*/	
				
					$('#btn_edit_gallery').click(function(){
						$('#frm_btn').attr('action', '/free/edit');
						$('#frm_btn').submit();
					});
					$('#btn_remove_gallery').click(function(){
						if(confirm('게시글을 삭제하시겠습니까?')){
							$('#frm_btn').attr('action', '/free/remove');
							$('#frm_btn').submit();
						}
					});

			</script>

   <!-- 댓글영역 -->
   
	<span id="btn_comment_list">
		댓글
		<span id="comment_count"></span>개
	</span>
	
	<hr>
	
	<div id="comment_area" class="blind">
		<div id="comment_list"></div>
		<div id="paging"></div>
	</div>
   
   <!-- name="content", name="freeNo" 을 form 안에 넣은 이유 ? serialize()로 보내기 위해서 -->
   <!-- serialize()하면 form안에 있는 모든 name을 넘겨준다 -->
	<c:if test="${loginUser.id != null}">
	<div>
		<form id="frm_add_comment">
			<div class="add_comment">
				<div class="add_comment_input">
					<span>${loginUser.id}</span>
					<input type="text" name="commContent" id="comment">
				</div>
				<div class="add_comment_btn">
					<input type="button" value="작성완료" id="btn_add_comment">
				</div>
			</div>
			<input type="hidden" name="freeNo" value="${gallery.freeNo}">
		</form>
	</div>
	</c:if>		
		<c:if test="${loginUser.id == null}">
		<div>
			<div class="unlogin_comment">
				<span></span>
				<input type="text" name="commContent" id="content" placeholder="댓글을 작성하려면 로그인 해 주세요" readonly="readonly">
			</div>
		</div>
	</c:if>
	
	<!-- 현재 페이지 번호를 저장하고 있는 hidden -->
	<input type="hidden" id="page" value="1">
	   <script>
	   
		// 함수 호출
		fn_commentCount();
		// fn_switchCommentList();
		fn_addComment();
		fn_commentList();
		fn_changePage();
		fn_removeComment();
		fn_switchReplyArea();
		fn_addReply();
	      
	      // 함수 정의
	      function fn_commentCount(){
	         $.ajax({
	            type: 'get',
	            url: '/galleryFreeComm/getCount', 
	            data: 'freeNo=${gallery.freeNo}',   // 글번호 달아줌
	            dataType: 'json',
	            success: function(resData){  // resData = {"commentCount": 개수}
	               $('#comment_count').text(resData.commentCnt);
	            }
	         });
	      }
	      
	      function fn_switchCommentList() {
	         $('#btn_comment_list').click(function() {
	            $('#comment_area').toggleClass('blind');   // 토글을 줬다가 뺐다가
	         });
	      }
	      
		function fn_addComment(){
			$('#btn_add_comment').click(function(){
				alert('test');
				if($('#comment').val() == ''){
					alert('댓글 내용을 입력하세요');
               		return; // ajax 실행 막음
            	}
				$.ajax({
					type: 'post',
					url: '/galleryFreeComm/add',
					data: $('#frm_add_comment').serialize(),
					dataType: 'json',
					success: function(resData){  // resData = {"isAdd", true}
						if(resData.isAdd){
							alert('댓글이 등록되었습니다.');
							$('#comment').val('');
							fn_commentList();   // 댓글 목록 가져와서 뿌리는 함수
							fn_commentCount();  // 댓글 목록 개수 갱신하는 함수
						}
					}
				});
			});
		}
	      
	      function fn_commentList(){
	         $.ajax({
	            type: 'get',
	            url: '/galleryFreeComm/list',
	            data: 'freeNo=${gallery.freeNo}&page=' + $('#page').val(),   // 현재 page도 넘겨줘야 함
	            dataType: 'json',
	            success: function(resData){
	               /*
	                  resData = {
	                     "commentList": [
	                        {댓글하나},
	                        {댓글하나},
	                        ...
	                     ],
	                     "pageUtil": {
	                        page: x,
	                        ...
	                     }
	                  }
	               */
	               // 화면에 댓글 목록 뿌리기
	               $('#comment_list').empty();   // 목록 초기화 필수
	               $.each(resData.commentList, function(i, comment){
	                  // 댓글 depth: 0 이면 들어갈 필요 없고, 대댓 depth: 1 이면 한칸 들어가야 함, 1단이면 그룹오더 필요x
	                  console.log(comment.commContent);
	                  console.log(comment);
						var div = '';
						if(comment.depth == 0){
							div += '<div>';
						} else {
							div += '<div style="margin-left: 40px;">';
						}
	                  if(comment.state == 1) {   // state:1 정상, state:-1은 삭제라서 보여주면 x
	                     div += '<div>'
	                     div += comment.users.nickname + '<br>';
	                     div += comment.commContent;   // 정상일 때 내용 보여줌
	                     // 작성자, 로그인 유저만 댓글 삭제, 대댓글 가능
	                     if(${loginUser.id == 'admin'}) {
								div += '<input type="button" value="삭제" class="btn_comment_remove" data-comment_no="' + comment.freeCoNo + '">';
							} else if ('${loginUser.id}' == comment.users.id){
								div += '<input type="button" value="삭제" class="btn_comment_remove" data-comment_no="' + comment.freeCoNo + '">';
							}
	                     /*
							if(comment.commDepth == 0) {
							}if ('${loginUser.id}' == comment.users.id){
								div += '<input type="button" value="답글" class="btn_reply_area">';
							}
							*/
							div += '</div>';
						} else {
							if(comment.commDepth == 0) {
								div += '<div>삭제된 댓글입니다.</div>';
							} else {
								div += '<div>삭제된 답글입니다.</div>';
							}
						}
	                  // 날짜 형식 지정하는 자바스크립트 (moment-with-locales.js)
						div += '<div>';
						// moment.locale('ko-KR');
						// div += '<span style="font-size: 12px; color: silver;">' + moment(comment.commDate).format('YYYY. MM. DD hh:mm') + '</span>';
						div += '</div>';
						div += '<div style="margin-left: 40px;" class="reply_area blind">';
						div += '<form class="frm_reply">';
						div += '<input type="hidden" name="freeNo" value="' + comment.freeNo + '">';
						div += '<input type="hidden" name="groupNo" value="' + comment.groupNo + '">';
						div += '<input type="text" name="commContent" placeholder="답글을 작성하려면 로그인을 해주세요">';
						// 로그인한 사용자만 볼 수 있도록 if 처리
						div += '<input type="button" value="답글작성완료" class="btn_reply_add">';
						div += '</form>';
						div += '</div>';
						div += '</div>';
						$('#comment_list').append(div);
						$('#comment_list').append('<div style="border-bottom: 1px dotted gray;"></div>');
					});
	               // 페이징
	               $('#paging').empty(); // 초기화
					var pageUtil = resData.galleryPageUtil;
					var paging = '';
	               
	               // 이전 블록
						if(pageUtil.beginPage != 1) {
							paging += '<span class="enable_link" data-page="'+ (pageUtil.beginPage - 1) +'">◀</span>';
	                  // 태그를 클릭하면 몇 페이지로 가는 링크인지 넣자
	               }
						// 페이지번호
						for(let p = pageUtil.beginPage; p <= pageUtil.endPage; p++) {
							if(p == $('#page').val()){
								paging += '<strong>' + p + '</strong>';
							} else {
								paging += '<span class="enable_link" data-page="'+ p +'">' + p + '</span>';
							}
						}
	               // 다음 블록
	              if(pageUtil.endPage != pageUtil.totalPage){
						paging += '<span class="enable_link" data-page="'+ (pageUtil.endPage + 1) +'">▶</span>';
					}
					$('#paging').append(paging); // 페이지 뿌림
	            }
	         }); 
	      } // fn_commentList()
	      
			function fn_changePage(){
	         // $(만들어져있었던 부모).on('click', '.enable_link', (function() {  //  $('.enable_link').click(function() 만든 아이는 직접 볼 수 없다. 만들어져 있는 애만 직접 볼 수 있다.
	         $(document).on('click', '.enable_link', function() {
	            $('#page').val( $(this).data('page') );   // page value값이 fn_commentList() 할 때마다 넘어감 => $('#page').val 값을 바꿔서 다시 요청
	            fn_commentList();   // 목록을 다시 가져와라
	         });
	      }
	         
	      function fn_removeComment() {
	         $(document).on('click', '.btn_comment_remove', function(){
	               if(confirm('삭제된 댓글은 복구할 수 없습니다. 댓글을 삭제할까요?')) {
	                  $.ajax({
	                     type: 'post',
	                     url: '/galleryFreeComm/remove',
	                     data: 'freeCoNo=' + $(this).data('comment_no'), // 코멘트 번호에 삭제버튼 넣어놨음
	                     dataType: 'json',
	                     success: function(resData) {   // resData = {"isRemove" : true}
	                        if(resData.isRemove) {
	                           alert('댓글이 삭제되었습니다.');
	                           fn_commentList();   // 댓글 목록 가져와서 뿌리는 함수
	                           fn_commentCount();  // 댓글 목록 개수 갱신하는 함수
							}
							}
						});
					}
				});
			}
	
	      function fn_switchReplyArea(){
				$(document).on('click', '.btn_reply_area', function(){
					$(this).parent().next().next().toggleClass('blind');
				});
			}
	      function fn_addReply(){
				$(document).on('click', '.btn_reply_add', function(){
					if($(this).prev().val() == ''){
						alert('답글 내용을 입력하세요.');
						return;
					}
					$.ajax({
						type: 'post',
						url: '/galleryFreeComm/reply/add',
						data: $(this).closest('.frm_reply').serialize(),  // 이건 안 됩니다 $('.frm_reply').serialize(),
						dataType: 'json',
						success: function(resData){  // resData = {"isAdd", true}
							if(resData.isAdd){
								alert('답글이 등록되었습니다.');
								fn_commentList();
								fn_commentCount();
							}
						}
					});
				});
			}
	   </script> 		
			
			
			
			
			
		</div><!-- 여기부터 각자 내용 넣기 끝 -->
		
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
<div id="modal">
   
    <div class="modal_content">
    <form action="admin/userSingo" method="post">
        <h2> 게시글 신고하기</h2>
        <button type="button" name="singoCategory" id="modal_close_btn">X</button>
        <select>
        <option>광고</option>
        <option>도배</option>
        <option>음란물</option>
        <option>욕설</option>
        <option>개인정보침해</option>
        <option>저작권침해</option>
        <option>기타</option>
        </select>
        <textarea name="singoContent" placeholder="신고 내용" maxlength="200" style="width: 400px; height: 191px; resize:none;" ></textarea>
        <br>
        <input type="submit" name="신고">
    </form>
       
    </div>
   
    <div class="modal_layer"></div>
</div>
<script>
    document.getElementById("modal_open_btn").onclick = function() {
        document.getElementById("modal").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }   
</script>

</body>
</html>